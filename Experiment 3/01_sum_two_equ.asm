section .data
s1 db 'Enter two numbers: '
s1len equ $-s1
s2 db 'The sum is: '
s2len equ $-s2
sys.write equ 4
sys.read equ 3
sys.readcall equ 2
sys.call equ 1
sys.exit equ 1
sys.restart equ 0

section .bss
num1 resb 4
num2 resb 4

section .text
global _start

_start:
    MOV EAX, sys.write
    MOV EBX, sys.call
    MOV ECX, s1
    MOV EDX, s1len
    int 0x80

    MOV EAX, sys.read
    MOV EBX, sys.readcall
    MOV ECX, num1
    MOV EDX, 4
    int 0x80

    MOV EAX, sys.read
    MOV EBX, sys.call
    MOV ECX, num2
    MOV EDX, 4
    int 0x80

    MOV AL, [num1]; We can use atmost one mem location
    SUB AL, '0'; to convert ASCII to decimal
    MOV BL, [num2]; stores addr of num2 to EBX
    SUB BL, '0'
    ADD AL, BL; performs actual addition on the operands
    ADD AL, '0'
    MOV [num1], AL; moves value in EAX to num1

    MOV EAX, sys.write
    MOV EBX, sys.call
    MOV ECX, s2
    MOV EDX, s2len
    int 0x80

    MOV EAX, sys.write
    MOV EBX, sys.call
    MOV ECX, num1
    MOV EDX, 4
    int 0x80

MOV EAX, sys.exit
MOV EBX, sys.restart
int 0x80
