/*#####################################################################
* file:  app.c
*
* Product:
*
* Written By: Justin Knapp
*
*######################################################################
*
* Project Name: 60-0005_Pokeball
*   
* Target Compiler: MPLAB X 5.45, XC8 (v2.32)
*
* Target Part: 
*
* Brief: 
*
**********************************************************************
*
* Detail Description:
*
*
*********************************************************************
*
*####################################################################*/

#include "mcc_generated_files/mcc.h"
#include "app.h"
#include "stdlib.h"
#include "stdio.h"

// ============================ Local Definitions

// ============================ Global variable declarations

// ============================ Local variable declarations

// ============================ Local Function Declarations


LED_t led;

enum state{INIT, SLEEP, READY_TO_ENTER_BUTTON, WAIT_FOR_BUTTON, BLINKING, CAUGHT, NOT_CAUGHT};
enum blink_s{BLINK_INIT,BLINK_UP,BLINK_DOWN,BLINK_FINISHED};

enum state currentState = INIT;
enum blink_s currentBlinkState = BLINK_INIT;

uint32_t timeInState = 0;
uint8_t btnTicks = 0;
static uint8_t isCaught = 0;

void appInit(){
    TMR1_SetInterruptHandler(msTick);
}

void appHandler(){
    
    static uint8_t requestedNumberOfBlinks = 0;
    static uint8_t debounceBuffer = 0x00;
    
    if(btnTicks >= 5){
        btnTicks = 0;
        debounceBuffer = (debounceBuffer << 1 ) | !BTN_IN_GetValue() | 0xC0;
    }
    
    switch(currentState){
        case INIT:
            currentState = WAIT_FOR_BUTTON;
            setColors(60000,60000,60000);
            refreshColor();
            timeInState = 0;
            break;
        case SLEEP:
            timeInState = 0;
            if(debounceBuffer == 0xFF){
                currentState = READY_TO_ENTER_BUTTON;
                timeInState = 0;
            }
            break; 
        case READY_TO_ENTER_BUTTON:
            if(debounceBuffer == 0xC0){
                currentState = WAIT_FOR_BUTTON;
                setColors(60000,60000,60000);
                refreshColor();
                timeInState = 0;
            }
            break;
        case WAIT_FOR_BUTTON:
            if(timeInState >= SLEEP_TIME){
                setColors(2000,2000,2000);
                refreshColor();
                currentState = SLEEP;
                timeInState = 0;
            }
            if(debounceBuffer == 0xFF){
                requestedNumberOfBlinks = (timeInState % MAX_NUMBER_OF_BLINKS) + 1;
                isCaught = timeInState & 0x01;
                initBlink(requestedNumberOfBlinks);
                currentState = BLINKING;
                timeInState = 0;
            }
            break;
        case BLINKING:
            if(blinkHandler(3)){
                if(isCaught == 1){
                    setColors(65535,0,0);
                    refreshColor();
                    currentState = CAUGHT;
                    timeInState = 0;
                }
                else{
                    setColors(0,65535,0);
                    refreshColor();
                    currentState = NOT_CAUGHT;
                    timeInState = 0;
                }
            }
            break;
        case CAUGHT:
            if(timeInState == CAUGHT_TIME){
                currentState = READY_TO_ENTER_BUTTON;
                setColors(60000,60000,60000);
                refreshColor();
                timeInState = 0;
            }
            break;
        case NOT_CAUGHT:
            if(timeInState == NOT_CAUGHT_TIME){
                currentState = READY_TO_ENTER_BUTTON;
                setColors(60000,60000,60000);
                refreshColor();
                timeInState = 0;
            }
            break;
        default:
            currentState = INIT;
            timeInState = 0;
            break;
    }
}

void msTick(){
    btnTicks++;
    timeInState++;
}

void initBlink(int numOfBlinks){
        
}

int blinkHandler(int numOfBlinks){
    
//    switch(currentBlinkState){
//        case BLINK_INIT:
//            
//            break;
//        case BLINK_UP:
//            
//            break;
//        case BLINK_DOWN:
//            
//            break;
//        case BLINK_FINISHED:
//            
//            break;
//    }
    
    //returns 1 if the requested number of blinks is done.
//    if(blinksCompleted >= NumOfBlinks){
//        return 1;
//    }
//    return 0;
    
    return 1;
}

void refreshColor(){
    PWM1_Stop();
    PWM1_DutyCycleSet(led.red);
    PWM1_Start();
    
    PWM2_Stop();
    PWM2_DutyCycleSet(led.green);
    PWM2_Start();
    
    PWM3_Stop();
    PWM3_DutyCycleSet(led.blue);
    PWM3_Start();
}

void setColors(uint16_t r, uint16_t g, uint16_t b){
    led.red = r;
    led.green = g;
    led.blue = b;
}