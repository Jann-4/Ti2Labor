/*
 * Aufgabe_1_4.S
 *
 * WiSe 2026
 *
 *  Created on: 20.10.
 *      Author: Jan Stang
 *
 *	Aufgabe : Maskenoperationen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

  // Nibble 0 (Bits 0..3)
  .equ BREAD_bm,      (1 << 0)
  .equ BUTTER_bm,     (1 << 1)
  .equ CHEESE_bm,     (1 << 2)
  .equ JAM_bm,        (1 << 3)

  // Byte 1 (Bits 4..11)
  .equ TEQUILA_bm,    (1 << 4)
  .equ MILK_bm,       (1 << 5)
  .equ RUM_bm,        (1 << 6)
  .equ VINE_bm,       (1 << 7)
  .equ VODKA_bm,      (1 << 8)

  // Nibble 2 (Bits 12..15)
  .equ ALMOND_bm,     (1 << 12)
  .equ PEANUT_bm,     (1 << 13)
  .equ CHESTNUTS_bm,  (1 << 14)

  // Nibble 3 (Bits 16..19)
  .equ ANANAS_bm,     (1 << 16)
  .equ BANANA_bm,     (1 << 17)
  .equ LEMON_bm,      (1 << 18)


  .equ FOOD_bm,       (BREAD_bm | BUTTER_bm | CHEESE_bm | JAM_bm)
  .equ DRINKS_bm,     (TEQUILA_bm | MILK_bm | RUM_bm | VINE_bm | VODKA_bm)
  .equ NUTS_bm,       (ALMOND_bm | PEANUT_bm | CHESTNUTS_bm)
  .equ FRUITS_bm,     (ANANAS_bm | BANANA_bm | LEMON_bm)

  .equ BREAKFAST_bm,  (BREAD_bm | BUTTER_bm | CHEESE_bm | MILK_bm | PEANUT_bm | LEMON_bm)


main:
    
  LDR R0, =(BREAKFAST_bm)
  LDR R1, =(BREAKFAST_bm | FRUITS_bm)
  LDR R2, =((BREAKFAST_bm & ~MILK_bm) | VODKA_bm)
  LDR R3, =(FRUITS_bm | (FRUITS_bm << 16))
  LDR R4, =((BREAKFAST_bm & ~(MILK_bm | BUTTER_bm | CHEESE_bm)) | JAM_bm |ALMOND_bm)
  LDR R5, =((BREAKFAST_bm & ~PEANUT_bm) | ALMOND_bm)

  b stop

stop:
	nop
	bal stop

.end
