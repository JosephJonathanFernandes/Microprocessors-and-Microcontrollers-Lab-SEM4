section .data
string db 'Good Morning!', 10
strlen equ $-string
strlen2 equ 15

section .text
global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, string
	mov edx, strlen
	int 80h
	
	mov [string], dword 'Hey!'
	mov eax, 4
	mov ebx, 1
	mov ecx, string
	mov edx, strlen2
	int 80h

mov eax, 1
mov ebx, 0
int 80h