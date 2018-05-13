/*
 * LDA.asm
 *
 *  Created: 5/12/2018 9:14:03 PM
 *   Author: ROTP
 */ 


;LDA_X_indirect:
LDA_zpg:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH

	dereferencer AR

	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1

	RET

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
	dereferencer r23
	ADIW ZH:ZL, 1
	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	dereferencer AR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET


;LDA_indirect_Y:
;LDA_zpg_X

LDA_absolute_Y:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	;TODO: verify endianness is correct. 
	dereferencer r23
	ADIW ZH:ZL, 1
	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	clr r26
	add zl, YR
	adc zh, r26

	dereferencer AR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

LDA_absolute_X:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	;TODO: verify endianness is correct. 
	dereferencer r23
	ADIW ZH:ZL, 1
	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	clr r26
	add zl, XR
	adc zh, r26

	dereferencer AR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET