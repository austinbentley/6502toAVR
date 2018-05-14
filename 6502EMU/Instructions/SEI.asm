/*
 * SEI.asm
 *
 *  Created: 5/13/2018 3:04:54 PM
 *   Author: ROTP
 */ 
  SEI_implied:
	swapPCwithTEMPPC

	SBR SR, INTERRUPT_FLAG
	ADIW ZH:ZL, 1
	RET