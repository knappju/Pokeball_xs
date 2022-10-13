/* 
 * File:   app.h
 * Author: justk
 *
 * Created on August 21, 2022, 2:58 PM
 */

#ifndef APP_H
#define	APP_H

#ifdef	__cplusplus
extern "C" {
#endif
    
    //functions for app
    extern void appInit();
    extern void appHandler();
    extern void msTick();
    
    //light functions
    void initBlink(int numOfBlinks);
    int blinkHandler(int NumOfBlinks);
    void refreshColor();
    void setColors(uint16_t r,uint16_t g,uint16_t b);
    
    //defined
    #define MAX_NUMBER_OF_BLINKS                            (5)
    #define SLEEP_TIME                                      (60000)//(300000) //5 min
    #define CAUGHT_TIME                                     (3500)
    #define NOT_CAUGHT_TIME                                 (3500)
    
    //variables
    typedef struct LED{
        uint16_t red;
        uint16_t green;
        uint16_t blue;
    } LED_t;
    

#ifdef	__cplusplus
}
#endif

#endif	/* APP_H */

