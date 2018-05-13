/*
 * AssemblerApplication2.asm
 *
 *  Created: 6/19/2015 2:22:36 AM
 *   Author: ROTP
 */ 


 ;let's see if we can get far enough to fire up port 3 with pwm?
 ;pin 3 = PD1
;DDRD - The Port D Data Direction Register - read/write
;PORTD - The Port D Data Register - read/write
;PIND - The Port D Input Pins Register - read only 
;sooo if we want pin 3 to be set to high:
;PORTD = 0b00001000

 .EQU RAMBEGIN = 0x0100

 .CSEG
 .ORG 0000
	RJMP Start

Start:
	LDI R16, HIGH(RAMBEGIN)
	LDI R17, LOW(RAMBEGIN)

	;ldi DDRD, 0b00001000
	;ldi PortD, 0b00001000
	sbi PortD, 3

	ldi r16, 0b00001100
	out PortD, r16

	RET