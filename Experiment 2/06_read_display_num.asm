section .data
s1 db 'Enter the number: ', 9
s1l equ $-s1
s2 db 'The number is: ', 9
s2l equ $-s2

section .bss
num resb 40

section .text
global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, s1
	mov edx, s1l
	int 0x80
	
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 40
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, s2
	mov edx, s2l
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 40
	int 0x80
	
mov eax, 1
mov ebx, 0
int 80h