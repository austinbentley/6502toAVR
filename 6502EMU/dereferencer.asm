/*
 * dereferencer.asm
 *
 *  Created: 5/13/2018 12:35:43 AM
 *   Author: ROTP
 */ 

 
.MACRO dereferencer
	;328p memory starts at 0x0100 and goes up to 0x8ff. 
	;6502 memory starts at 0x0000.
	
	;Hence, all memory addresses referenced will have to be less than 0x07ff (6502 address),
	;because we will have to add 100 to it. 

	;previous RAM only code:
	;ldi r16, HIGH(SRAM_START)
	;adc ZH, r16
	;
	;ld AR, Z+
	;
	;sbc ZH, r16
	


dereferencer_SRAM_load:
	; IF ZH <= HIGH SRAM_END_EMU then RAM
	;	ZH += HIGH(SRAM_START)
	;   load data into reg
	;   ZH -= HIGH(SRAM_START)
	CPI ZH, HIGH(SRAM_END_EMU)+1
	BRGE dereferencer_ROM_load

	LDI r16, HIGH(SRAM_START)

	;ADIW ZH, HIGH(SRAM_START)
	ADD ZH, r16
	
	LD @0, Z+

	;SBIW ZH, HIGH(SRAM_START)
	SUB ZH, r16
	
	;RET 
	JMP dereferencer_return

dereferencer_ROM_load:
	; IF ZH <= ROM_END then ROM
	;	ZH -= HIGH(ROM_START_EMU)
	;   load data into reg from ROM data
	;   ZH += HIGH(ROM_START_EMU)
	CPI ZH, HIGH(ROM_END_EMU)+1 ;0x0801
	BRGE dereferencer_EEPROM_load

	LDI r16, HIGH(ROM_START_EMU)
	LDI r17, LOW(ROMcode)
	LDI r18, HIGH(ROMcode)
	SUB ZH, r16 ;0802 => 0002

	;Z now has the proper index of the data we want from our large ROM "array". We need to add the array ptr to Z now and then multiply by two
	ADD ZL, r17 
	ADC ZH, r18 ;2 + 16
	LSL ZL ; 
	ROL ZH ; 

	LPM @0, Z ;0x0818

	; Z is no longer in proper PC, so set it back to proper PC format. 
	; TODO: replace this code with a swap routine? no clue which is faster (yet.)
	LSR ZH
	ASR ZL
	ADD ZH, r16
	SUB ZH, R18
	SBC ZL, R17
	
	;WANT 0x0801

	;RET
	JMP dereferencer_return
	h
dereferencer_EEPROM_load:
	; IF ZH <= EEPROM_END then EEPROM
	;	ZH -= HIGH(EEPROM_START_EMU)
	;   load data into reg from EEPROM data
	;   ZH += HIGH(EEPROM_START_EMU
	; IF ZH > EEPROM_END then CRASH
	CPI ZH, HIGH(EEPROM_END_EMU)+1
	BRGE BREAK_load

	BREAK

dereferencer_BREAK_load:
	BREAK

	;RET
	JMP dereferencer_return

dereferencer_return:
.ENDMACRO
