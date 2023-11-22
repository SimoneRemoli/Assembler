.org 0x800
.data
    array: .quad 46,7,66,20,64,9,12
    dim: .quad 7
.text
main:
xorq %rcx, %rcx
xorq %rbx, %rbx
movq $array, %rdi
movq (%rdi, %rcx, 8), %rbx
.ciclo:
movq (%rdi, %rcx, 8), %rdx
cmpq %rbx, %rdx
js .swap
 
.here:
addq $1, %rcx
cmpq dim, %rcx
jnz .ciclo
hlt
 
.swap:
movq %rdx, %rsi
mov %rsi, %rbx
jmp .here
