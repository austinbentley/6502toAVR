/*
 * STY.asm
 *
 *  Created: 5/13/2018 5:29:00 PM
 *   Author: ROTP
 */ 

STY_zpg: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	clr zh

	dereferencer_write YR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

STY_zpg_X: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	clr zh
	
	clr r26
	add ZL, XR
	adc ZH, R26

	dereferencer_write YR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET



STY_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	dereferencer_write YR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET