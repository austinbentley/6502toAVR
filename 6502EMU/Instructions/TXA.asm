/*
 * TXA.asm
 *
 *  Created: 5/13/2018 5:35:03 PM
 *   Author: ROTP
 */ 

TXA_implied: ;UNTESTED
	swapPCwithTEMPPC
	
	MOV AR, XR

	updateNZfromREGISTER AR

	ADIW ZH:ZL, 1
	RET