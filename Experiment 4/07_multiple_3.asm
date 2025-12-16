;check if a given number is multiple of 3
section .data
string db 'Enter a number: '
stringlen equ $ - string
multiple db 'The number is a multiple of 3.', 10
multiplelen equ $ - multiple
notmultiple db 'The number is not a multiple of 3.', 10
notmultiplelen equ $ - notmultiple

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
    MOV EBX, 2 ;make it 0 for online compiler
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    MOV EAX, [num]
    MOV EBX, 3
    XOR EDX, EDX    ;clear EDX
    DIV EBX         ;EDX = EAX / EBX
    CMP EDX, 0      ;compare EDX with 0
    JZ MULTIPLE_OF_3
    JMP NOT_MULTIPLE_OF_3

MULTIPLE_OF_3:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, multiple
    MOV EDX, multiplelen
    int 0x80
    JMP END_PROGRAM

NOT_MULTIPLE_OF_3:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, notmultiple
    MOV EDX, notmultiplelen
    int 0x80

END_PROGRAM:
MOV EAX, 1
MOV EBX, 0
int 0x80
