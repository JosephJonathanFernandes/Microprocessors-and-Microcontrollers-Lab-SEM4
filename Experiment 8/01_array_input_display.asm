; ENTER ELEMENTS IN AN ARRAY AND DISPLAY

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

    asksize db 'Enter the number of elements: '
    asksizelen equ $-asksize

    ask db 'Enter elements'
    asklen equ $-ask

    show db 'The elements in the array are'
    showlen equ $-show

    array times 100 db 0

section .bss
    count resb 1
    n resb 1
    element resb 1

section .text
    global _start
_start:
    write asksize, asksizelen
    read n, 2

    MOV byte[count], 0
    MOV ESI, array
    write ask, asklen
    write nl, nllen

    input:
        read element, 2
        MOV EAX, [element]
        MOV [ESI], EAX

        INC ESI
        INC byte [count]
        
        MOV AL, [count]
        MOV BL, [n]
        sub BL, '0'
        CMP AL, BL
        JL input
    
    MOV ESI, array
    MOV byte[count], 0

    write show, showlen
    write nl, nllen
    output:
        write ESI , 1
        write nl, nllen
        INC ESI
        INC byte [count]

        MOV AL, [count]
        MOV BL, [n]
        sub BL, '0'
        CMP AL, BL
        JL output

    MOV EAX, 1
    MOV EBX, 0
    int 0x80