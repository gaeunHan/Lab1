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
#define Kp 0.35f
#define Kd 4.5f
#define Ki 0.0f
#define Kff 0.0f

float prevErr = 0.0f, sumErr = 0.0f;
unsigned int TFlag = 0; // flag variable for timer0

interrupt void ISRtimer0()
{
	float y, err, u_fb, uSat;
	float u, u_ff;

	// PID ctrl: get u_fb
	y = GetAngle();

	// compute err
	err = pos_t - y;

	// compute PID
	sumErr += err;
	u_fb = (Kp * err) + (Ki * sumErr) + (Kd * (err-prevErr)); 
	prevErr = err;

	// PWM out: drive the motor
	u_ff = Kff * vel_t;
	u = u_ff + u_fb;
	uSat = PWMOut(u); // u -> |saturation blk| -> uSat

	// print usb monotor
	UMAddData(pos_t, err, u_fb, uSat);

	// tracking overshoot
	if(y > overshoot) overshoot = y;
	
	// timer var handling
	TINTCnt++;
	INTRR_cnt++;
	TFlag = 1;
}
