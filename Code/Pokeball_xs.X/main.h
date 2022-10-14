/* 
 * File:   main.h
 * Author: JustinK
 *
 * Created on October 13, 2022, 4:55 PM
 */

#ifndef MAIN_H
#define	MAIN_H

#ifdef	__cplusplus
extern "C" {
#endif
    
    extern void msTick();
    
    void setColors(uint16_t r,uint16_t g,uint16_t b, uint8_t fade);
    
    //defined
    #define SLEEP_TIME                                      (60000) //max is 65535
    #define CAUGHT_TIME                                     (5000)
    #define NOT_CAUGHT_TIME                                 (1500)
    #define UP                                              (0)
    #define DOWN                                            (1)

    typedef struct {
            unsigned btnTicks                  :3;
            unsigned debounceBuffer            :5;
    }DEBOUNCEbits_t;

    typedef struct {
          unsigned fade                        :8;
          unsigned direction                   :1;
          unsigned isCaught                    :1;
          unsigned numOfBlinks                 :3;
          unsigned currentBlinks               :3;
          
    }ACTIONbits_t;
    
    uint16_t timeInState = 0;

#ifdef	__cplusplus
}
#endif

#endif	/* MAIN_H */

