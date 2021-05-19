;Zachary Thompson
;zachth1723@csu.fullerton.edu

extern printf
global harmonic

section .data
progress db "k = %d    sum = %lf",10,0

section .text
harmonic:

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

mov r15, rdi ;terms

;----- Calculate Harmonic Sum -----
;calculate terms/10
mov rdx, 0
mov rax, r15
mov r8, 10
div r8
mov r10, rax ;terms/10

mov r11, 1

mov rax, 0
cvtsi2sd xmm13, rax
;r11=counter k, r10=(terms/10), xmm13=sum

loop:
mov rax, 1
cvtsi2sd xmm14, rax ;xmm14=1
cvtsi2sd xmm15, r11 ;xmm15=k

divsd xmm14, xmm15 ;1/k
addsd xmm13, xmm14 ;sum+=(1/k)

;printf changes r11 and r10
;So I will save them on the stack
push r11
push r10

;Is counter a multiple of (terms/10)?
cmp r10, 0 ;avoid division by 0
je skip
mov rdx, 0
mov rax, r11
div r10
cmp rdx, 0 ;if the remainder is 0 then dont skip the print
jne skip

;Print current progress
mov rax, 1
mov rdi, progress
mov rsi, r11
movsd xmm0, xmm13
call printf

skip:
pop r10
pop r11
inc r11
cmp r11, r15 ;is k==N?
jle loop

;---End of Loop---
;Print final result
sub r11, 1
mov rax, 1
mov rdi, progress
mov rsi, r11
movsd xmm0, xmm13
call printf
;----- End of Harmonic Sum Calculation -----

movsd xmm0, xmm13 ;Return answer

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
