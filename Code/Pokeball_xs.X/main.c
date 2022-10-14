/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.7
        Device            :  PIC12LF1571
        Driver Version    :  2.00
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/

#include "mcc_generated_files/mcc.h"
#include "main.h"

// Local variables
enum state{INIT, SLEEP, READY_TO_ENTER_BUTTON, WAIT_FOR_BUTTON, BLINKING, CAUGHT, NOT_CAUGHT};

enum state currentState = INIT;

uint8_t randCounter = 0;

DEBOUNCEbits_t DEBOUNCEbits;
ACTIONbits_t ACTIONbits;

void main(void)
{
    // initialize the device
    SYSTEM_Initialize();
    
    //start timer 2
    T2CONbits.TMR2ON = 1;

    // Enable the Global Interrupts
    INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    INTERRUPT_PeripheralInterruptEnable();
    
    while (1)
    {
        
        /*debounce the button. every 6 ms, the buttons value is shifted into 
         * DEBOUNCEbits.debounceBuffer. The buffer is 5 bits. This means that
         * a complete debounce cycle happens every 30 ms. */
        if(DEBOUNCEbits.btnTicks >= 6){
            DEBOUNCEbits.btnTicks = 0;
            DEBOUNCEbits.debounceBuffer = (DEBOUNCEbits.debounceBuffer << 1 ) | !PORTAbits.RA0;
        }

        switch(currentState){
            case INIT:
                currentState = WAIT_FOR_BUTTON;
                setColors(3500,3500,3500,0);
                timeInState = 0;
                break;
            case SLEEP:
                if(DEBOUNCEbits.debounceBuffer == 0x1F){
                    currentState = READY_TO_ENTER_BUTTON;
                    timeInState = 0;
                }
                break; 
            case READY_TO_ENTER_BUTTON:
                if(DEBOUNCEbits.debounceBuffer == 0x00){
                    currentState = WAIT_FOR_BUTTON;
                    setColors(3500,3500,3500,0);
                    timeInState = 0;
                }
                break;
            case WAIT_FOR_BUTTON:
                if(timeInState >= SLEEP_TIME){
                    setColors(0,0,0,0);
                    currentState = SLEEP;
                    timeInState = 0;
                }
                if(DEBOUNCEbits.debounceBuffer == 0x1F){
                    ACTIONbits.fade = 0;
                    ACTIONbits.direction = 0;
                    ACTIONbits.currentBlinks = 0;
                    ACTIONbits.numOfBlinks = ((randCounter >> 5) & 0x03) + 1;
                    ACTIONbits.isCaught = ((randCounter >> 4) & 0x01);
                    currentState = BLINKING;
                    timeInState = 0;
                }
                break;
            case BLINKING:
                if(timeInState >= 25){
                    if(ACTIONbits.direction == UP){
                        ACTIONbits.fade += 5;
                        if(ACTIONbits.fade >= 140){
                            ACTIONbits.direction = DOWN;
                        }
                    }
                    else{
                        ACTIONbits.fade -= 5;
                        if(ACTIONbits.fade <= 15){
                            ACTIONbits.direction = UP;
                            ACTIONbits.currentBlinks++;
                        }
                    } 
                    timeInState = 0;
                    setColors(65535,0,0,ACTIONbits.fade);
                }
                if(ACTIONbits.currentBlinks == ACTIONbits.numOfBlinks){
                    if(ACTIONbits.isCaught){
                        ACTIONbits.fade = 0;
                        ACTIONbits.direction = 0;
                        ACTIONbits.currentBlinks = 0;
                        currentState = CAUGHT;
                        timeInState = 0;
                    }
                    else{
                        setColors(0,0,0,0);
                        currentState = NOT_CAUGHT;
                        timeInState = 0;
                    }
                }
                break;
            case CAUGHT:
                if(timeInState >= 20){
                    if(ACTIONbits.direction == UP){
                        ACTIONbits.fade += 30;
                        timeInState = 0;
                        if(ACTIONbits.fade >= 220){
                            ACTIONbits.direction = DOWN;
                        }
                        setColors(65535,65535,65535,ACTIONbits.fade);
                    }
                    else{
                        if(ACTIONbits.fade > 100){
                            ACTIONbits.fade -= 15;
                            timeInState = 0;
                            setColors(65535,65535,65535,ACTIONbits.fade);
                        }
                    }
                }
                if(timeInState == CAUGHT_TIME){
                    currentState = READY_TO_ENTER_BUTTON;
                    setColors(3500,3500,3500,0);
                    timeInState = 0;
                }
                break;
            case NOT_CAUGHT:
                if(timeInState == NOT_CAUGHT_TIME){
                    currentState = READY_TO_ENTER_BUTTON;
                    setColors(3500,3500,3500,0);
                    timeInState = 0;
                }
                break;
            default:
                currentState = INIT;
                timeInState = 0;
                break;
        }
    }
}

void msTick(){
    DEBOUNCEbits.btnTicks++;
    randCounter++;
    timeInState++;
}

void setColors(uint16_t r, uint16_t g, uint16_t b, uint8_t fade){
    
    if(fade > 0){
        r = r >> 8; //make an 8 bit version of the number
        r = r * fade; // create the new version
        g = g >> 8; //make an 8 bit version of the number
        g = g * fade; // create the new version
        b = b >> 8; //make an 8 bit version of the number
        b = b * fade; // create the new version
    }
    
    PWM1CONbits.EN = 0;	
    PWM1DCH = (r>>8);	//writing 8 MSBs to PWMDCH register
    PWM1DCL = (r);
    PWM1CONbits.EN = 1;	
    
    PWM2CONbits.EN = 0;	
    PWM2DCH = (g>>8);	//writing 8 MSBs to PWMDCH register
    PWM2DCL = (g);
    PWM2CONbits.EN = 1;	
    
    PWM3CONbits.EN = 0;	
    PWM3DCH = (b>>8);	//writing 8 MSBs to PWMDCH register
    PWM3DCL = (b);
    PWM3CONbits.EN = 1;	
}
/**
 End of File
*/