/*
 * general_macros.asm
 *
 *  Created: 5/13/2018 1:55:47 AM
 *   Author: ROTP
 */ 

.MACRO swap8
	mov @2, @0 
	mov @0, @1
	mov @1, @2
.ENDMACRO

;TODO: see if this will work fine without a true swap?
.MACRO swapPCwithTEMPPC
	mov r16, zl
	mov zl, TEMPPCL
	mov TEMPPCL, r16

	mov r16, zh
	mov zh, TEMPPCH
	mov TEMPPCH, r16

	;swap8 zl TEMPPCL
	;swap8 zh TEMPPCH
.ENDMACRO

.MACRO updateNZfromREGISTER
;updateNZfromREGISTER: 
	CBR SR, NEGATIVE_FLAG
	CBR SR, ZERO_FLAG

	TST @0
	BRNE updateNZfromREGISTER_checkN
	SBR SR, ZERO_FLAG ;set if EQUAL

updateNZfromREGISTER_checkN:
	TST @0
	brpl updateNZfromREGISTER_ret ;is N set?
	SBR SR, NEGATIVE_FLAG

updateNZfromREGISTER_ret:
.ENDMACRO