/*
 * Aufgabe_1_2.S
 *
 * WiSe 2026
 *
 *  Created on: 20.10.
 *      Author: Jan Stang
 *
 *	Aufgabe : 64 Bit Addition von Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    //R0 low Word Zahl 1
    //R1 high word Zahl 1
    //R2 low word zahl 2
    //R3 high word Zahl 2
    //R6 Überlauf
    MOV R0, #100
    MOV R1, #50
    MOV R2, #200
    MOV R3, #20

    // R6 für Überlauf (Carry der 64-Bit Addition) auf 0 zurücksetzen
    MOV     R6, #0          //

    // 1. Niederwertige 32-Bit Stellen addieren, setzt Carry
    ADDS    R4, R0, R2      // R4 = R0 + R2 (Low-Word)

    // 2. Höherwertige 32-Bit Stellen mit Carry addieren
    ADCS    R5, R1, R3      // R5 = R1 + R3 + Carry (High-Word)

    // 3. Falls bei den höherwertigen Stellen ein Überlauf entstand (Carry set)
    ADC     R6, R6, #0      // R6 = R6 + 0 + Carry (R6 wird 1 falls Überlauf, sonst 0)

    b stop

stop:
	nop
	bal stop

.end
