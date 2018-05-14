/*
 * LDY.asm
 *
 *  Created: 5/13/2018 12:54:02 PM
 *   Author: ROTP
 */ 


 
 LDY_zpg:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH

	dereferencer YR
	updateNZfromREGISTER YR

	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1

	RET

LDY_immediate:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1 ;grab the next byte 
	
	dereferencer YR
	updateNZfromREGISTER YR
	;call dereferencer
	
	ADIW ZH:ZL, 1 ;increase pc to next instruction

	RET

LDY_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	;TODO: verify endianness is correct. 
	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	dereferencer YR
	updateNZfromREGISTER YR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

LDY_zpg_X:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH

	add zl, XR
	clc

	dereferencer YR
	updateNZfromREGISTER YR

	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1

	RET

LDY_absolute_X:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	;TODO: verify endianness is correct. 
	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	clr r26
	add zl, XR
	adc zh, r26

	dereferencer YR
	updateNZfromREGISTER YR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET