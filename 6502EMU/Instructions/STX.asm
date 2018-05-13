/*
 * STX.asm
 *
 *  Created: 5/13/2018 5:28:16 PM
 *   Author: ROTP
 */ 


STX_zpg: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	clr zh

	dereferencer_write XR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

STX_zpg_Y: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	clr zh
	
	clr r26
	add ZL, YR
	adc ZH, R26

	dereferencer_write XR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET



STX_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	dereferencer_write XR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET