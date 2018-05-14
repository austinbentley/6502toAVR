/*
 * TAY.asm
 *
 *  Created: 5/13/2018 5:34:16 PM
 *   Author: ROTP
 */ 

TAY_implied: ;UNTESTED
	swapPCwithTEMPPC
	
	MOV YR, AR

	updateNZfromREGISTER YR

	ADIW ZH:ZL, 1
	RET