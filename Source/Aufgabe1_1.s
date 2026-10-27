/*
 * Aufgabe_1_1.S
 *
 * WiSe 2026
 *
 *  Created on: 20.10.
 *      Author: Jan Stang
 *
 *	Aufgabe : Flags und bedingte Ausführung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
//Version 1
        mov R0, #2    // threshold
        mov R1, #5    // value
        cmp R1, R0
        bgt else      // if value > threshold
        mov R1, #0    // value <= treshold
        b endif

else:
        mov R1, #255  // value

endif:
.equ THRESHOLD, 5
//Version 2
        mov R0, #THRESHOLD      
        mov R1, #THRESHOLD - 1      
        cmp R1, R0
        movle R1, #0    // if value <= threshold
        movgt R1, #255  // else if value > threshold 

        mov R0, #THRESHOLD      
        mov R1, #THRESHOLD     
        cmp R1, R0
        movle R1, #0    
        movgt R1, #255 

        mov R0, #THRESHOLD      
        mov R1, #THRESHOLD + 1      
        cmp R1, R0
        movle R1, #0   
        movgt R1, #255 

        mov R0, #0      
        mov R1, #0      
        cmp R1, R0
        movle R1, #0    
        movgt R1, #255   

        mov R0, #THRESHOLD     
        mov R1, #0xFFFFFF   // x = high number
        cmp R1, R0
        movlt R1, #0   
        movge R1, #255 
      
stop:
	nop
	bal stop


.end
