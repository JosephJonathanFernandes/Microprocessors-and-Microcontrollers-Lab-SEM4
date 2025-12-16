;calculator
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
    ask db "Enter two numbers: ", 10
    asklen equ $-ask

    sum_ db "Sum: "
    sumlen equ $-sum_

    diff_ db "Difference: "
    difflen equ $-diff_

    prdt_ db "Product: "
    prdtlen equ $-prdt_

    quo_ db "Quotient: "
    quolen equ $-quo_

    rem_ db "Remainder: "
    remlen equ $-rem_

    newline db 10

section .bss
    num1 resb 5
    num2 resb 5
    sum resb 5
    diff resb 5
    pro resb 5
    quot resb 5
    rem resb 5

section .text
    global _start

_start:
    write_string ask, asklen
    read_string num1, 5
    read_string num2, 5

    CALL addition
    write_string sum_, sumlen
    write_string sum, 5
    write_string newline, 1

    CALL subtract
    write_string diff_, difflen
    write_string diff, 5
    write_string newline, 1

    CALL multiply
    write_string prdt_, prdtlen
    write_string pro, 5
    write_string newline, 1

    CALL divide 
    write_string quo_, quolen
    write_string quot, 5
    write_string 10, 1
    write_string newline, 1
    write_string rem_, remlen
    write_string rem, 5
    write_string newline, 1

    MOV EAX, 1
    MOV EBX, 0
    INT 0x80

addition:
    MOV AL, [num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    ADD AL, BL
    ADD AL, '0'
    MOV [sum], AL
RET

subtract:
    MOV eax, [num1]
    SUB eax, '0'
    MOV ebx, [num2]
    SUB ebx, '0'
    SUB eax, ebx
    ADD eax, '0'
    MOV [diff], eax
RET

multiply:
    MOV AL,[num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    MUL BL
    ADD AL, '0'
    MOV [pro], AL
RET

divide:
    MOV AL, [num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    DIV BL
    ADD AL, '0'
    MOV [quot], AL
    ADD AH, '0'
    MOV [rem], AH
RET