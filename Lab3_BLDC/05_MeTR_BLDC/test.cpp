#include <iostream>
#include <ctime>
using namespace std;

int PWMD;
int PWMH;
int PWML;
#define PWMZ 0x800
void PWMOut(float dutyratio) // 0 <= dutyratio <= 100.0, 대칭되는 PWMH, PWML값 생성
{
    clock_t start, finish;
    double duration;
    start = clock();

    /////////////////////////////////////////////////
	float duty; 	

	// dutyratio <-> PWM conversion
	duty = dutyratio * 0x7FF / 100.0;

	// calc PWMH and PWML
	PWMD = duty;
	PWMH = PWMZ + PWMD;
	PWML = PWMZ - PWMD;
    //////////////////////////////////////////////////

    finish = clock(); 
    duration = (double)(finish - start);
    cout << duration << "ms" << endl;
}

int main(){
    PWMOut(100);
    cout << "PWMH, PWML: 0x" << std::hex << PWMH << ", 0x" << std::hex << PWML <<endl;
    PWMOut(50);
    cout << "PWMH, PWML: 0x" << std::hex << PWMH << ", 0x" << std::hex << PWML <<endl;
}