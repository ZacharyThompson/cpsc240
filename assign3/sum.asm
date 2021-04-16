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
;  File name: control.asm
;  Language: X86 with Intel syntax
;  Assemble: nasm -f elf64 -l sum.lis -o sum.o sum.asm
;  Link: g++ -m64 -fno-pie -no-pie -o arraysum.out control.o display.o fill.o main.o sum.o
;----- Begin code area ------------------------------------------------------------------------------------------------------
global sum

section .text

sum:

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
mov r14, rsi ;r14 = size/counter

;Set sum's value (xmm15) to 0 initially
mov rax, 0
cvtsi2sd xmm15, rax 

;----Beginning of Loop----------------------------------------------------------
loop:
addsd xmm15, [r15 + 8*r14]

dec r14 ;Decrease counter by 1

;If counter >= 0, then loop again.
cmp r14, 0
jge loop ;repeat loop
;----End of Loop----------------------------------------------------------------

movsd xmm0, xmm15 ;return sum to caller

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

ret ;return to caller
