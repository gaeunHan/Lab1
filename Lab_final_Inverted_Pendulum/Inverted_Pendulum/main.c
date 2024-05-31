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

#define ENCPULSE 1024.0
#define initSWUPcartPos 500.0

// timer varriable
unsigned int TINTCnt;
unsigned int timerCheckCnt;

// reference pos of pendulum and cart
float R_pend = 180.0;
float R_cart = 0.0;
float R_swup_cart = 0.0;

// mode control variable
enum MODE mode;

// cart pos variables for swing-up
float rightSWUPcartPos = initSWUPcartPos;
float leftSWUPcartPos = -initSWUPcartPos;

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

float PWMOut(float dutyratio)
{
	/*
		1. -50.0 <= dutyratio <= 50.0, 이에 해당하는 0~100% PWM 파형 발생시킨다. 
		2. 출력 파형의 PWM duty는 0 또는 100% duty로 saturation 되어야 함.
	*/

	float duty; 		
	
	//saturation
	if (dutyratio < -49.5) {
		dutyratio = -49.5;
	}

	if (dutyratio> 49.5) {	
		dutyratio = 49.5;
	}

	// dutyration <-> PWM conversion
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMLEFT = duty;

	return dutyratio;  
}

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
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 바퀴 1회전당 1024 pulse
	return rotationDeg;
}

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
	rotationDeg = signed_encbit * (360.0 / (ENCPULSE)); // 바퀴 1회전당 1024 pulse

	return rotationDeg;
}

void swingUp(){		
	// reduce energy as the pendulum going higher;
	rightSWUPcartPos = rightSWUPcartPos - mostPlusPos;
	leftSWUPcartPos = leftSWUPcartPos + mostMinusPos;

	// start by moving cart to the right: move pendulum to the left
	if(y_pend == 0 && prevPendPos == 0){
		R_swup_cart = initSWUPcartPos;
	}

	// from the right side: move cart to the right
	else if(prevPendPos > 0){
		if(mostPlusPos <= 90){
			if(prevPendPos == mostPlusPos) R_swup_cart = rightSWUPcartPos;
		}
		else if(mostPlusPos > 90 && mostPlusPos < 180){
			if(prevPendPos > y_pend && y_pend == 90) R_swup_cart = rightSWUPcartPos;
		}
	}

	// from the left side: move cart to the left
	else if(prevPendPos < 0){
		if(mostMinusPos >= -90){
			if(prevPendPos == mostMinusPos) R_swup_cart = leftSWUPcartPos;
		}
		else if(mostMinusPos < -90 && mostMinusPos < -180){
			if(prevPendPos < y_pend && y_pend == -90) R_swup_cart = leftSWUPcartPos;
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

		if(mode == SWINGUP){
			swingUp();
		}

		// if the pendulum is located within balancing range, change the mode
		if(y_pend >= 170 || y_pend <= 190){
			mode = BALANCING;
		}

		// debugging
		if(TINTCnt > 500){

			timerCheckCnt++;
			MACRO_PRINT((tmp_string, "==== Timer Check: %d ====\r\n", timerCheckCnt));

			// check current pendulum position
			MACRO_PRINT((tmp_string, "pendulum pos: %6.2f \r\n", GetPendulumPos() ));

			// check current cart position
			MACRO_PRINT((tmp_string, "cart encoder: %6.2f \r\n", GetCartPos())); 
			
			// swing-up debugging
			MACRO_PRINT((tmp_string, "<< Swing-up debugging >> \r\n")); 
			MACRO_PRINT((tmp_string, "   mostPlusPos: %6.2f \r\n", mostPlusPos)); 
			MACRO_PRINT((tmp_string, "   prevPendPos: %6.2f \r\n", prevPendPos)); 
			MACRO_PRINT((tmp_string, "   remainedAngleToTheGoal: %6.2f \r\n", remainedAngleToTheGoal)); 

			MACRO_PRINT((tmp_string, "\r\n"));
			TINTCnt = 0;
		}
	}
}

