/*
 * Aufgabe_1_3.S
 *
 * WiSe 2026
 *
 *  Created on: 20.10.
 *      Author: Jan Stang
 *
 *	Aufgabe : 64 Bit Addition mit Sättigung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:

    LDR R0, =0xFFFFFFFF
    LDR R1, =0xFFFFFFFF
    LDR R2, =0x00000001
    LDR R3, =0x00000000
    
    ADDS    R4, R0, R2      // Low-Word addieren
    ADCS    R5, R1, R3      // High-Word addieren

    //Wenn Sättigung
    LDRCS   R4, =0xFFFFFFFF // Low-Word auf Maximalwert begrenzen
    LDRCS   R5, =0xFFFFFFFF // High-Word auf Maximalwert begrenzen

    b stop

stop:
	nop
	bal stop


.end