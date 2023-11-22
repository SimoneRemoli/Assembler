.org 0x800
.data 

array: .quad 7,8,6,5,3,2,1,0
dim: .quad 8

.text
main:

xorq %rcx, %rcx
movq $array, %rsi
movq $1, %rdi

.fuori:


movq (%rsi, %rcx, 8), %rdx #in rdx vedo man mano i valori del vettore, e questo è h[i]
addq $1, %rcx
cmpq dim, %rcx
jz .finish
movq %rcx, %rdi 

#condizione di terminazione su RCX

.ciclo:
movq(%rsi,%rdi,8), %r14 #in r14 vedo man mano h[j]


#IF
cmpq %rdx, %r14
js .swapped
.ritorna:


addq $1, %rdi
cmpq dim, %rdi
jnz .ciclo
jz .fuori

.finish:
movq $156, %r9
#ora view array totale
xorq %rcx, %rcx
movq $array, %rsi
.l:
movq(%rsi,%rcx,8),%r15 #in r15 vedo l'array sorted
addq $1, %rcx
cmpq dim, %rcx
jnz .l
hlt




.swapped:
#ridurre rcx di 1
subq $1,%rcx
movq  (%rsi, %rcx, 8), %r13 #r13 temp = a[i]
movq(%rsi,%rdi,8),  (%rsi, %rcx, 8) #a[i]=a[j]
movq %r13, (%rsi,%rdi,8)
movq (%rsi,%rcx,8), %rdx
addq $1, %rcx
jmp .ritorna

