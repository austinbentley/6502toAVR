/*
 * STA.asm
 *
 *  Created: 5/13/2018 4:51:41 PM
 *   Author: ROTP
 */ 

STA_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1

	;TODO: verify endianness is correct. 
	dereferencer r23
	ADIW ZH:ZL, 1
	dereferencer r22

	mov r24, zl
	mov r25, zh

	mov zl, r23
	mov zh, r22

	dereferencer_write AR
	;CALL dereferencer_write

	mov zl, r24
	mov zh, r25

	ADIW ZH:ZL, 1
	RET