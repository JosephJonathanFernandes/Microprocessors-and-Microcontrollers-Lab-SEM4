section .data
str db 'Enter two numbers: ', 10
strlen equ $-str
largest db 'The largest number is: ', 10
largestlen equ $-largest
equalmsg db 'Both numbers are equal', 0
equalmsglen equ $ - equalmsg

section .bss
num1 resb 1
num2 resb 1

section .text
global _start

_start:
    ;enter two numbers
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
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, largest
    MOV EDX, dword largestlen
    int 0x80

    ;compare num1 and num2
    MOV EAX, [num1]
    MOV EBX, [num2]
    CMP EAX, EBX
    JE EQUAL    ; num1 == num2
    JG GREATER  ; num1 > num2
    JL SMALLER  ; num1 < num2

EQUAL:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, equalmsg
    MOV EDX, equalmsglen
    int 0x80
    JMP END     

GREATER:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num1
    MOV EDX, 1
    int 0x80
    JMP END

SMALLER:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num2
    MOV EDX, 1  
    int 0x80
    JMP END

END:
MOV EAX, 1
MOV EBX, 0
int 0x80
