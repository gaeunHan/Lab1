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

unsigned int TFlag = 0;

#define Kp 0.05f
#define Kd 0.0f
#define Ki 0.0f

float R = 90.0f; // reference pos
float prevErr = 0.0f, sumErr = 0.0f;

interrupt void ISRtimer0()
{
	//PID controller
	/*
		1. get angle
		2. err compute
		3. PID compute
		4. PWM out
	*/
	float y, err, u, uSat;
	//static float prevErr = 0.0f, sumErr = 0.0f; //전역변수가 나을 것

	// get angle
	y = GetAngle();

	// compute err
	err = R - y;

	// compute PID
	sumErr += err;
	u = (Kp * err) + (Ki * sumErr) + (Kd * (err-prevErr)); 
	prevErr = err;

	// PWM out
	uSat = PWMOut(u);

	TINTCnt++;
	UMAddData(R, y, u, uSat);

	/*
		tracking 제어의 경우,
		1. 위의 R값을 0.0f로
		2. 간단하게는 if(R < 720.0f) R = R + 1.0f; 이런 코드를 작성하면 reference가 사다리꼴로 올라갈 것. 
		3. 하지만 메카트로닉스를 배운 사람이라면.. GetRefAngle(float sref, float vmax, float acc)
		4. feedforward로 float vmax를 u에 더해 넣어주자. u/sref의 gain Kff를 곱해주면 될 것. 
	*/

	/*
	static unsigned int cnt=0;
	static float mmag = 0.2f;

	float sig0, sig1, sig2, sig3;

	TFlag = 1;

	TINTCnt++;

	// Example code to use USBMonitor
	sig0 = mmag*sinf(2.0f*3.141592f/5000.0f*cnt);
	sig1 = mmag*cosf(2.0f*3.141592f/2000.0f*cnt);
	sig2 = mmag*sinf(2.0f*3.141592f/2500.0f*cnt);
	sig3 = mmag*cosf(2.0f*3.141592f/25000.0f*cnt);

	cnt++;
	if ((cnt%5000) == 0) {
		mmag += 0.01f;
		if (mmag > 2.0f) {
			mmag = 0.2f;
		}
	}

	UMAddData(sig0, sig1, sig2, sig3);	// Add 4 data set to USBMon
	*/
}

