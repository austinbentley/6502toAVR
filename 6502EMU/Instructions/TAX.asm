/*
 * TAX.asm
 *
 *  Created: 5/13/2018 5:33:30 PM
 *   Author: ROTP
 */ 
TAX_implied: ;UNTESTED
	swapPCwithTEMPPC
	
	MOV XR, AR

	updateNZfromREGISTER XR

	ADIW ZH:ZL, 1
	RET