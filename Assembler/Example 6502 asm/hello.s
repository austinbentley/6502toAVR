; hello world example
; for win2c64 by Aart Bik
; http://www.aartbik.com/

chrout  .equ   $ffd2   ; kernal addresss

main    .org   $0000   ; start at free RAM
        ldx    #0
loop    lda    text,x
        jsr    chrout    
        inx
        cpx    #11
        bne    loop 
        rts
		
rom_start .org $0800
		nop 
		nop
		nop
		nop
		jmp rom_start 

text    .byte  "HELLO WORLD"

		nop
		nop
		nop
		nop

eeprom_start .org $1000
		nop
		nop
		nop
		nop
		jmp eeprom_start
		


