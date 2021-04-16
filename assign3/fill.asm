;----------------------------------------------------------------------------------------------------------------------------
;Program name: "Sum of Array".
;This program takes in float numbers from the user and returns the sum of those numbers.
;Copyright (C) 2021 Zachary Thompson.
;
;This file is part of the software program "Sum of Array".
;Sum of Array is free software: you can redistribute it and/or modify it under the terms of the GNU
;General Public License version 3 as published by the Free Software Foundation.
;Sum of Array is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
;----------------------------------------------------------------------------------------------------------------------------
;Author information
;  Author name: Zachary Thompson
;  Author email: zachth1723@csu.fullerton.edu
;
;Program information
;  Program name: Sum of Array
;  Programming languages: One module in C Language, One module in C++, and Three modules in X86.
;  Correct Platform: GNU/Linux with Bash shell.
;  Date program began: 2021-Mar-06
;  Date of last update: 2021-Mar-21
;  Files in this program: control.asm, display.cpp, fill.asm, main.c, sum.asm
;  Status: Complete.
;
;Purpose
;  Compute the sum of the float numbers contained in an array.
;
;This file
;  File name: fill.asm
;  Language: X86 with Intel syntax
;  Assemble: nasm -f elf64 -l fill.lis -o fill.o fill.asm
;  Link: g++ -m64 -fno-pie -no-pie -o arraysum.out control.o display.o fill.o main.o sum.o
;----- Begin code area ------------------------------------------------------------------------------------------------------
extern printf
extern scanf
global fill

section .data
input_prompt db "Please enter floating point numbers separated by ws.",10,"When finished press enter followed by cntl+D.",10,0
float_format db "%lf",0

section .text

fill: 

;Set up new stack frame
push rbp
mov  rbp,rsp

;Prolog ----- Insurance for any caller of this assembly module -----
;Any future program calling this module that the data in the caller's GPRs will not be modified.
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

mov r15, rdi ;r15 = pointer to array
mov r14, 0 ;r14 = size/counter
mov r13, rsi ;Maximum size of array

;Display prompt asking user for inputs
push qword 0
mov rax, 0
mov rdi, input_prompt
call printf
pop rax

;----Beginning of Loop---------------------------------------------------------
loop:

;Get one float number from user
push qword 0 ;Align the stack
push qword 0
mov rax, 1
mov rdi, float_format
mov rsi, rsp
call scanf

;Place the inputted qword from the top of the stack
;into xmm15
movsd xmm15, [rsp]
pop r12 ;Reverse pushes before scanf
pop r12 ;Put value into r12 so it doesnt interfere with other registers

;Check for CTRL-D. If rax == -1, then exit loop.
cdqe ;Convert doubleword in eax register into quadword in rax register.
cmp rax, -1
je conclude

;Put inputted value into array
movsd [r15 + 8*r14], xmm15
inc r14 ;increment size/counter

;Check if the maximum array size has been reached
;Exit the loop if it has
cmp r14, r13
jl loop
;----End of Loop---------------------------------------------------------------

conclude:

mov rax, r14 ;return size to caller

;----- Restore original values to integer registers -----
popf    ;Restore rflags
pop rbx ;Restore rbx
pop r15 ;Restore r15
pop r14 ;Restore r14
pop r13 ;Restore r13
pop r12 ;Restore r12
pop r11 ;Restore r11
pop r10 ;Restore r10
pop r9  ;Restore r9
pop r8  ;Restore r8
pop rcx ;Restore rcx
pop rdx ;Restore rdx
pop rsi ;Restore rsi
pop rdi ;Restore rdi
pop rbp ;Restore rbp

ret ;Return to caller
