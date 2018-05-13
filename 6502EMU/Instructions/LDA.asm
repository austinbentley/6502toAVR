/*
 * LDA.asm
 *
 *  Created: 5/12/2018 9:14:03 PM
 *   Author: ROTP
 */ 



LDA_immediate: ;LDA #$09 => A9 09
	ADIW ZH:ZL, 1 ;grab the next byte 
	
	dereferencer AR
	
	ADIW ZH:ZL, 1 ;increase pc to next instruction

	RET