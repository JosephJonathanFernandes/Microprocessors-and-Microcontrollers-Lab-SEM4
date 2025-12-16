; SUM OF ELEMENTS IN AN ARRAY

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

    asksize db 'Enter number of elements: '
    asksizelen equ $-asksize

    ask db 'Enter elements'
    asklen equ $-ask

    show db 'Sum: '
    showlen equ $-show

    array times 100 db 0

section .bss
    count resb 1
    n resb 1
    element resb 1
    sum resb 1


section .text
    global _start
_start:
    write asksize, asksizelen
    read n, 2
    MOV byte [count], 0
    MOV ESI, array
    write ask, asklen
    write nl, nllen
    input:
        read element, 2
        MOV EBX, [element]
        MOV [ESI], EBX

        INC ESI
        INC byte [count]

        MOV AL, [count]
        MOV BL, [n]
        SUB BL, '0'

        CMP AL, BL
        JE exit     ; count starts from zero thats why
        JMP input
    
    exit:
    MOV ESI, array
    MOV byte [count], 0
    MOV byte [sum], 0
    
    fsum:
        MOV BL, [ESI]
        SUB BL, '0'
        ADD byte [sum], BL

        INC ESI
        INC byte[count]

        MOV AL, [count]
        MOV BL, [n]
        SUB BL, '0'
        CMP AL, BL
        JL fsum
    
    ADD byte[sum], '0'
    write show, showlen
    write sum, 1
    write nl, nllen

    ; EXIT CALL
    MOV EAX, 1
    MOV EBX, 0
    int 0x80