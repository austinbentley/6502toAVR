/*
 * SEC.asm
 *
 *  Created: 5/13/2018 2:54:36 PM
 *   Author: ROTP
 */ 


 SEC_implied:
	swapPCwithTEMPPC

	SBR SR, CARRY_FLAG
	ADIW ZH:ZL, 1
	RET