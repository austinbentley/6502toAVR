;
; 6502EMU.asm
;
; Created: 5/12/2018 8:00:12 AM
; Author : ROTP
;

start: ;to avoid overwriting the interrupt table with our includes!
	jmp init


.DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.include "programcode.asm"
.include "definitions.asm"
.include "general_macros.asm"
.include "memorymap.asm"
.include "dereferencer.asm"
.include "Instructions/unimplemented_instructions.asm"
.include "Instructions/BRK.asm"
.include "Instructions/CMP.asm"
.include "Instructions/CLC.asm"
.include "Instructions/CLD.asm"
.include "Instructions/CLI.asm"
.include "Instructions/CLV.asm"
.include "Instructions/CPX.asm"
.include "Instructions/CPY.asm"
.include "Instructions/INX.asm"
.include "Instructions/LDA.asm"
.include "Instructions/LDX.asm"
.include "Instructions/LDY.asm"
.include "Instructions/SEC.asm"
.include "Instructions/SED.asm"
.include "Instructions/SEI.asm"
.include "Instructions/STA.asm"


.include "instruction_mappings.asm"

init:
	; TODO: Copy RAMcode to SRAM
	ldi ZH, HIGH(RAMcodeUNLOADED)
	ldi ZL, LOW(RAMcodeUNLOADED)

	ldi XH, HIGH(SRAM_START)
	ldi XL, LOW(SRAM_START)

	ldi YH, HIGH(SRAM_END)
	ldi YL, LOW(SRAM_END)

	LSL ZL
	ROL ZH

ram_copy_loop:
	lpm r0, Z+
	st X+, r0

	cp XH, YH
	brne ram_copy_loop
	cp XL, YL
	brne ram_copy_loop

ram_copy_done:


	jmp _start

_start:
	clr AR ; clear A register
	clr XR ; clear X register
	clr YR ; clear Y register
	clr SR ; clear status register
	clr ZH ; clear PC HIGH register
	clr ZL ; clear PC LOW register
	CLR XH
	CLR XL
	CLR YH
	CLR YL
	CLR R0

	; 1. Fetch instruction from PC
	; 2. Decode instruction
	; 3. Execute instruction (updating PC if necessary.)
	;    a. Ensure mappings are correct. 
	; 4. Come back here to execute the next instruction. 

;    inc r1
;	sts instructionTable, r1
	


fetch_setup:
	;we want the code to start in ROM. 
	LDI ZH, HIGH(ROM_START_EMU)
	LDI ZL, LOW(ROM_START_EMU)
	LDI TEMPPCH, HIGH(ROM_START_EMU) 
	LDI TEMPPCL, LOW(ROM_START_EMU)

fetch:

	dereferencer INSTRUCTION
	ldi r16, 2
	mul INSTRUCTION, r16

	;we have the pointer to the instruction.
	;preserve the old pc
	;we need to add to Z for the offset. 
	mov TEMPPCL, ZL
	mov TEMPPCH, ZH

	;calcutate the pointer for getting the instruction's address. 
	LDI ZL, LOW(instructionMapping*2)
	LDI ZH, HIGH(instructionMapping*2)
	add zl, r0
	adc zh, r1
	
	;grab the instruction address and store it in Z
	lpm R0, Z+
	lpm r1, z
	mov zl, r0
	mov zh, r1

	icall

    rjmp fetch



