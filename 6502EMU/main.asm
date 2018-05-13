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
.include "dereferencer.asm"
.include "Instructions/LDA.asm"
.include "memorymap.asm"

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
	clr ZH ; clear PC HIGH register
	clr ZL ; clear PC LOW register

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

fetch:
	nop

	dereferencer INSTRUCTION

    rjmp fetch



