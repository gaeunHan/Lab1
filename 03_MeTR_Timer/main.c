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

	if (dutyratio> 50.0) {	
		dutyratio = 50.0;
	}

	// dutyration <-> PWM conversion
	duty = (dutyratio + 50) * 0xfff/100.0;

	*PWMRIGHT = duty;

	return dutyratio;  
}

float GetAngle(){
	short encbit;
	signed int signed_encbit;
	float rotationDeg;

	// masking: left only the last 16bits
	encbit = *ENCPOSR & 0xFFFF;

	// converse into signed decimal number
	if (encbit <= 0x7FFF) signed_encbit = encbit;
	else signed_encbit = encbit - 65536;

	// calc rotation degree depends on the resolution
	rotationDeg = signed_encbit * (360.0 / (512.0 * 7.5)); // 바퀴 1회전당 3840 pulse
	return rotationDeg;
}

// timer var
unsigned int TINTCnt;
unsigned int INTRR_cnt;
int timerCheckCnt = 0;

// overshoot var
float overshoot = 0.0f; // to track overshoot
float overshootPercent = 0.0f;
float currPos;

// tracking var
float R = 720.0f; // reference pos
float vel_max = 1500.0f, accel = 10000.0f;
float pos_t = 0; // ref. pos.
float vel_t = 0; // ref. vel.

void GetRefAngleVel(float sref, float vmax, float acc){
/*
	tracking 제어의 경우,
	1. 위의 R값을 0.0f로
	2. 간단하게는 if(R < 720.0f) R = R + 1.0f; 이런 코드를 작성하면 reference가 사다리꼴로 올라갈 것. 
	3. 하지만 메카트로닉스를 배운 사람이라면.. GetRefAngle(float sref, float vmax, float acc)
	4. feedforward로 float vmax를 u에 더해 넣어주자. u/sref의 gain Kff를 곱해주면 될 것. 
*/
/*
	Feedforward 제어의 경우,
	1. 현재 sys: DC motor position model -> 역수를 feedforward로 사용할 경우 미분기가 2개.
	2. 편의성 1) '위치'의 미분꼴인 '속도'모델을 reference로
	3. 편의성 2) 저주파 대역(s->0)에서, C_ff = u/ref

*/
	float t = INTRR_cnt * 0.001;
	float t1, t2, t3;
	float s1, s2; 

	// accel section
	t1 = vmax / acc;
	s1 = (vmax * vmax) / (2.0 * acc);

	// constant vel section
	t2 = sref / vmax;
	s2 = sref - s1;

	// decel section
	t3 = t2 + t1;

	// exception handling
	if(sref <= 2*s1) // no constant section -> triangle vel. profile
	{
		// accel section
		t1 = sqrt(sref / acc);
		s1 = sref / 2;

		vmax = acc * t1;

		// decel section
		t2 = 2 * t1;

		// accel
		if(t <= t1){
			vel_t = acc*t;
			pos_t =  1.0/2* acc * t*t;
		}
		// decel
		else if(t1 < t && t <= t2){
			vel_t = vmax - acc*(t-t1);
			pos_t = s1 + vmax * (t-t1) - 1.0/2 * acc * (t-t1)*(t-t1);
		} 
		else{
			vel_t = 0;
			pos_t = sref;
		} 
	}

	else // trapezoidal vel. profile
	{
		// accel
		if(t <= t1){
			vel_t = acc * t;
			pos_t = 1.0/2 * acc * (t*t);
		}
		// constant
		else if(t1 < t && t <= t2){
			vel_t = vmax;
			pos_t = s1 + vmax*(t-t1);
		}
		// decel
		else if(t2 < t && t <= t3){
			vel_t = vmax - acc*(t - t2);
			pos_t = s2 + vmax*(t-t2) - 0.5 * acc * (t-t2)*(t-t2);
		} 
		else{
			vel_t = 0;
			pos_t = sref;
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
	*ENCPOSCLR = 1;			// 위치 초기화
	//*PWMRIGHT = 0x800;		// PWM : 0x000 ~ 0x800 ~ 0xFFF

	WaitTFlagCnt(1000);

	TINTCnt = 0;
	INTRR_cnt = 0;

	while (1) {
		*FPGALED ^= 1;
		GetRefAngleVel(R, vel_max, accel);
		currPos = GetAngle();

		// calc overshoot percentage
		overshootPercent = (overshoot - R) / R * 100;
		
		// timer check
		if(TINTCnt > 2000){

			timerCheckCnt++;
			MACRO_PRINT((tmp_string, "==== Timer Check: %d ====\r\n", timerCheckCnt));

			MACRO_PRINT((tmp_string, "current pos: %6.2f \r\n", GetAngle() ));

			MACRO_PRINT((tmp_string, "Encoder bit: 0x%04x \r\n", *ENCPOSR & 0xFFFF)); //*ENCPOSR & 0xFFFF값 %d로 출력해보면 16bit max인 65535까지 찍고 1씩 감소하는 값 볼 수 있음. 
			MACRO_PRINT((tmp_string, "Overshoot: %6.2f ( %.2f%% ) \r\n", overshoot, overshootPercent));
			
			MACRO_PRINT((tmp_string, "\r\n"));
			TINTCnt = 0;
			//INTRR_cnt = 0;
		}
		
		//WaitTFlagCnt(2000); // every 2 sec
	}
}
