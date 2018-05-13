/*
 * TYA.asm
 *
 *  Created: 5/13/2018 5:35:36 PM
 *   Author: ROTP
 */ 

TYA_implied: ;UNTESTED
	swapPCwithTEMPPC
	
	MOV AR, YR

	updateNZfromREGISTER AR

	ADIW ZH:ZL, 1
	RET