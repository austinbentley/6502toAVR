/*
 * SED.asm
 *
 *  Created: 5/13/2018 3:04:47 PM
 *   Author: ROTP
 */ 

  SED_implied:
	swapPCwithTEMPPC

	SBR SR, DECIMAL_FLAG
	ADIW ZH:ZL, 1
	RET