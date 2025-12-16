section .data
string1 db 'Hello World', 10
s1len equ $-string1
string2 db 'I am programming', 10
s2len equ $-string2
sys.write equ 4
sys.call equ 1
sys.exit equ 1
sys.restart equ 0

section .text
global _start

_start:
	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, string1
	mov edx, s1len
	int 80h

	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, string2
	mov edx, s2len
	int 80h
	
mov eax, sys.exit
mov ebx, sys.restart
int 80h
