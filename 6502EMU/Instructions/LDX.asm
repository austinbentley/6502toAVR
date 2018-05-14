/*
 * LDX.asm
 *
 *  Created: 5/13/2018 12:52:17 PM
 *   Author: ROTP
 */ 

 LDX_zpg:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH

	dereferencer XR
	updateNZfromREGISTER XR

	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1

	RET

LDX_immediate:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1 ;grab the next byte 
	
	dereferencer XR
	;call dereferencer
	
	ADIW ZH:ZL, 1 ;increase pc to next instruction

	RET

LDX_absolute:
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

	dereferencer XR
	updateNZfromREGISTER XR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

LDX_zpg_Y:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH

	add zl, YR
	clc

	dereferencer XR
	updateNZfromREGISTER XR

	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1

	RET

LDX_absolute_Y:
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
	add zl, YR
	adc zh, r26

	dereferencer XR
	updateNZfromREGISTER XR

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET