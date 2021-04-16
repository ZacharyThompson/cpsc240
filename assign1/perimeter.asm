;----------------------------------------------------------------------------------------------------------------------------
;Program name: "Rectangle".
;This program takes the sides of a rectangle and returns the perimeter and average side length of the rectangle.                                                                                                          
;Copyright (C) 2021 Zachary Thompson.                                                                         
;                                                                                                                           
;This file is part of the software program "Rectangle".                                                                     
;Rectangle is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License     
;version 3 as published by the Free Software Foundation.                                                                    
;Rectangle is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
;----------------------------------------------------------------------------------------------------------------------------
;Author information ;
;  Author name: Zachary Thompson
;  Author email: zachth1723@csu.fullerton.edu
;
;Program information
;  Program name: Rectangle
;  Programming languages: One module in C++ and one module in X86
;  Date program began: 2021-Jan-27
;  Date of last update: 2021-Feb-12
;  Files in this program: rectangle.cpp, perimeter.asm
;  Status: Complete.
;
;This file
;   File name: perimeter.asm
;   Language: X86 with Intel syntax.
;   Assemble: nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

;----- Begin code area ------------------------------------------------------------------------------------------------
extern printf
extern scanf
global perimeter

segment .data
welcome db "This program will compute the perimeter and the average side length of a rectangle.",10,0
input_h db "Enter the height: ",0
input_l db "Enter the length: ",0
output_perimeter db "The perimeter is %lf",10,0
output_avglength db "The length of the average side is %lf",10,0
good_bye db "I hope you enjoyed your rectangle",10,"The assembly program will send the perimeter to the main function.",10,0
float_format db "%lf",0

segment .text 

perimeter:

;Prolog ----- Insurance for any caller of this assembly module --------------------------------------------------------
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

;Display Welcome Message
mov rax, 0
mov rdi, welcome
call printf

;Display prompt for inputting the height
push qword 0
mov rax, 0
mov rdi, input_h
call printf
pop rax

;Scanf block for inputting the height
mov rax, 1
mov rdi, float_format
push qword 0 ;Align the stack
push qword 0
mov rsi, rsp
call scanf
movsd xmm15, [rsp]
pop rax
pop rax

;Display prompt for inputting the length
push qword 0
mov rax, 0
mov rdi, input_l
call printf
pop rax

;Scanf block for inputting the length
mov rax, 1
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
movsd xmm14, [rsp]
pop rax
pop rax

;Get value of 2 into xmm register
mov r8, 2
cvtsi2sd xmm12, r8

;Block for calculating the perimeter
movsd xmm13, xmm15
addsd xmm13, xmm14
mulsd xmm13, xmm12

;Block for calculating the average length
movsd xmm11, xmm15
addsd xmm11, xmm14
divsd xmm11, xmm12

;Display Perimeter Message
push qword 0
push qword 0
mov rax, 1
mov rdi, output_perimeter
movsd xmm0, xmm13
call printf
pop rax
pop rax

;Display Average Length Message
push qword 0
push qword 0
mov rax, 1
mov rdi, output_avglength
movsd xmm0, xmm11
call printf
pop rax
pop rax

;Display Goodbye Message
push qword 0
mov rax, 0
mov rdi, good_bye
call printf
pop rax

movsd xmm0, xmm13 ;Return perimeter to caller

;----- Restore original values to integer registers -------------------------------------------------------------------
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
pop rbp                                                     ;Restore rbp

ret

;--------------------------------------------------------------------------------------------------------------------
