;Write an assembly language program to check if the number is greater than 5 or lesser than 5.
section .data
string db 'Enter a number: '
stringlen equ $ - string
greater db 'The number is greater than 5.', 10
greaterlen equ $ - greater
lesser db 'The number is lesser than 5.', 10
lesserlen equ $ - lesser

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
    CMP AL, '5' ;compare the number with 5
    JG GREATER_THAN_FIVE
    JL LESSER_THAN_FIVE

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, string
    MOV EDX, stringlen
    int 0x80
    JMP END_PROGRAM

GREATER_THAN_FIVE:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, greater
    MOV EDX, greaterlen
    int 0x80
    JMP END_PROGRAM

LESSER_THAN_FIVE:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, lesser
    MOV EDX, lesserlen
    int 0x80

END_PROGRAM:
MOV EAX, 1
MOV EBX, 0
int 0x80
