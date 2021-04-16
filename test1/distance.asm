;Zachary Thompson
;CPSC240-7 Test 1

extern scanf
extern printf
global distance

section .data
first_point db "Please enter the coordinates of the first point separated by ws: ",10,0
second_point db "Please enter the coordinates of the second point separated by ws: ",10,0
output_distance db "The distance between those two points is %lf math units.",10,0
goodbye db "The distance module will now return that number to the caller module.",10,0
two_floats db "%lf",32,"%lf",0

section .text

distance:

push rbp
mov  rbp,rsp

mov rax, 0
mov rdi, first_point
call printf

;Input first point
push qword 0
push qword 0
mov rax, 2
mov rdi, two_floats
mov rsi, rsp
mov rdx, rsp
add rdx, 8
call scanf
movsd xmm15, [rsp]
pop rax
movsd xmm14, [rsp]
pop rax

mov rax, 0
mov rdi, second_point
call printf

;Input second point
push qword 0
push qword 0
mov rax, 2
mov rdi, two_floats
mov rsi, rsp
mov rdx, rsp
add rdx, 8
call scanf
movsd xmm13, [rsp]
pop rax
movsd xmm12, [rsp]
pop rax

;Calculate Distance
subsd xmm15, xmm13
subsd xmm14, xmm12
mulsd xmm15, xmm15
mulsd xmm14, xmm14
addsd xmm15, xmm14
sqrtsd xmm15, xmm15


mov rax, 1
mov rdi, output_distance
movsd xmm0, xmm15
call printf

mov rax, 0
mov rdi, goodbye
call printf

pop rbp

movsd xmm0, xmm15
ret
