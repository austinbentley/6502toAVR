/*
 * memorymap.asm
 *
 *  Created: 5/12/2018 7:26:24 PM
 *   Author: ROTP
 */ 

 ; To access SRAM, a offset of (6502 memory address) - SRAM_START will have to be applied. 

; .EQU SRAM_START = 0x0100 
 .EQU SRAM_END   = 0x08FF

 .EQU SRAM_START_EMU = 0x0000
 .EQU SRAM_END_EMU = 0x07FF


 ; To access ROM, a offset of (6502 memory address) - ROM_START will have to be applied. 
 .EQU ROM_START_EMU = 0x0800
 .EQU ROM_END_EMU   = 0x0FFF


 ; To access EEPROM, a offset of (6502 memory address) - EEPROM_START will have to be applied. 
 ; EEPROM is checked last, so it is technically the least performant memory type. 

 .EQU EEPROM_START_EMU = 0x1000
 .EQU EEPROM_END_EMU   = 0x13FF 
