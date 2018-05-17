; Modify this file and run the generate_AVR_asm.py script to generate the program assembly file which
; will be loaded by the microcontroller and emulated.

main    .org   $0000   ; start at free RAM
		nop
		nop
		nop
		nop
		jmp main
		
rom_start .org $0800
		nop 
		nop
		nop
		nop
		jmp rom_start 

eeprom_start .org $1000
		nop
		nop
		nop
		nop
		jmp eeprom_start
		


