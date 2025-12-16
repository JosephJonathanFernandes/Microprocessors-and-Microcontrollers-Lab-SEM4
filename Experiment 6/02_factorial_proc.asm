;factorial

%MACRO read_string 2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

%MACRO write_string 2
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

section .data
    newline db "", 10
    newlinelen equ $-newline

    ask db 'Enter the number: '
    asklen equ $-ask

    show db 'The factorial is: '
    showlen equ $-show

    space db ' '
    spacelen equ $-space

section .bss
    temp resb 1
    fact resb 1
    n resb 1

section .text
    global _start

_start:
    write_string ask, asklen   
    read_string n, 1
    
    CALL factorial

    write_string show, showlen
    write_string fact, 1
    write_string newline, newlinelen

    MOV EAX, 1
    MOV EBX, 0
    int 0x80

factorial:
    MOV [temp], byte '1'
    MOV [fact], byte '1'
    CMP [n], byte '0'
    JE exit

    loop:
        MOV AL, [fact]
        MOV BL, [temp]
        SUB AL, '0'
        SUB BL, '0'
        MUL BL
        ADD AL, '0'
        MOV [fact], AL
        INC byte[temp]
        MOV AL, [temp]
        CMP AL, [n]
        JLE loop
    exit:
RET