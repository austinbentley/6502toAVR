/*
 * CPY.asm
 *
 *  Created: 5/13/2018 3:59:56 PM
 *   Author: ROTP
 */ 

CPY_immediate: ;UNTESTED
	swapPCwithTEMPPC
	ADIW ZH:ZL, 1

	dereferencer r22
	cp YR, r22

	BRLT CPY_immediate_lt
	BREQ CPY_immediate_eq

CPY_immediate_gt:
	;YR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPY_immediate_ret
	ADIW ZH:ZL, 1
	RET
CPY_immediate_lt:
	;YR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	;JMP CPY_immediate_ret
	ADIW ZH:ZL, 1
	RET
CPY_immediate_eq:
	;YR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPY_immediate_ret


CPY_immediate_ret:
	ADIW ZH:ZL, 1
	RET
	
	
CPY_zpg: ;UNTESTED 
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH


	dereferencer R25
	cp YR, r25

	BRLT CPY_zpg_lt
	BREQ CPY_zpg_eq

CPY_zpg_gt:
	;YR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CPY_zpg_ret
CPY_zpg_lt:
	;YR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CPY_zpg_ret
CPY_zpg_eq:
	;YR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPY_zpg_ret

CPY_zpg_ret:
	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1
	RET

	
CPY_absolute: ;UNTESTED
	swapPCwithTEMPPC


	ADIW ZH:ZL, 1
	dereferencer r23 ;grab LO
	ADIW ZH:ZL, 1
	dereferencer r22 ;grab HI

	mov r24, ZL ;preserve Z
	mov r25, ZH

	MOV ZH, R22 ;put new data in Z
	MOV ZL, R23


	dereferencer r26
	cp YR, r26

	BRLT CPY_absolute_lt
	BREQ CPY_absolute_eq

CPY_absolute_gt:
	;YR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CPY_absolute_ret
CPY_absolute_lt:
	;YR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CPY_absolute_ret
CPY_absolute_eq:
	;YR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPY_absolute_ret

CPY_absolute_ret:
	mov ZL, R24 ;restore Z
	mov ZH, R25
	ADIW ZH:ZL, 1
	RET