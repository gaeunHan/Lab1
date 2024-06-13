/* Main.c */

#include <c6x.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "c6701.h"
#include "constant.h"
#include "typedef.h"
#include "bss.h"
#include "function.h"
#include "USBMon.h"

// encoder pulse per one rotation
#define ENCPULSE 1024.0

// timer varriable
unsigned int TINTCnt;
unsigned int timerCheckCnt;

// reference pos of pendulum and cart
float R_pend = 180.0;
float R_cart = 0.0;
float R_swup_cart = 500.0; // move the cart to the 500.0 position first to make a swing

// mode control variable
enum MODE mode;

void InitEXINTF()
{
	// Disable SSCEN(bit#5), CLK1EN(bit#4), CLK2EN(bit#3)
	*GBLCTL &= 0xFFFFFFC7;

	// IOCS0: Async 32bit Mode, Setup 0 and Strobe 3, Hold 1  
	*CECTL0 = 	(0x00 << 28)	|	// (4-bit) WriteSetup[31:28]
				(0x03 << 22)	|	// (6-bit) WriteStrobe[27:22]
				(0x01 << 20)	|	// (2-bit) WriteHold[21:20]
				(0x00 << 16)	|	// (4-bit) ReadSetup[19:16]
				(0x00 << 14)	|	// (2-bit) Rsvd[15:14]
				(0x03 <<  8)	|	// (6-bit) ReadStrobe[13:8]
				(0x00 <<  7)	|	// (1-bit) Rsvd[7]
				(0x02 <<  4)	|	// (3-bit) MType[6:4]
				(0x00 <<  2)	|	// (2-bit) Rsvd[3:2]
				(0x01 <<  0)	;	// (2-bit) ReadHold[1:0]

	// IOCS2: Async 32bit Mode, Setup 2 and Strobe 5, Hold 1
	*CECTL2 =	(0x02 << 28)	|	// (4-bit) WriteSetup[31:28]
				(0x05 << 22)	|	// (6-bit) WriteStrobe[27:22]
				(0x01 << 20)	|	// (2-bit) WriteHold[21:20]
				(0x02 << 16)	|	// (4-bit) ReadSetup[19:16]
				(0x00 << 14)	|	// (2-bit) Rsvd[15:14]
				(0x05 <<  8)	|	// (6-bit) ReadStrobe[13:8]
				(0x00 <<  7)	|	// (1-bit) Rsvd[7]
				(0x02 <<  4)	|	// (3-bit) MType[6:4]
				(0x00 <<  2)	|	// (2-bit) Rsvd[3:2]
				(0x01 <<  0)	;	// (2-bit) ReadHold[1:0]
}

void InitTimer()
{
	// Hold 0 and Go 0, Internal Clock Source (160Mhz/4), Clock Mode   
	*T0CTL |= 0x00000300;

	// Timer Period
	*T0PRD = (CPU_FRQ/4.0f)/(2.0f*TIMER_FRQ);	// f = 40Mhz/2*Period 

	// Hold 1 and Go 1   
	*T0CTL |= 0x000000C0;
}

void InitINT()
{
	// Enable CPU Interrupt INT06(EXTINT6), INT14(TINT0) and NMI
	IER |= 0x00004042;
}

void GIE()
{
	// Global Interrupt Enable
	CSR |= 0x00000001;
}

// Caution: The delayed time is not exact.
void delay_us(unsigned int time_us)
{
	register unsigned int i;

	for (i = 0; i < (time_us * 14); i++) ;
}

// Caution: The delayed time is not exact.
void delay_ms(unsigned int time_ms)
{
	register unsigned int i;

	for (i = 0; i < time_ms; i++) {
		delay_us(1000);
	}
}

// Wait until timer interrupt
void WaitTFlag()
{
	while (!TFlag) ;
	TFlag = 0;
}

// Waiting time = (Timer Period) * cnt
void WaitTFlagCnt(unsigned int cnt)
{
	unsigned int i;

	TFlag = 0;

	for (i=0; i<cnt; i++) {
		WaitTFlag();
	}
}

// make a PWM signal between -50~50 duty ratio (with 0.5 safety)
float PWMOut(float dutyratio)
{
	float duty; 		
	
	//saturation with 0.5 safety
	if (dutyratio < -49.5) {
		dutyratio = -49.5;
	}

	if (dutyratio> 49.5) {	
		dutyratio = 49.5;
	}

	// dutyratio <-> PWM conversion
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMLEFT = duty;

	return dutyratio;  
}

// get current cart position from the encoder
float GetCartPos(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// masking: left only the last 16bits
	encbit = *ENCPOSR & 0xFFFF;

	// converse into signed decimal number
	if (encbit <= 0x7FFF) signed_encbit = encbit;
	else signed_encbit = encbit - 65536;

	// calc rotation degree depends on the resolution
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 1024 pulse per one rotation
	return rotationDeg;
}

// get current cart pendulum from the encoder
float GetPendulumPos(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// masking: left only the last 16bits
	encbit = *ENCPOSL & 0xFFFF;

	// converse into signed decimal number
	if (encbit <= 0x7FFF) signed_encbit = encbit;
	else signed_encbit = encbit - 65536;

	// calc rotation degree depends on the resolution
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 1024 pulse per one rotation

	return rotationDeg;
}

int swingUpDirection = 1; 	// 1: move the cart to the right, 0: left
int WaitCnt = 400;			// PWM duration
float u = 30.0;				// PWM duty ratio

// make a swing-up
void SwingUpControl(){	
	// during the PWM duration: 
	// decide the cart direction and PWM duration according to the highest position of pendulum
	if (TINTCnt < WaitCnt){
		if (swingUpDirection) {
			if (mostPlusPos > 155 && mostPlusPos < 180 || mostMinusPos < -150 && mostMinusPos > -180){
				u = 30;
				WaitCnt =25;
				PWMOut(u);
			} 
			else if (mostPlusPos > 90 && mostPlusPos <= 155 || mostMinusPos < -90 && mostMinusPos >= -155){
				u = 27;
				PWMOut(-u);
			}
			else{
				u = 30;
				PWMOut(-u);
			}
		}
		else{
			if (mostPlusPos > 155 && mostPlusPos < 180 || mostMinusPos < -150 && mostMinusPos > -180){
				u = 30;
				WaitCnt = 25;
				PWMOut(-u);
			} 
			else if (mostPlusPos > 90 && mostPlusPos <= 155 || mostMinusPos < -90 && mostMinusPos >= -155){
				u = 27;
				PWMOut(u);
			}
			else{
				u = 30;
				PWMOut(u);
			}
		}
	} 

	// if the PWM duration is over: 
	// change the cart direction and adjust PWM duration according to the highest position of pendulum
	else{
		TINTCnt = 0;
		swingUpDirection = !swingUpDirection;
		if(mostPlusPos < 90.0 || mostMinusPos < -100){
			WaitCnt += 20;
		} 
		else if(mostPlusPos >= 100.0 || mostMinusPos <= -100){
			WaitCnt -= 20;
		} 
	}
}

void main()
{
	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable(External INT and Timer INT)
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2024));
	MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;

	GIE();
	*FPGALED = 1;			// FPGA LED 1 : ON, 0 : OFF
	*PWMDRVEN = 1;			// PWMENABLE 1 : ON, 0 : 0FF
	*ENCPOSCLR = 1;			// Encoder position initialization

	WaitTFlagCnt(1000);	// execute program after waiting 1 sec

	TINTCnt = 0;	// timer varable init
	mode = SWINGUP; // start with swing-up
	
	while (1) {
		*FPGALED ^= 1;

		// start with swing-up 
		if(mode == SWINGUP){
			SwingUpControl();
		}

		// if the pendulum is located within balancing range, change the mode
		if(y_pend >= 170 && y_pend <= 190){
			mode = BALANCING;
		}
	}
}
