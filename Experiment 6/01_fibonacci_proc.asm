;fibonacci series

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
    newline db 10

    ask db 'Enter the value of n: '
    asklen equ $-ask 

    show db 'Fibonacci sequence: '
    showlen equ $-show

    space db ' '
    spacelen equ $-space

section .bss
    i resb 1
    n resb 1
    a resb 1
    b resb 1
    c resb 1


section .text
    global _start

_start:
    write_string ask, asklen
    read_string n, 1
    write_string show, showlen

    CALL fib
    write_string newline, 10

    MOV EAX, 1
    MOV EBX, 0
    int 0x80

formula:
    MOV AL, [a]
    MOV BL, [b]
    sub AL, '0'
    sub BL, '0'
    add AL, BL
    add AL, '0'
    MOV [c], AL
RET

fib:
    MOV [i], byte '0'
    MOV [a], byte '0'
    MOV [b], byte '1'

    MOV AL, [n]
    CMP AL, '0'
    JE exit

    write_string a, 1
    write_string space, spacelen
    INC byte[i]

    MOV AL, [i]
    CMP AL, byte[n]
    JE exit

    write_string b, 1
    write_string space, spacelen

    INC byte[i]
    MOV AL, [i]
    CMP AL, byte[n]
    JE exit

    loop:
        CALL formula
        write_string c, 1
        write_string space, spacelen

        MOV AL, [b]
        MOV [a], AL
        MOV AL, [c]
        MOV [b], AL

        INC byte[i]
        MOV AL, [i]
        CMP AL, byte[n]
        JE exit
        JMP loop
    exit:
RET