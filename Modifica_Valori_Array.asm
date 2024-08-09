.org 0x20a0
.data

array: .byte 1,2,3,4,5

.text
main:
xorq %rax,%rax
movq $array, %rbx
.loop:
addb $1, (%rbx,%rax,1)
addq $1, %rax
cmpq $5, %rax
jnz .loop

xorq %rax,%rax
.loop2:
movb (%rbx,%rax,1),%bpl
addq $1, %rax
cmpq $5, %rax
jnz .loop2

