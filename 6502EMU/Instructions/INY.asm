/*
 * INY.asm
 *
 *  Created: 5/13/2018 4:12:18 PM
 *   Author: ROTP
 */ 

 INY_implied: ;UNTESTED but highly likely to work. 
	swapPCwithTEMPPC
	INC YR
	
	updateNZfromREGISTER YR

	ADIW ZH:ZL, 1
	RET