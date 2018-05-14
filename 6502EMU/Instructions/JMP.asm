/*
 * JMP.asm
 *
 *  Created: 5/13/2018 5:40:47 PM
 *   Author: ROTP
 */ 

JMP_absolute:
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	dereferencer r22
	ADIW ZH:ZL, 1
	dereferencer r23

	mov zl, r22
	mov zh, r23

	ret