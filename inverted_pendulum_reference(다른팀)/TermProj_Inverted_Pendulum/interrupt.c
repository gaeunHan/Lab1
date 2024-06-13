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

//PID GAIN_feedback.
#define P_GAIN 25.0f
#define D_GAIN 5.0f
#define I_GAIN 0.5f

#define P_GAIN_d 0.25f
#define D_GAIN_d 0.15f
#define I_GAIN_d 0.0f
#define SAFE 45.0f
//오버슛이 있어야한다 => I 게인을 안넣으면 힘들다.


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

unsigned int TFlag = 0;

interrupt void ISRtimer0()
{
	
	float ret = 0.0f;
	///
	
	static float refer;
	static float sum_error = 0.0f;
	static float prev_error = 0.0f;
	
	float error_d = 0.0;
	static float refer_d = 0.0f;
	static float sum_error_d = 0.0f;
	static float prev_error_d = 0.0f;
	con_input_d = 0.0f;
	angle_d = 0.0f;
	con_input = 0.0f;
	error = 0.0f;
	angle = 0.0f;
	///
	
	
	*DOUT0 = !*DOUT0;
	TFlag = 1;

	TINTCnt++;
	
	//////
	refer = 180.0f;
	angle = GetAngle();
	
	error = refer - fabs(angle);
	if(angle > 0){
		error*=-1.0f;
	}
	///
	refer_d = 0.0f;
	angle_d = GetAngleDist();
	
	error_d = refer_d - angle_d;
	//if(angle_d > 0){
	error_d*=-1.0f;
	//}
	//////
	if(fabs(angle) >= 175.0f && startFlag == 0){
		startFlag = 1;
		sum_error = -5000.0;
		sum_error_d = 0;
	}

	if(startFlag==1){
		sum_error += error;
		con_input = P_GAIN*error + I_GAIN*sum_error + D_GAIN*(error - prev_error);
	
		sum_error_d += error_d;
		con_input_d = P_GAIN_d*error_d + I_GAIN_d*sum_error_d + D_GAIN_d*(error_d-prev_error_d);
		ret = con_input-con_input_d;
		PWMOut(ret);
	}

	prev_error = error;
	prev_error_d = error_d;

	UMAddData(error, sum_error, prev_error, angle_d);	// Add 4 data set to USBMon
	
	
}

