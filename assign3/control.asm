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
;  Assemble: nasm -f elf64 -l control.lis -o control.o control.asm
;  Link: g++ -m64 -fno-pie -no-pie -o arraysum.out control.o display.o fill.o main.o sum.o
;----- Begin code area ------------------------------------------------------------------------------------------------------
extern display
extern fill
extern printf
extern sum
global control

section .data

MAX_SIZE equ 100 ;Maximum number of elements in the array
welcome db "Welcome to HSAS.  The accuracy and reliability of this program is guaranteed by Zachary Thompson.",10,0
entered db "The numbers you entered are these:",10,0
display_sum db "The sum of these values is %.8lf.",10,0
goodbye db "The control module will now return the sum to the caller module.",10,0

section .bss

nums resq MAX_SIZE ;Array of floats
size resq 1 ;Keeps track of the # of elements in the array
sum_val resq 1 ;Sum of all elements in the array

section .text

control:

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

;Display welcome message
mov rax, 0
mov rdi, welcome
call printf

;Fill the array with values provided by the user
mov rdi, nums
mov rsi, MAX_SIZE
call fill
mov [size], rax ;Save size value returned by fill

;Calculate the sum of all the numbers in the array
mov rdi, nums
mov rsi, [size]
call sum
movsd [sum_val], xmm0 ;Save sum value returned by sum

;Display all numbers in the array to the user
mov rax, 0
mov rdi, entered
call printf
mov rdi, nums
mov rsi, [size]
call display

;Display the sum to the user
mov rax, 1
mov rdi, display_sum
movsd xmm0, [sum_val]
call printf

;Display goodbye message
mov rax, 0
mov rdi, goodbye
call printf

movsd xmm0, [sum_val] ;Return sum value to caller

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
