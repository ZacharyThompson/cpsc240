;----------------------------------------------------------------------------------------------------------------------------
;Program name: "Quadratic Formula".
;This program takes in 3 floating point numbers and displays the roots of the corresponding quadratic equation.
;Copyright (C) 2021 Zachary Thompson.                                                                         
;                                                                                                                           
;This file is part of the software program "Quadratic Formula".                                                                     
;Quadratic Formula is free software: you can redistribute it and/or modify it under the terms of the GNU
;General Public License version 3 as published by the Free Software Foundation.                                                                    
;Quadratic Formula is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
;----------------------------------------------------------------------------------------------------------------------------
;Author information ;
;  Author name: Zachary Thompson
;  Author email: zachth1723@csu.fullerton.edu
;
;Program information
;  Program name: Quadratic Formula
;  Programming languages: One module in C Language, Two modules in C++, and one module in X86.
;  Date program began: 2021-Feb-20
;  Date of last update: 2021-Feb-28
;  Files in this program: quadratic.asm, second_degree.c, quad_library.cpp, isfloat.cpp
;  Status: Complete.
;
;This file
;   File name: quadratic.asm
;   Language: X86 with Intel syntax.
;   Assemble: nasm -f elf64 -l quadratic.lis -o quadratic.o quadratic.asm
;   Link: g++ -m64 -fno-pie -no-pie -o quadformula.out second_degree.o quadratic.o quad_library.o isfloat.o

;----- Begin code area ------------------------------------------------------------------------------------------------------
extern printf
extern scanf
extern show_no_root
extern show_one_root
extern show_two_root
extern isfloat
extern atof
global quadratic 

section .data

prompt db "Please enter the three floating point coefficients of a quadratic equation in the order a, b, c separated by end of line character: ",0
equation db "Thank you. The equation is %lfx^2 + %lfx + %lf = 0.0",10,0
goodbye db "One of these roots will be returned to the caller function.",10,0
string_format db "%s",0
error_message db "Invalid input data detected.  You may run this program again.",10,0
wrong_equation db "This is not a quadratic equation.  You may run this program again.",10,0

section .text

quadratic:

;Prolog ----- Insurance for any caller of this assembly module --------------------------------------------------------------
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags


;Display prompt for inputting the coefficients
mov rax, 0
mov rdi, prompt
call printf

push qword 0 ;Align the stack
push qword 0

;Scanf block for inputting the A coefficient
mov rax, 0
mov rdi, string_format
sub rsp, 512
mov rsi, rsp
call scanf
;---Input Validation---
mov rax, 0                                                                                                   
mov rdi, rsp                                                                                                 
call isfloat                                                                                               
cmp rax, 0
je error_in_input
;----------------------
mov rax, 0                                                                                                   
mov rdi,rsp                                                                                                  
call atof
movsd xmm15, xmm0
add rsp, 512



;Scanf block for inputting the B coefficient
mov rax, 0
mov rdi, string_format
sub rsp, 512
mov rsi, rsp
call scanf
;---Input Validation---
mov rax, 0                                                                                                   
mov rdi, rsp                                                                                                 
call isfloat                                                                                               
cmp rax, 0
je error_in_input
;----------------------
mov rax, 0                                                                                                   
mov rdi,rsp                                                                                                  
call atof
movsd xmm14, xmm0
add rsp, 512



;Scanf block for inputting the C coefficient
mov rax, 0
mov rdi, string_format
sub rsp, 512
mov rsi, rsp
call scanf
;---Input Validation---
mov rax, 0                                                                                                   
mov rdi, rsp                                                                                                 
call isfloat                                                                                               
cmp rax, 0
je error_in_input 
;----------------------
mov rax, 0                                                                                                   
mov rdi,rsp                                                                                                  
call atof
movsd xmm13, xmm0
add rsp, 512


pop rax ;for pushes before 3 scanf blocks (Line 78)
pop rax


;If a = 0,
;then say error message and end the program
mov r8, 0
cvtsi2sd xmm2, r8
ucomisd xmm15, xmm2
je bad_a_coeff

;Display the equation
mov rax, 3
mov rdi, equation
movsd xmm0, xmm15
movsd xmm1, xmm14
movsd xmm2, xmm13
call printf

;-------------------Quadratic Formula----------------------------------
;a=xmm15,b=xmm14,c=xmm13

;get value of 2 into xmm0
mov r8, 2
cvtsi2sd xmm0, r8

;get value of 4 into xmm1
mov r8, 4
cvtsi2sd xmm1, r8

;get negative b
movsd xmm12, xmm14
movsd xmm11, xmm12
mulsd xmm11, xmm0
subsd xmm12, xmm11 ;-b in xmm12

;calculate b^2-4ac
movsd xmm11, xmm14
mulsd xmm11, xmm11 ;b^2
movsd xmm10, xmm15
movsd xmm9, xmm13
mulsd xmm10, xmm9
mulsd xmm10, xmm1 ;4ac
subsd xmm11, xmm10 ;b^2-4ac in xmm11

;If discriminant is negative,
;then say there are no roots and exit the program
mov r8, 0
cvtsi2sd xmm2, r8
ucomisd xmm11, xmm2
jb print_no_root

;sqrt(b^2-4ac)
sqrtsd xmm11, xmm11

;get 2a
movsd xmm10, xmm15
mulsd xmm10, xmm0 ;2a in xmm10

;addition version
movsd xmm9, xmm12 ;-b
movsd xmm8, xmm11 ;sqrt(b^2-4ac)
movsd xmm7, xmm10 ;2a
addsd xmm9, xmm8
divsd xmm9, xmm7 ;root1 in xmm9

;subtraction version
movsd xmm8, xmm12 ;-b
movsd xmm7, xmm11 ;sqrt(b^2-4ac)
movsd xmm6, xmm10 ;2a
subsd xmm8, xmm7
divsd xmm8, xmm6 ;root2 in xmm8
;----------------------------------------------------------------------
;root1=xmm9, root2=xmm8

;Make backups of roots
movsd xmm15, xmm9
movsd xmm14, xmm8

;Check roots are equal or not
ucomisd xmm8, xmm9
je print_one_root
ucomisd xmm8, xmm9
jne print_two_root

bad_a_coeff: ;Used when A = 0
	mov rax, 0
	mov rdi, wrong_equation
	call printf

	mov r8, 0 ;return 0 to caller
	cvtsi2sd xmm0, r8
	jmp conclude

error_in_input: ;Used when the input is not a float
	mov rax, 0
	mov rdi, error_message
	call printf

	add rsp, 512
	pop rax
	pop rax
	

	mov r8, 0
	cvtsi2sd xmm0, r8
	jmp conclude

print_no_root:
	call show_no_root

	mov r8, 0 ;return 0 to caller
	cvtsi2sd xmm0, r8
	jmp conclude

print_one_root:
	movsd xmm0, xmm9
	call show_one_root

	movsd xmm0, xmm15 ;return the root to caller
	jmp conclude

print_two_root:
	movsd xmm0, xmm9
	movsd xmm1, xmm8
	call show_two_root

	movsd xmm0, xmm15 ;return a root to caller
	jmp conclude

conclude:
	;----- Restore original values to integer registers ------------------------
	popf                                                        ;Restore rflags
	pop rbx                                                     ;Restore rbx
	pop r15                                                     ;Restore r15
	pop r14                                                     ;Restore r14
	pop r13                                                     ;Restore r13
	pop r12                                                     ;Restore r12
	pop r11                                                     ;Restore r11
	pop r10                                                     ;Restore r10
	pop r9                                                      ;Restore r9
	pop r8                                                      ;Restore r8
	pop rcx                                                     ;Restore rcx
	pop rdx                                                     ;Restore rdx
	pop rsi                                                     ;Restore rsi
	pop rdi                                                     ;Restore rdi
	pop rbp
	ret ;Return to caller
;----------------------------------------------------------------------------------------------------------------------------
