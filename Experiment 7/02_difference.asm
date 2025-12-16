%macro write_string 2
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, %1
    MOV EDX, %2
    int 80h
%endmacro

%macro read_string 2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, %1 
    MOV EDX, %2
    int 80h
%endmacro

section .data
    askmin db "Enter the numbers:", 10
    askminlen equ $-askmin
    show db "The difference is: "
    showlen equ $-show
    newline db 10

section .bss
    num1 resb 5
    num2 resb 5
    diff resb 5

section .text
    global _start

_start:
    write_string askmin, askminlen
    read_string num1, 5
    read_string num2, 5

    MOV ESI, 2
    MOV ECX, 3
    CLC

    sub_loop:
        MOV AL, [num1 + ESI]
        SBB AL, [num2 + ESI]
        AAS
        PUSHF
        OR AL, 30h
        POPF

        MOV [diff + ESI], AL
        DEC ESI
        LOOP sub_loop

    write_string show, showlen
    write_string diff, 5
    write_string newline, 10

    MOV EAX, 1
    MOV EBX, 0
    int 80h

