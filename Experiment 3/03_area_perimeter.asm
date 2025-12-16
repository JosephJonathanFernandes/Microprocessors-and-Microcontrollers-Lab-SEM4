section .data
slength db 10, 'Enter the length: '
slengthlen equ $-slength
sbreadth db 'Enter the breadth: '
sbreadthlen equ $-sbreadth
speri db 'Perimeter: '
sperilen equ $-speri
sarea db 'Area: '
sarealen equ $-sarea
sthree db 10, 'Enter length of three sides: ', 10
sthreelen equ $-sthree
newline db 10

section .bss
length resb 4
breadth resb 4
side resb 4
perimeter resb 8
area resb 8

section .text
global _start
_start:
    ;rectangle section
    ;enter length and breadth
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, slength
    MOV EDX, slengthlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, length
    MOV EDX, 4
    int 0x80

    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, sbreadth
    MOV EDX, sbreadthlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, breadth
    MOV EDX, 4
    int 0x80

    ;perimeter = length + breadth
    MOV AL, [length]
    SUB AL, '0'
    MOV BL, [breadth]
    SUB BL, '0'
    ADD AL, BL
    ADD AL, '0'
    MOV [perimeter], AL

    ;perimeter = 2*perimeter
    MOV AL, 2
    MOV BL, [perimeter]
    SUB BL, '0'
    MUL BL
    ADD AL, '0'
    MOV [perimeter], AL

    ;print the perimeter
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, speri
    MOV EDX, sperilen
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, perimeter
    MOV EDX, 8
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    int 0x80

    ;area = length * breadth
    MOV AL, [length]
    SUB AL, '0'
    MOV BL, [breadth]
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

    ;triangle section
    ;enter base and height
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, slength
    MOV EDX, slengthlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, length
    MOV EDX, 4
    int 0x80

    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, sbreadth
    MOV EDX, sbreadthlen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, breadth
    MOV EDX, 4
    int 0x80

    ;area = length * breadth
    MOV AL, [length]
    SUB AL, '0'
    MOV BL, [breadth]
    SUB BL, '0'
    MUL BL
    ADD AX, '0'
    MOV [area], AX

    ;area = area / 2
    MOV AL, [area]
    MOV BL, 2
    SUB AL, '0'
    DIV BL
    ADD AL, '0'
    MOV [area], AL

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

    ;enter three sides
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, sthree
    MOV EDX, sthreelen
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, length
    MOV EDX, 8
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, breadth
    MOV EDX, 8
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, side
    MOV EDX, 8
    int 0x80

    ;perimeter = length + breadth + side
    MOV AL, [length]
    SUB AL, '0'
    MOV BL, [breadth]
    SUB BL, '0'
    ADD AL, BL
    MOV BL, [side]
    SUB BL, '0'
    ADD AL, BL
    ADD AL, '0'
    MOV [perimeter], AL

    ;print the perimeter
    MOV EBX, 1
    MOV EAX, 4
    MOV ECX, speri
    MOV EDX, sperilen
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, perimeter
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
