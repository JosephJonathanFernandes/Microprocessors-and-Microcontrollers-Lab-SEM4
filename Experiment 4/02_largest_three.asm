;Write an assembly language program to find the largest of three numbers.
section .data
str db 'Enter three numbers: '
strlen equ $-str
largest db 'The largest number is: '
largestlen equ $-largest

section .bss
num1 resb 1
num2 resb 1
num3 resb 1

section .text
global _start

_start:
    ;enter three numbers
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, str
    MOV EDX, strlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num1
    MOV EDX, 1
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num2
    MOV EDX, 1
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num3
    MOV EDX, 1
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, largest
    MOV EDX, largestlen
    int 0x80

    ;compare num1 and num2
    MOV AL, [num1]
    MOV BL, [num2]
    CMP AL, BL
    JG COMPARE_1_3; num1 > num2 then test num1 > num3
    JL COMPARE_2_3; num1 < num2 then test num2 < num3

COMPARE_1_3:
    MOV AL, [num1]
    MOV BL, [num3]
    CMP AL, BL
    JG PRINT_1; if num1 > num3
    JL PRINT_3; if num1 < num3

COMPARE_2_3:
    MOV AL, [num2]
    MOV BL, [num3]
    CMP AL, BL
    JG PRINT_2;if num2 > num3
    JL PRINT_3;if num2 < num3

PRINT_1:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num1
    MOV EDX, 1
    int 0x80
    JMP END

PRINT_2:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num2
    MOV EDX, 1
    int 0x80
    JMP END

PRINT_3:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num3
    MOV EDX, 1
    int 0x80
    JMP END

END:
MOV EAX, 1
MOV EBX, 0
int 0x80
