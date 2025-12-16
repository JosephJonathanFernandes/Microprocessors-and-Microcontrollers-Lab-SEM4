%MACRO read_string 2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

%MACRO write_string 2
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

section .data
s db 'Enter a number: '
sl equ $-s
s1 db 'Number is: '
s1l equ $-s1

section .bss
num1 resb 4

section .text
global _start
_start:
    write_string s, s1

	read_string num1, 4

    write_string s1, s1l

    write_string num1, 4

    write_string 10, 1

MOV EAX, 1
MOV EBX, 0
int 0x80
