/* Function.h */

// Serial.c
extern void InitUART();
extern char ReceiveByte();
extern void SendByte(char data);
extern int CheckSum();
extern void SendData();
extern void Report();

// Main.c
extern void delay_us(unsigned int time_us);
extern void delay_ms(unsigned int time_ms);
extern void WaitTFlag();
extern void WaitTFlagCnt(unsigned int cnt);
extern float GetAngle();
extern float GetAngleDist();
extern void PWMOut(float dutyratio);
extern float referUpdate(float a, float wMax, float degree, int cnt);
extern float angle;
extern float error;
extern float error_d;
extern float angle_d;
extern int state;
extern int startFlag;
extern float con_input_d;
extern float con_input;
