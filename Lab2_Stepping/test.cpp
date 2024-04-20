#include <iostream>
#include <cmath>
using namespace std;

#define STEP_ANGLE 1.8f // step angle = 1.8 deg
int STEPPER;
int currPhaseIdx;
unsigned int currDIR, prevDIR;
unsigned int delayCntArr[200]; // lookup table

void OneStepMove(unsigned int dir, unsigned int tDelayCnt);
unsigned int MakeVelProfile(float maxVel, float accel);
void StepMoveVP(float angle, float maxVel, float accel);

int main(){
/*
    cout << "====== OneStepMove() test ======" << endl;
    currPhaseIdx = 0;
    currDIR = 0; 
    prevDIR = 0;

    cout << "CW test:" << endl;
    for(int i=0; i<10; i++){        
        OneStepMove(0,10);
        cout << "value stored in STEPPER: 0x" << hex << STEPPER << endl;
    }
    cout << endl;

    cout << "CCW test:" << endl;
    for(int i=0; i<10; i++){        
        OneStepMove(1,10);
        cout << "value stored in STEPPER: 0x" << hex << STEPPER << endl;
    }
    cout << endl;

    cout << "CW test:" << endl;
    for(int i=0; i<10; i++){        
        OneStepMove(0,10);
        cout << "value stored in STEPPER: 0x" << hex << STEPPER << endl;
    }
    cout << endl;
*/

/*
    cout << "====== MakeVelProfile() test ======" << endl;
    unsigned int totAccelStep = MakeVelProfile(180, 1800);
    cout << endl;
*/

    cout << "====== StepMoveVP() test ======" << endl;
    StepMoveVP(360, 3000, 20000);
    cout << endl;

}

// rotate the motor by one step
void OneStepMove(unsigned int dir, unsigned int tDelayCnt){
    int phase[4] = {0x2, 0x8, 0x1, 0x4}; // Right Stepping Motor Phase: A, B, /A, /B
    int idx;
    int setPhase; 

    currDIR = dir;
    idx = currPhaseIdx;

    // CW: A, B, /A, /B
    if(dir == 0){
        if(currDIR != prevDIR){
            if(idx == 3) idx = -1;
            idx++;
        } // 회전 방향 반전 시 idx 보정

        setPhase = phase[idx];

        if(idx == 3) idx = -1;
        idx++;        
    }
    
    // CCW: A, /B, /A, B
    else if(dir == 1){
        if(currDIR != prevDIR){
            if(idx == 0) idx = 4;
            idx--;
        } // 회전 방향 반전 시 idx 보정

        setPhase = phase[idx];

        if(idx == 0) idx = 4;
        idx--;
        
    }
    // phase update
    currPhaseIdx = idx;
    prevDIR = dir;
    
    // drive the motor
    STEPPER = setPhase;
    //WaitTFlagCnt(tDelayCnt);    
}


// make a lookup table
unsigned int MakeVelProfile(float maxVel, float accel){
    cout << endl << "--------- MakeVelProfile ---------" << endl;
    unsigned int step;          // k
    float s1AccelAngle;         // s1
    unsigned int accelStep;     // 가속구간 총 스텝 수
    float stepDelayTime;        // delta t
    float delayCnt;             // interrupt cnt from delta t

    step = 1;

    s1AccelAngle = (maxVel*maxVel) / (2.0*accel); // calc s1
    accelStep = s1AccelAngle / STEP_ANGLE; // casting으로 내림 발생, 가속구간 총 스텝 수 반올림하여 저장

    // be aware that the delayCntArr starts from index '1', not '0' as usuall
    for(step = 1; step <= accelStep; step++){
        stepDelayTime = sqrt((float)STEP_ANGLE / (2.0*accel*step));
        cout << "stepDelayTime[" << step << "]: " << stepDelayTime << endl;
        delayCnt = 1e5 * stepDelayTime;    
        delayCntArr[step] = (unsigned int)delayCnt;
    }    

    cout << endl << "Total step for accel zone: " << accelStep << endl;
    cout << "Angle reached in s1: " << s1AccelAngle << endl << endl;
    for(step = 1; step <= accelStep; step++){
        cout << "delayCntArr[" << step << "]: " << dec << delayCntArr[step] << endl;
    }

    return accelStep;
}

// rotate the motor by following trapezoidal angle input
void StepMoveVP(float angle, float maxVel, float accel){
    int dir;
    float s1AccelAngle;         // s1
    unsigned int accelStep;     // 가속 구간 총 스텝
    int constVelStep;           // 등속 구간 총 스텝
    int totalStep;              // 총 스텝
    unsigned int delayCnt;
    unsigned arrIdx;
    int i;

    totalStep = (float)angle / STEP_ANGLE; // casting으로 내림 발생, 정수 step 값 작성
    dir = (angle > 0) ? 0 : 1; // 입력된 angle이 양수: CW, 음수: CCW   
    
    // clac total step & generate step delay lookup table
    s1AccelAngle = (maxVel*maxVel) / (2.0*accel); // calc s1
    accelStep = MakeVelProfile(maxVel, accel);
    cout << endl << "------------ StepMoveVP ------------" << endl;

    // rotate the motor by the input angle
    arrIdx = 1;
    if(angle <= 2*s1AccelAngle){ // triangular
        constVelStep = 0;
        totalStep = (2.0 * accelStep) + constVelStep;
        for(i = 1; i <= totalStep; i++){
            // accel zone
            if(i <= accelStep){
                delayCnt = delayCntArr[arrIdx];
                arrIdx++;
            }
            // decel zone
            else{
                delayCnt = delayCntArr[arrIdx];
                arrIdx--;
            }
            // drive the motor
            OneStepMove(dir, delayCnt);
            cout << "Interrupt cnt for delay on " << i <<"_th step: " << delayCnt << endl;   
        }
        cout << "=> triangular" << endl;
    }
    else{ // trapzoidal       
        constVelStep = (angle - (STEP_ANGLE * accelStep)) / STEP_ANGLE;
        totalStep = (2.0 * accelStep) + constVelStep;
        for(i = 1; i <= totalStep; i++){
            // accel zone
            if(i <= accelStep){
                delayCnt = delayCntArr[arrIdx];
                arrIdx++;
            }
            // constant vel zone
            else if(i > accelStep && i <= totalStep - accelStep){
                arrIdx = accelStep;
                delayCnt = delayCntArr[arrIdx];
            }

            // decel zone
            else if(i > totalStep - accelStep && i <= totalStep){
                delayCnt = delayCntArr[arrIdx];
                arrIdx--;
            }
            // drive the motor
            OneStepMove(dir, delayCnt);
            cout << "Interrupt cnt for delay on " << i <<"_th step: " << delayCnt << endl;   
        }
        cout << endl << "=> trapzoidal" << endl;
    } 
    cout << "Total step: " << totalStep << endl;
    cout << "Steps for accel & decel:" << accelStep <<endl;
    cout << "Steps for const zone: " << constVelStep << endl;
}

