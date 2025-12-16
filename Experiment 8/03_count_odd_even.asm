; FIND THE NUMBER OF ODD AND EVEN NUMBERS

%macro write 2
	MOV EAX, 4
	MOV EBX, 1
	MOV ECX, %1
	MOV EDX, %2
	int 0x80
%endmacro

%macro read 2
	MOV EAX, 3
	MOV EBX, 2
	MOV ECX, %1
	MOV EDX, %2
	int 0x80
%endmacro

section .data
	nl db "", 10
	nllen equ $-nl

	asksize db 'Enter size: '
	asksizelen equ $-asksize

	ask db 'Enter elements: '
	asklen equ $-ask

	showeven db 'Even: '
	showevenlen equ $-showeven

	showodd db 'Odd: '
	showoddlen equ $-showodd

	array times 100 db 0

section .bss
	count resb 1
	n resb 1
	element resb 1
	nodd resb 1
	neven resb 1


section .text
	global _start
_start:
	write asksize, asksizelen
	read n, 2

	write ask, asklen
	write nl, nllen

	MOV byte[count], 0
	MOV byte[nodd], 0
	MOV AL, 0
	MOV [nodd], AL

	MOV ESI, array

	input:
		read element, 2
		MOV EBX, [element]
		MOV [ESI], EBX

		INC ESI
		INC byte[count]

		MOV AL, [count]
		MOV BL, [n]
		SUB BL, '0'

		CMP AL, BL
		JL input
	
	MOV byte[count], 0
	MOV ESI, array

	check:
		MOV AL, [ESI]
		MOV BL, '2'
		SUB BL, '0'
		DIV BL

		CMP AH, 0
		JE inc_even
		JNE inc_odd
	
	inc_even:
		INC byte[neven]
		JMP cont
	
	inc_odd:
		MOV AL, [nodd]
		INC AL
		MOV [nodd], AL
		JMP cont
	
	cont:
		INC ESI
		INC byte[count]

		MOV AL, [count]
		MOV BL, [n]
		SUB BL, '0'

		CMP AL, BL
		JL check
		JE op
	
	op:
		ADD [neven], byte '0'
		MOV AL, [nodd]
		ADD AL, '0'
		MOV [nodd], AL
		MOV AL, [nodd]
		SUB AL, 0xA
		MOV [nodd], AL

		write showeven, showevenlen
		write neven, 1
		write nl, nllen
		write showodd, showoddlen
		write nodd, 1
		write nl, nllen

	MOV EAX, 1
	MOV EBX, 0
	int 0x80