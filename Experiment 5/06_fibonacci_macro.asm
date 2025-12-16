%macro write_string 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro read_string 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro fibonacci 3
	mov al, [%1]
	mov bl, [%2]
	sub al, '0'
	sub bl, '0'
	add al, bl ; a = a + b
	add al, '0'
	mov [%3], al
	int 80h
%endmacro

section .data
	nl db "", 10
	nllen equ $-nl
	ask db 'Enter the limit: '
	asklen equ $-ask
	show db 'Fibonacci series: '
	showlen equ $-show
	space db ' '
	spacelen equ $-space
	newline db 10

section .bss
	i resb 1
	n resb 4
	a resb 4
	b resb 4
	c resb 4


section .text
	global _start
_start:

	write_string ask, asklen
	read_string n, 4
	write_string show, showlen

	mov [i], byte '0'
	mov [a], byte '0'
	mov [b], byte '1'

	mov al, [i]
	mov bl, [n]
	cmp al, bl
	je exit

	write_string a, 4 ;print 0
	write_string space, spacelen
	inc byte [i]

	mov al, [i]
	mov bl, [n]
	cmp al, bl
	je exit

	write_string b, 4 ;print 1
	write_string space, spacelen
	inc byte [i]
	mov al, [i]
	mov bl, [n]
	cmp al, bl
	je exit
	jmp loop

	loop:
		fibonacci a, b, c
		write_string c, 4 ;print next number
		write_string space, spacelen
		mov bl, [b]
		mov [a], bl	;b = a
		mov bl, [c]
		mov [b], bl	;c = b
		inc byte [i];i++
		mov al, [i]
		mov bl, [n]
		cmp al, bl	;if(i == n)
		je exit
		jmp loop

exit:
	write_string newline, 1
	mov eax, 1
	mov ebx, 0
	int 80h
