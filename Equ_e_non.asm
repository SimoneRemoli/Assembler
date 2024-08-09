.org 0x20a0
.data

array: .byte 1,2,3,5,5,6,8,9
dim: .quad 8
.equ ciao, 3 #costante
ciao2: .byte 3

.text
main:

movb $ciao, %al #metto il dollaro con equ
movb ciao2, %bl #tolgo il dollaro per lo spostamento se non ho dichiaratola variabile in equ
subb $1, ciao2 #la variabile non equ ciao2 viene decrementata a 2. E viene messa in bl.
movb ciao2, %bl
cmpb $ciao, ciao2
js .label
.return:
subb $1, ciao2
movb ciao2, %bl
hlt

.label:
movq $5, %rsi
jmp .return
