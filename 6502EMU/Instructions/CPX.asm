/*
 * CPX.asm
 *
 *  Created: 5/13/2018 3:59:56 PM
 *   Author: ROTP
 */ 

CPX_immediate: ;UNTESTED
	swapPCwithTEMPPC
	ADIW ZH:ZL, 1

	dereferencer r22
	cp XR, r22

	BRLT CPX_immediate_lt
	BREQ CPX_immediate_eq

CPX_immediate_gt:
	;XR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPX_immediate_ret
	ADIW ZH:ZL, 1
	RET
CPX_immediate_lt:
	;XR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	;JMP CPX_immediate_ret
	ADIW ZH:ZL, 1
	RET
CPX_immediate_eq:
	;XR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPX_immediate_ret


CPX_immediate_ret:
	ADIW ZH:ZL, 1
	RET
	
	
CPX_zpg: ;UNTESTED 
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH


	dereferencer R25
	cp XR, r25

	BRLT CPX_zpg_lt
	BREQ CPX_zpg_eq

CPX_zpg_gt:
	;XR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CPX_zpg_ret
CPX_zpg_lt:
	;XR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CPX_zpg_ret
CPX_zpg_eq:
	;XR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPX_zpg_ret

CPX_zpg_ret:
	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1
	RET

	
CPX_absolute: ;UNTESTED
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
	cp XR, r26

	BRLT CPX_absolute_lt
	BREQ CPX_absolute_eq

CPX_absolute_gt:
	;XR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CPX_absolute_ret
CPX_absolute_lt:
	;XR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CPX_absolute_ret
CPX_absolute_eq:
	;XR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CPX_absolute_ret

CPX_absolute_ret:
	mov ZL, R24 ;restore Z
	mov ZH, R25
	ADIW ZH:ZL, 1
	RET