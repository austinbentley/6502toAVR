/*
 * STA.asm
 *
 *  Created: 5/13/2018 4:51:41 PM
 *   Author: ROTP
 */ 

STA_zpg: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r22
	clr zh

	dereferencer_write AR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

STA_zpg_X: ;UNTESTED
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

	dereferencer_write AR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET



STA_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	dereferencer_write AR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

STA_absolute_X: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	CLR R26
	ADD ZL, XR
	ADC ZH, R26 

	dereferencer_write AR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET

STA_absolute_Y: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov r24, zl
	mov r25, zh

	mov zl, r22
	mov zh, r23

	CLR R26
	ADD ZL, YR
	ADC ZH, R26 

	dereferencer_write AR
	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET