/*
 * Aufgabe_2_1.S
 *
 * SoSe 2026
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Unterprogrammaufruf (activ waiting delay)
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    //Test
    //Test
    //TEest

stop:
	nop
	bal stop

.end
