/*
 * CLV.asm
 *
 *  Created: 5/13/2018 3:04:30 PM
 *   Author: ROTP
 */ 
 CLV_implied:
	swapPCwithTEMPPC

	CBR SR, OVERFLOW_FLAG
	ADIW ZH:ZL, 1
	RET