/*
 * INX.asm
 *
 *  Created: 5/13/2018 4:10:05 PM
 *   Author: ROTP
 */ 

INX_implied:
	swapPCwithTEMPPC
	INC XR

	updateNZfromREGISTER XR

	ADIW ZH:ZL, 1
	RET