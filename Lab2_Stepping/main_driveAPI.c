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
	while (!TFlag) ;	// interrupt 발생 시 TFlag가 1이 됨. 
	TFlag = 0;			// 즉, interrupt 발생까지 기다리고 함수 terminate. 
}

// Waiting time = (Timer Period) * cnt
void WaitTFlagCnt(unsigned int cnt)
{
	unsigned int i;

	TFlag = 0;

	for (i=0; i<cnt; i++) {
		WaitTFlag();	// interrupt 발생해야 함수 return. 
	} // cnt 개수만큼 interrupt 발생 기다림. 
}

// rotate the motor by one step
int currPhaseIdx;
void OneStepMove(unsigend int dir, unsigned int tDelayCnt){
    int phase[4] = {0x2, 0x8, 0x1, 0x4}; // Right Stepping Motor Phase: A, B, /A, /B
    int idx;
    int setPhase; 

    idx = currPhaseIdx;

    // CW: A, B, /A, /B
    if(dir == 0){        
        setPhase = phase[idx];

        if(idx == 3) idx = -1;
        idx++;        
    }
    
    // CCW: A, /B, /A, B
    else if(dir == 1){
        setPhase = phase[idx];

        if(idx == 0) idx = 4;
        idx--;
        
    }
    // phase update
    currPhaseIdx = idx;
    
    // drive the motor
    *STEPPER = setPhase;
    WaitTFlagCnt(tDelayCnt);    
}

// rotate the motor by angle(angle: degree, spd: [deg/s])
#define STEP_ANGLE = 1.8f;  // step angle = 1.8 deg
void StepMoveCV(float angle, float spd){
    int step;
    int dir;
    float stepDelayTime;
    unsigned int delayCnt;

    step = round((float)angle / STEP_ANGLE); // 반올림해서 정수 step 값 작성
    dir = (angle > 0) ? 0 : 1; // 입력된 angle이 양수: CW, 음수: CCW
    stepDelayTime = (float)STEP_ANGLE / (float)spd; // delay_btn_step = stepAngle/vel
    delayCnt = 1e5 * stepDelayTime; // current intrpt freq = 100kHz -> 1e5 makes 1sec

    // rotate the motor by the input angle
    int i;
    for(i = 0; i<step; i++){
        OneStepMove(dir, delayCnt);
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

    currPhaseIdx = 0; // set the initial phase: A

	WaitTFlagCnt(10000); // start program after 1sec   
////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // verify OneStepMove by running the motor 3 steps in CW with 1 sec delay 
    OneStepMove(0, 1); 
    OneStepMove(0, 1);
    OneStepMove(0, 1);

    // verify StepMoveCV
    StepMoveCV(360, 180); // rotate 360 degrees in 2 sec


	while (1) {} // block to terminate
}

