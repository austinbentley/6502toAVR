/*
 * CMP.asm
 *
 *  Created: 5/13/2018 3:19:37 PM
 *   Author: ROTP
 */ 

CMP_immediate:
	swapPCwithTEMPPC
	ADIW ZH:ZL, 1

	dereferencer r22
	cp AR, r22

	BRLT CMP_immediate_lt
	BREQ CMP_immediate_eq

CMP_immediate_gt:
	;AR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CMP_immediate_ret
	ADIW ZH:ZL, 1
	RET
CMP_immediate_lt:
	;AR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	;JMP CMP_immediate_ret
	ADIW ZH:ZL, 1
	RET
CMP_immediate_eq:
	;AR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CMP_immediate_ret


CMP_immediate_ret:
	ADIW ZH:ZL, 1
	RET