;----------------------------------------------------------------------------------------------------------------------------
;Program name: "Interview".
;This program conducts a job interview accounting for 3 types of programmers: social science majors, CS majors, and assembly programmer.
;Copyright (C) 2021 Zachary Thompson.
;
;This file is part of the software program "Interview".
;Interview is free software: you can redistribute it and/or modify it under the terms of the GNU
;General Public License version 3 as published by the Free Software Foundation.
;Interview is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
;----------------------------------------------------------------------------------------------------------------------------
;Author information
;  Author name: Zachary Thompson
;  Author email: zachth1723@csu.fullerton.edu
;
;Program information
;  Program name: Interview
;  Programming languages: One module in C Language and one module in X86.
;  Correct Platform: GNU/Linux with Bash shell.
;  Date program began: 2021-Apr-13
;  Date of last update: 2021-Apr-25
;  Files in this program: interview.asm, main.c
;  Status: Complete.
;
;Purpose
;  This program conducts a job interview accounting for 3 types of programmers: social science majors, CS majors, and assembly programmer.
;
;This file
;  File name: interview.asm
;  Language: x86 Assembly with Intel Syntax
;  Assemble: nasm -f elf64 -l interview.lis -o interview.o interview.asm
;  Link: g++ -m64 -fno-pie -no-pie -o interview.out interview.o main.o
;----- Begin code area ------------------------------------------------------------------------------------------------------
extern printf
extern scanf
global interview

section .data
welcome db "Hello %s. I am Ms Fenster. The interview will begin now.",10,0
whoareyou db "Wow! $%lf  That's a lot of cash.  Who do you think you are, Chris Sawyer (y or n)?",10,0
electricity db "Alright.  Now we will work on your electricity.",10,0
resistance1 db "Please enter the resistance of circuit #1 in ohms: ",10,0
resistance2 db "What is the resistance of circuit #2 in ohms: ",10,0
total db "The total resistance is %lf Ohms.",10,0
wereyoucs db "Were you a computer science major (y or n)?",10,0
goodbye db "Thank you.  Please follow the exit signs to the front desk.",10,0
float_format db "%lf",0
char_format db "%c",0

section .bss
name resq 1 ;name array
expected resq 1 ;expected salary

section .text

interview:

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

mov name, rdi ;name passed by main()
movsd [expected], xmm0 ;expected salary passed by main()

;Display welcome message
mov rax, 0
mov rdi, welcome
call printf

;Display message asking if they are Chris Sawyer
mov rax, 1
mov rdi, whoareyou
mov xmm0, [expected]
call printf



mov xmm0, [expected]

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
