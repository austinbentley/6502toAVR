/*
 * LDA.asm
 *
 *  Created: 5/12/2018 9:14:03 PM
 *   Author: ROTP
 */ 


;LDA_X_indirect:
;LDA_zpg:

LDA_immediate: ;LDA #$09 => A9 09
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1 ;grab the next byte 
	
	dereferencer AR
	;call dereferencer
	
	ADIW ZH:ZL, 1 ;increase pc to next instruction

	RET

LDA_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	;TODO: verify endianness is correct. 
	dereferencer r22 
	ADIW ZH:ZL, 1
	dereferencer r23
	mov zl, r22
	mov zh, r23

	dereferencer AR

	ADIW ZH:ZL, 1
	RET


;LDA_indirect_Y:
;LDA_zpg_X
;LDA_absolute_Y:
;LDA_absolute_X: