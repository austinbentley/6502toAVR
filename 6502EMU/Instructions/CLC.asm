/*
 * CLC.asm
 *
 *  Created: 5/13/2018 2:52:01 PM
 *   Author: ROTP
 */ 


CLC_implied:
	swapPCwithTEMPPC

	CBR SR, CARRY_FLAG
	ADIW ZH:ZL, 1
	RET