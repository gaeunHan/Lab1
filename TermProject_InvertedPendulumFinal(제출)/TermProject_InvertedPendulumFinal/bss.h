/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;
extern float y_pend;        // current pendulum position
extern float y_cart;        // current cart position
extern float mostPlusPos;   // highest pendulum position in CCW 
extern float mostMinusPos;  // highest pendulum position in CW 
extern float prevPendPos;   // previous pendulum position

// Main.c
extern unsigned int TINTCnt;
extern float R_pend;                    // pendulum reference pos
extern float R_cart;                    // cart reference pos
extern float R_swup_cart;               // swing-up cart reference pos
enum MODE {SWINGUP = 0, BALANCING = 1}; // mode variable
extern enum MODE mode;

