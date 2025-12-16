; NUMBER OF ELEMENTS GREATER THAN AND LESS THAN 5

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

	ask db 'Enter: '
	asklen equ $-ask

	showabove db 'Number of elements greater than 5: '
	showabovelen equ $-showabove

	showbelow db 'Number of elements less than 5: '
	showbelowlen equ $-showbelow

	showeq db 'Number of elements equal to 5: '
	showeqlen equ $-showeq

	array times 100 db 0

section .bss
	count resb 1
	n resb 1
	high resb 1
	low resb 1
	same resb 1
	element resb 1


section .text
	global _start
_start:
	write asksize, asksizelen
	read n, 2

	write ask, asklen

	MOV byte [count], 0
	MOV byte [high], 0
	MOV byte [low], 0
	MOV byte [same], 0

	MOV ESI, array

	input:
		read element, 2
		MOV EAX, [element]

		MOV [ESI], EAX

		INC byte[count]
		INC ESI

		MOV AL, [count]
		MOV BL, [n]
		sub BL, '0'
		CMP AL, BL
		JL input
	
	MOV ESI, array
	MOV byte [count], 0

	check:
		MOV AL, [ESI]
		MOV BL, '5'
		CMP AL, BL
		JL lessthan
		JG greaterthan
		JE equalto

	lessthan:
		INC byte[low]
		JMP cont
	
	greaterthan:
		INC byte[high]
		JMP cont
	
	equalto:
		INC byte[same]

	cont:

		INC byte[count]
		INC ESI

		MOV AL, [count]
		MOV BL, [n]
		sub BL, '0'
		CMP AL, BL
		JL check

	add byte[high], '0'
	add byte[low], '0'
	add byte[same], '0'

	write showabove, showabovelen
	write high, 1
	write nl, nllen
	write showbelow, showbelowlen
	write low, 1
	write nl, nllen
	write showeq, showeqlen
	write same, 1
	write nl, nllen

	MOV EAX, 1
	MOV EBX, 0
	int 0x80