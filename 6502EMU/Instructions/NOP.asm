/*
 * NOP.asm
 *
 *  Created: 5/13/2018 5:39:54 PM
 *   Author: ROTP
 */ 

NOP_implied:
	swapPCwithTEMPPC
	;NOP
	ADIW ZH:ZL, 1

	RET