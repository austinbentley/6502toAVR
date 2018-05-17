/*
 * definitions.asm
 *
 *  Created: 5/12/2018 9:29:05 PM
 *   Author: ROTP
 */ 

 .DEF AR = R2
 .DEF XR = R3
 .DEF YR = R4
 .DEF INSTRUCTION = R6

 .DEF TEMPPCL = R20
 .DEF TEMPPCH = R21

 ;R22 through R26 are considered junk registers and will be clobbered repeatedly. 


/*
SR Flags (bit 7 to bit 0):

N	....	Negative
V	....	Overflow
-	....	ignored
B	....	Break
D	....	Decimal (use BCD for arithmetics)
I	....	Interrupt (IRQ disable)
Z	....	Zero
C	....	Carry*/

 .DEF SR = R27
 .EQU NEGATIVE_FLAG = 0b10000000
 .EQU OVERFLOW_FLAG = 0b01000000
 .EQU IGNORED_FLAG = 0b00100000
 .EQU BREAK_FLAG = 0b00010000
 .EQU DECIMAL_FLAG = 0b00001000
 .EQU INTERRUPT_FLAG = 0b00000100
 .EQU ZERO_FLAG = 0b00000010
 .EQU CARRY_FLAG = 0b00000001