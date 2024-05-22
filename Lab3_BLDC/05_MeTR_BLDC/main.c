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

int PWMD;
int PWMH;
int PWML;
float uSat;
#define PWMZ 0x800
void PWMOut(float dutyratio) // -100.0 <= dutyratio <= 100.0, 대칭되는 PWMH, PWML값 생성
{
	float PWMduty; 	
	
	// saturation with 0.5 safety zone
	if(dutyratio > 100) dutyratio = 100;
	if(dutyratio < -100) dutyratio = -100;

	// dutyratio <-> PWM conversion
	PWMduty = dutyratio * 0x7FF / 100.0;	

	// calc PWMH and PWML
	PWMD = PWMduty;
	PWMH = PWMZ + PWMD;
	PWML = PWMZ - PWMD;

	uSat = dutyratio;
}


float angleFromHallCount(int hallCnt){
	return hallCnt * 360.0 / 324.0;
}

int hallCount = 0;
unsigned int prevHall;
unsigned int currHall;
float currAngle;
void BLDCDrive(float duty){

	// set PWM value
	PWMOut(duty);

	// read current Hall sensor value
	currHall = *BLDCHALL & 0x7;

	// set phase considering current Hall sensor value
	switch(currHall){
		case 2:		// phase 2(ZLH)
			*BLDC2 = PWMZ;
			*BLDC1 = PWML;
			*BLDC0 = PWMH;
			if(prevHall == 6) hallCount++;
			if(prevHall == 3) hallCount--;
			break;
		case 3:		// phase 3(HLZ)
			*BLDC2 = PWMH;
			*BLDC1 = PWML;
			*BLDC0 = PWMZ;
			if(prevHall == 2) hallCount++;
			if(prevHall == 1) hallCount--;
			break;
		case 1:		// phase 4(HZL)
			*BLDC2 = PWMH;
			*BLDC1 = PWMZ;
			*BLDC0 = PWML;
			if(prevHall == 3) hallCount++;
			if(prevHall == 5) hallCount--;
			break;
		case 5:		// phase 5(ZHL)
			*BLDC2 = PWMZ;
			*BLDC1 = PWMH;
			*BLDC0 = PWML;
			if(prevHall == 1) hallCount++;
			if(prevHall == 4) hallCount--;
			break;
		case 4:		// phase 6(LHZ)
			*BLDC2 = PWML;
			*BLDC1 = PWMH;
			*BLDC0 = PWMZ;
			if(prevHall == 5) hallCount++;
			if(prevHall == 6) hallCount--;
			break;
		case 6:		// phase 1(LZH)
			*BLDC2 = PWML;
			*BLDC1 = PWMZ;
			*BLDC0 = PWMH;
			if(prevHall == 4) hallCount++;
			if(prevHall == 2) hallCount--;
			break;
	}

	// update previous Hall count value
	prevHall = currHall;

	// calculate current angle from hall count
	currAngle = angleFromHallCount(hallCount);
}

float refAngle;
void main()
{
	int i;
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

	*BLDCEN = 1;	// BLDC Motor Driver Enable

	WaitTFlagCnt(100);

	refAngle = -360.0;
	prevHall = *BLDCHALL & 0x7;

	// drive motor by reference angle
	while (1) {
		BLDCDrive(uControlInput);
	}

	// for debugging - currently while() is deactivated
	while (0) {
		for(i=0; i<10000; i++){
			BLDCDrive(uControlInput);
		}
		MACRO_PRINT((tmp_string, "currAngle: %.2f\r\n\r\n", currAngle));
	}
	
}
