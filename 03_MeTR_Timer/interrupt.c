/* Interupt.c */

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
#include "interrupt.h"
#include "USBMon.h"


interrupt void ISRNMI()
{
}

interrupt void ISRextint6()
{
	volatile unsigned int tmp;

	while((tmp = *intid_fifo & 0x0F) != 1) {
		if(tmp == 0x04) {
			while(*linestatus&0x01) {
				*(compacket.wr_ptr) = *txrx_divl & 0xFF;
				SendByte(*(compacket.wr_ptr));
				if(compacket.wr_ptr == (compacket.packet+SIZE_OF_COMPACKET-1)) {
					compacket.wr_ptr = compacket.packet;
				}
				else {
					compacket.wr_ptr++;
				}
			}
		}
		else if(tmp == 0x02) {
			if(respacket.char_num-- > 0) {
				*txrx_divl = respacket.string[respacket.char_to_send++];
			}
			else {
				*inten_divh = 0x01;			
				respacket.flag = 0;
			}
		}
		else if(tmp == 0x0C) {
			while(*linestatus & 0x01) {
				*(compacket.wr_ptr) = *txrx_divl & 0xFF;
				if(compacket.wr_ptr == (compacket.packet+SIZE_OF_COMPACKET-1)) {
					compacket.wr_ptr = compacket.packet;
				}
				else {
					compacket.wr_ptr++;
				}
			}
		}
	}
}


// generate ref pos for tracking ctrl 
float R = 180.0f; // reference pos
float vmax = 3.0f, acc = 5.0f;
float t = 0;
GetRefAngle(float sref, float vmax, float acc){
	/*
		tracking 제어의 경우,
		1. 위의 R값을 0.0f로
		2. 간단하게는 if(R < 720.0f) R = R + 1.0f; 이런 코드를 작성하면 reference가 사다리꼴로 올라갈 것. 
		3. 하지만 메카트로닉스를 배운 사람이라면.. GetRefAngle(float sref, float vmax, float acc)
		4. feedforward로 float vmax를 u에 더해 넣어주자. u/sref의 gain Kff를 곱해주면 될 것. 
	*/
	float t1, t2, t3;
	float s1, s2, s3; 
	float s_t = 0, v_t = 0;

	// accel section
	t1 = vmax / acc;
	s1 = (vmax * vmax) / (2 * acc);

	// constant vel section
	t2 = sref / vmax;
	s2 = sref - s1;

	// decel section
	t3 = t2 + t1;
	s3 = sref;

	// exception handling
	if(sref <= 2*s1) // no constant section -> triangle vel. profile
	{
		// accel section
		t1 = sqrt(sref / acc);
		s1 = sref / 2;

		vmax = acc * t1;

		// decel section
		t2 = 2 * t1;
		s2 = sref;

		if(t <= t1) // accel
		{
			s_t = 1/2 * acc * t*t;
			v_t = acc * t;
		}
		else if(t1 < t && t <= t2) // decel
		{
			s_t = s1 + vmax * (t-t1) - 1/2 * acc * (t-t1)*(t-t1);
			v_t = vmax - acc * (t-t1);
		}
	}

	else // trapezoidal vel. profile
	{
		if(t <= t1) // accel
		{
			s_t = 1/2 * acc * (t*t);
			v_t = acc * t;
		}
		else if(t1 < t && t <= t2) // constant
		{
			s_t = s1 + vmax*(t-t2);
			v_t = vmax;
		}
		else if(t2 < t && t <= t3) // decel
		{
			s_t = s2 + vmax*(t-t2) - 0.5 * acc * (t-t2)*(t-t2);
			v_t = vmax - acc*(t-t2);
		}
	}

	R = s_t;
	t++;
}

//PID controller
#define Kp 0.3f
#define Kd 0.3f
#define Ki 0.0f
float prevErr = 0.0f, sumErr = 0.0f;
void PID(float& u){
	/*
		1. get angle
		2. err compute
		3. PID compute
		4. PWM out
	*/
	float y, err;

	// get angle
	y = GetAngle();

	// compute err
	err = R - y;

	// compute PID
	sumErr += err;
	u = (Kp * err) + (Ki * sumErr) + (Kd * (err-prevErr)); 
	prevErr = err;
}

int timerCheckCnt = 0;
interrupt void ISRtimer0()
{
	// Tracking ctrl
	GetRefAngle(R, vmax, acc); // generate smooth Ref. pos.

	// PID ctrl
	float u, uSat;
	PID(u); // make a controlled input (err -> |PID ctrl| -> u)

	// PWM out
	uSat = PWMOut(u); // u -> |saturation blk| -> uSat

	UMAddData(R, y, u, uSat);
	

	TINTCnt++;
	if(TINTCnt >= 2000){ //2초마다 동작
		TINTCnt = 0;
		// timer check
		MACRO_PRINT((tmp_string, "Timer Check: %d \r\n", timerCheckCnt++));

		// alternates ref pos between 0 degrees and 180 degrees every 2 sec
		if(R == 180.0) R = 0.0;
		else if(R == 0.0) R = 180.0;

		// check current gains and the position result
		MACRO_PRINT((tmp_string, "current kp, kd, ki: %.2f, %.2f, %.2f\r\n", Kp, Kd, Ki));
		MACRO_PRINT((tmp_string, "Timer Check: %d %6.2f \r\n", timerCheckCnt++, GetAngle()));
		MACRO_PRINT((tmp_string, "Timer Check: %d 0x%04x \r\n", timerCheckCnt++, *ENCPOSR & 0xFFFF)); //*ENCPOSR & 0xFFFF값 %d로 출력해보면 16bit max인 65535까지 찍고 1씩 감소하는 값 볼 수 있음. 
	}
}