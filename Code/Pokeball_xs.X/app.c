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

#include "math.h"

// ============================ Local Definitions

// ============================ Global variable declarations

// ============================ Local variable declarations

// ============================ Local Function Declarations

uint64_t msTicks = 0;

void appInit(){
    TMR1_SetInterruptHandler(msTick);
}

void appHandler(){
    static uint16_t blueOutput = 600;
    static uint16_t redOutput = 0;
    static uint16_t greenOutput = 900;
    
    static int up = 0;
    
    if(msTicks >= 30){
        msTicks = 0;
        if(up == 0){
            redOutput += 20;
            if(redOutput >= 1000){
                up = 1;
            }
        }
        else if(up == 1){
            redOutput -= 20;
            if (redOutput <= 20){
                up = 0;
            }
        } 
        PWM4_LoadDutyValue(redOutput);
        PWM3_LoadDutyValue(greenOutput);
        PWM1_LoadDutyValue(blueOutput);
        
        
        
    }
}

void msTick(){
    msTicks++;
}