/*
 * CLI.asm
 *
 *  Created: 5/13/2018 3:04:22 PM
 *   Author: ROTP
 */ 
 CLI_implied: ;UNTESTED
	swapPCwithTEMPPC

	CBR SR, INTERRUPT_FLAG
	ADIW ZH:ZL, 1
	RET