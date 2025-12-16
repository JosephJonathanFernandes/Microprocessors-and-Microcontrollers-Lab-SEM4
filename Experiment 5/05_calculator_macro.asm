%MACRO write_string 2
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

%MACRO read_string 2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

%MACRO addition 3
    MOV AL, [%1]
    SUB AL, '0'
    MOV BL, [%2]
    SUB BL, '0'
    ADD AL, BL
    ADD Al, '0'
    MOV [%3], AL
%ENDMACRO

%MACRO subtraction 3
    MOV AL, [%1]
    SUB AL, '0'
    MOV BL, [%2]
    SUB BL, '0'
    SUB AL, BL
    ADD AL, '0'
    MOV [%3], AL
%ENDMACRO

%MACRO multiplication 3
    MOV AL, [%1]
    SUB AL, '0'
    MOV BL, [%2]
    SUB BL, '0'
    MUL BL
    ADD AL, '0'
    MOV [%3], AL
%ENDMACRO

%MACRO division 4
    MOV AL, [%1]
    SUB AL, '0'
    MOV BL, [%2]
    SUB BL, '0'
    DIV BL
    ADD AH, '0'
    ADD AL, '0'
    MOV [%3], AL
    MOV [%4], AH
%ENDMACRO

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
    write_string s1, s1len
    read_string num1, 4
    read_string num2, 4

    addition num1, num2, result
    write_string s2, s2len
    write_string result, 4

    subtraction num1, num2, result
    write_string s3, s3len
    write_string result, 4

    multiplication num1, num2, result
    write_string s4, s4len
    write_string result, 4

    division num1, num2, result, result2
    write_string s5, s5len
    write_string result, 4
    write_string s6, s6len
    write_string result2, 4
    write_string newline, 1

MOV EAX, 1
MOV EBX, 0
int 0x80
