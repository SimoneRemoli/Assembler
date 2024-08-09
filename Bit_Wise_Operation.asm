.org 0x800
.data

var: .quad 75 #1001011 voglio conoscere gli ultimi 4 bit di questo numero (11)

.text
main:

andq $0x0000000f, var # 00001011 (entra nel byte) = (11)
movq var, %rcx

shlb $2, %cl #moltiplico il valore contenuto in cl per 4 (44) . = (00101100)

testb $0x0c, %cl #maschera 00001100 = voglio vedere se i bit numero 2 e 3 di 44 (partendo dal meno significativo) sono impostati
jnz .label
.fine:

orb $0x80, %cl #00101100 -> 10101100 = 172 (ho impostato a 1 il bit più significativo del byte) maschera = 10000000
and $0x7f, %cl #10101100 (imposto a zero il bit più significativo) e ritorno a 44 in cl -> 010101100 (CON AND)

#ORA INVERTIAMO IL BIT PIÙ SIGNIFICATIVO
xorb $0x80, %cl #quindi ritorna 172 perchè in cl avevo: #010101100 -> #11010110
xorb $0x80, %cl #quindi ritorna 44 perchè in cl avevo:   #110101100 -> #01010110


hlt

.label:
movq $10, %rdi
jmp .fine



