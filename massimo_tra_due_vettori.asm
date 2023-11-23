#massimo elemento tra due array di longwords signed.
#Il programma visualizza il massimo dell'array1 nel registro r9 ed il massimo dell'array2 nel registro RSI.
#Il massimo di entrambi i  valori (ossia il massimo tra i due vettori) è memorizzato nel registro R10.
.org 0x800
.data

array1: .long 1,180,-1,6,9
array2: .long -1, -3, -6, 4, 10
dim: .quad 5

.text
main:

xorq %rbx, %rbx
xorq %rcx, %rcx
movq $array1, %rbx
movl (%rbx, %rcx, 4), %esi #il primo elemento è il massimo (all'inizio)
movq $1, %rcx
xorq %r14, %r14 #counter = 0

.loop:
movl (%rbx, %rcx, 4), %edi
cmpl %esi, %edi #se esi > edi deve continare ad esserlo
jo .n1 #of=1
jno .n2 #of=0
.return:
addq $1, %rcx
cmpq dim, %rcx
jnz .loop


cmp $1, %r14
jz .fine
movl %esi, %r9d #r9d takes max first vect
addq $1, %r14
jmp .appoggio


.fine:

cmpl %esi, %r9d
js .sorgmagg
jns .destmagg
.last:


hlt

.n1: #of=1
js .uguali
jmp .return


.n2: #of=0
jns .uguali
jmp .return

.uguali:

movl %edi, %esi #esi = edi (in esi/RSI c'è il massimo)
jmp .return


.appoggio:
xorq %rbx, %rbx
xorq %rcx, %rcx
xorq %rdi, %rdi
movq $array2, %rbx
movl (%rbx, %rcx, 4), %esi #il primo elemento è il massimo (all'inizio)
movq $1, %rcx
jmp .loop

#look rsi and r9 to maxi of one array

.sorgmagg:
movl %esi, %r10d
jmp .last
.destmagg:
movl %r9d, %r10d
jmp .last

#r10 contiene ll massimo assoluto 
