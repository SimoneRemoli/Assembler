.org 0x20a0
.data

array: .byte 1,2,3,5,5,6,8,9
dim: .quad 8
.equ log2dim, 3

.text
main:

xorq %rax, %rax
movq $0, %rcx

.loop:
addb array(, %rcx,1), %al
jc .error
addq $1, %rcx
cmpq %rcx, dim
jnz .loop

shrb $log2dim, %al
jmp .write
.error:
movb $0xFF, %al #Man mano il valore dell'array con la media nell'ultima posizione
movq $dim, %rcx
