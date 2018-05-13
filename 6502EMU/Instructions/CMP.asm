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

CMP_zpg: 
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH


	dereferencer R25
	cp AR, r25

	BRLT CMP_zpg_lt
	BREQ CMP_zpg_eq

CMP_zpg_gt:
	;AR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CMP_zpg_ret
CMP_zpg_lt:
	;AR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CMP_zpg_ret
CMP_zpg_eq:
	;AR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CMP_zpg_ret

CMP_zpg_ret:
	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1
	RET



CMP_zpg_X: ;UNTESTED
	swapPCwithTEMPPC

	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH


	dereferencer R25
	add R25, XR
	cp AR, r25

	BRLT CMP_zpg_X_lt
	BREQ CMP_zpg_X_eq

CMP_zpg_X_gt:
	;AR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CMP_zpg_X_ret
CMP_zpg_X_lt:
	;AR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CMP_zpg_X_ret
CMP_zpg_X_eq:
	;AR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CMP_zpg_X_ret

CMP_zpg_X_ret:
	MOV ZL, R22
	MOV ZH, R23
	ADIW ZH:ZL, 1
	RET



CMP_absolute: 
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
	cp AR, r26

	BRLT CMP_absolute_lt
	BREQ CMP_absolute_eq


	/*
	ADIW ZH:ZL, 1
	MOV R22, ZL
	MOV R23, ZH

	dereferencer r24
	MOV ZL, R24
	CLR ZH


	dereferencer R25
	cp AR, r25

	BRLT CMP_absolute_lt
	BREQ CMP_absolute_eq*/

CMP_absolute_gt:
	;AR > R22 => Z = 0, C = 1
	CBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	JMP CMP_absolute_ret
CMP_absolute_lt:
	;AR < r22 => Z = 0, C = 0
	CBR SR, ZERO_FLAG
	CBR SR, CARRY_FLAG
	JMP CMP_absolute_ret
CMP_absolute_eq:
	;AR = R22 => Z = 1, C = 1
	SBR SR, ZERO_FLAG
	SBR SR, CARRY_FLAG
	;JMP CMP_absolute_ret

CMP_absolute_ret:
	mov ZL, R24 ;restore Z
	mov ZH, R25
	ADIW ZH:ZL, 1
	RET