.org 0x20a0
.data

array: .byte 1,2,3,4,5

.text
main:
xorq %rax,%rax

.loop:
addb $1, array(,%rax,1)
addq $1, %rax
cmpq $5, %rax
jnz .loop

xorq %rax,%rax
.loop2:
movb array(,%rax,1),%bpl
addq $1, %rax
cmpq $5, %rax
jnz .loop2
