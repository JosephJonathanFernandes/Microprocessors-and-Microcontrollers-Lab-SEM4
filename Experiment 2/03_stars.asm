section .data
stars times 9 db '*'
newline db 10, 0
starlen equ 9

section .text
global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, stars
	mov edx, starlen
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 80h

mov eax, 1
mov ebx, 0
int 80h
