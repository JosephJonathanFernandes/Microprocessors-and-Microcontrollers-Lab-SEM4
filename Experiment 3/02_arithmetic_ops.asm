section .data
s1 db 'Enter two numbers: ', 10
s1len equ $-s1
s2 db 10, 'The sum is: '
s2len equ $-s2
s3 db 10, 'The difference is: '
s3len equ $-s3
s4 db 10, 'The product is: '
s4len equ $-s4
s5 db 10, 'The quotient is: '
s5len equ $-s5
s6 db 10, 'The remainder is: '
s6len equ $-s6
newline db 10

section .bss
num1 resb 4
num2 resb 4
result resb 8
result2 resb 4

section .text
global _start

_start:
    ;Entering two numbers
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s1
    MOV EDX, s1len
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num1
    MOV EDX, 4
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num2
    MOV EDX, 4
    int 0x80

    ;Addition
    MOV AL, [num1]; We can use atmost one mem location
    SUB AL, '0'; to convert ASCII to decimal
    MOV BL, [num2]; stores addr of num2 to EBX
    SUB BL, '0'
    ADD AL, BL; performs actual addition on the operands
    ADD Al, '0'
    MOV [result], AL; moves value in EAX to num1

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s2
    MOV EDX, s2len
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, result
    MOV EDX, 4
    int 0x80

    ;Subtraction
    MOV AL, [num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    SUB AL, BL
    ADD AL, '0'
    MOV [result], AL

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s3
    MOV EDX, s3len
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, result
    MOV EDX, 4
    int 0x80

    ;Multiplication
    MOV AL, [num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    MUL BL
    ADD AL, '0'
    MOV [result], AL

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s4
    MOV EDX, s4len
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, result
    MOV EDX, 4
    int 0x80

    ;Division
    MOV AL, [num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    DIV BL
    ADD AH, '0'
    ADD AL, '0'
    MOV [result], AL
    MOV [result2], AH

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s5
    MOV EDX, s5len
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, result
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s6
    MOV EDX, s6len
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, result2
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    int 0x80

MOV EAX, 1
MOV EBX, 0
int 0x80
