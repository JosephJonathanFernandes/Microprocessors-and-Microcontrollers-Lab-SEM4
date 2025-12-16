section .data
s db 'Enter a number: '
slen equ $-s

section .bss
num resb 4

section .text
global _start

_start:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s
    MOV EDX, slen
    int 0x80

    ;enter num
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    ;num++ four times
    MOV EAX, [num]
    INC EAX
    MOV [num], EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 0xA
    MOV EDX, 0
    int 0x80

    MOV EAX, [num]
    INC EAX
    MOV [num], EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 0xA
    MOV EDX, 0
    int 0x80

    MOV EAX, [num]
    INC EAX
    MOV [num], EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 0xA
    MOV EDX, 0
    int 0x80

    MOV EAX, [num]
    INC EAX
    MOV [num], EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 0xA
    MOV EDX, 0
    int 0x80

MOV EAX, 1
MOV EBX, 0
int 0x80
