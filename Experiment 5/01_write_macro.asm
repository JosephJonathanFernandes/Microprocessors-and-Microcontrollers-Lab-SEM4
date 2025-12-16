%MACRO write_string 2
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

section .data
s1 db 'Enter the number: '
s1l equ $-s1
s2 db 'The number is: '
s2l equ $-s2

section .bss
num resb 4

section .text
global _start
_start:
    write_string s1, s1l

	MOV EAX, 3
	MOV EBX, 2
	MOV ECX, num
	MOV EDX, 4
	int 0x80

	write_string s2, s2l
	write_string num, 4
    write_string 10, 1

MOV EAX, 1
MOV EBX, 0
int 80h
