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

//PID controller
#define Kp 0.3f
#define Kd 0.3f
#define Ki 0.0f
float prevErr = 0.0f, sumErr = 0.0f;
void PID(float ref, float* y, float* err, float* u){
	/*
		1. get angle
		2. err compute
		3. PID compute
		4. PWM out
	*/

	// get angle
	*y = GetAngle();

	// compute err
	*err = ref - *y;

	// compute PID
	sumErr += *err;
	*u = (Kp * (*err)) + (Ki * sumErr) + (Kd * (*err-prevErr)); 
	prevErr = *err;
}

int timerCheckCnt = 0;
// generate ref pos for tracking ctrl 

unsigned int TFlag = 0; // flag variable for timer0
interrupt void ISRtimer0()
{
	float y, err, u_fb, u_ff, u, uSat;
	float R = 180.0f; // reference pos
	float vmax = 3.0f, acc = 5.0f;
	float sref;

	// Tracking ctrl: get ref pos, ref vel
	// sref = GetRefAngle(R, vmax, acc); // generate smooth Ref. pos.
	sref = GetRefAngleFeedForward(R, vmax, acc); // tracking + feedforward

	// PID ctrl: get u_fb
	PID(sref, &y, &err, &u_fb); // make a controlled input (err -> |PID ctrl| -> u)

	// get u
	u_ff = vel_TINTCnt;
	u = u_fb + u_ff; 

	// PWM out: drive the motor
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
