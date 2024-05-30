/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;
extern float y_pend;
// debugging var inside of Ineterrupt.c
extern float mostPlusPos;
extern float mostMinusPos;
extern float prevPendPos;
extern float remainedAngleToTheGoal;

// Main.c
extern unsigned int TINTCnt;
extern float R_pend; // pendulum reference pos
extern float R_cart; // cart reference pos
extern float R_swup_cart; // swing-up cart reference pos
enum MODE {SWINGUP, BALANCING};
extern enum MODE mode;
