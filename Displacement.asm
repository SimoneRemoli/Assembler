.org 0x800
.data

array: .long 1,23,3,4,89,12
indice: .quad 4


.text
main:

movq $array, %rax
movq indice, %rbx

movl array(,%rbx,4), %ecx





