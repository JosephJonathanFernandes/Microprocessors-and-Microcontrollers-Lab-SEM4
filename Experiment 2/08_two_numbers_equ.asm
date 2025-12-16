section .data
s db 'Enter two numbers:', 10
sl equ $-s
s1 db 'Num 1: '
s1l equ $-s1
s2 db 'Num 2: '
s2l equ $-s2
sys.write equ 4
sys.call equ 1
sys.exit equ 1
sys.restart equ 0
sys.fork equ 2

section .bss
num1 resb 40
num2 resb 40

section .text
global _start
_start:
	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, s
	mov edx, sl
	int 0x80
	
	mov eax, sys.read
	mov ebx, sys.fork
	mov ecx, num1
	mov edx, 40
	int 0x80
	
	mov eax, sys.read
	mov ebx, sys.fork
	mov ecx, num2
	mov edx, 40
	int 0x80
	
	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, s1
	mov edx, s1l
	int 0x80
	
	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, num1
	mov edx, 40
	int 0x80
	
	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, s2
	mov edx, s2l
	int 0x80
	
	mov eax, sys.write
	mov ebx, sys.call
	mov ecx, num2
	mov edx, 40
	int 0x80
	
mov eax, sys.exit
mov ebx, sys.restart
int 0x80