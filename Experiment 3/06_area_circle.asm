;Write an ALP to print area of circle
section .data
srad db 'Enter the radius: '
sradlen equ $-srad
sarea db 'The area is: '
sarealen equ $-sarea
pi equ 3
newline db 10

section .bss
radius resb 4
area resb 8

section .text
global _start
_start:
    ;enter the radius
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, srad
    MOV EDX, sradlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, radius
    MOV EDX, 4
    int 0x80

    ;area = pi * radius * radius
    MOV AL, 3
    MOV BL, [radius]
    SUB BL, '0'
    MUL BL
    ADD AX, '0'
    MOV [area], AX

    MOV AL, [radius]
    SUB AL, '0'
    MOV BL, [area]
    SUB BL, '0'
    MUL BL
    ADD AX, '0'
    MOV [area], AX

    ;print the area
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, sarea
    MOV EDX, sarealen
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, area
    MOV EDX, 8
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    int 0x80

MOV EAX, 1
MOV EBX, 0
int 0x80
