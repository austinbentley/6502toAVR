/*
 * CLD.asm
 *
 *  Created: 5/13/2018 3:04:14 PM
 *   Author: ROTP
 */ 
 
 CLD_implied: ;UNTESTED
	swapPCwithTEMPPC

	CBR SR, DECIMAL_FLAG
	ADIW ZH:ZL, 1
	RET