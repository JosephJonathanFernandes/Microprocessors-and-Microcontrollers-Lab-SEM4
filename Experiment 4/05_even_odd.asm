;Write an assembly language program to check whether the entered number is even or odd.
section .data
string db 'Enter a number: '
stringlen equ $ - string
even db 'The number is even.', 10
evenlen equ $ - even
odd db 'The number is odd.', 10
oddlen equ $ - odd

section .bss
    num resb 1

section .text
    global _start

_start:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, string
    MOV EDX, stringlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num
    MOV EDX, 1
    int 0x80

    MOV AL, [num]
    TEST AL, 1  ; bitwise AND with 1 to check LSB
    JZ EVEN     ; Jump if Zero Flag
    JMP ODD

EVEN:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, even
    MOV EDX, evenlen
    int 0x80
    JMP END_PROGRAM

ODD:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, odd
    MOV EDX, oddlen
    int 0x80

END_PROGRAM:

MOV EAX, 1
MOV EBX, 0
int 0x80
