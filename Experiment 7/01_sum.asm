%macro write_string 2
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, %1
    MOV EDX, %2
    INT 0x80
%endmacro

%macro read_string 2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, %1 
    MOV EDX, %2
    INT 0x80
%endmacro

section .data
    ask db "Enter two numbers: ", 10
    asklen equ $-ask
    show db "The sum is: "
    showlen equ $-show
    newline db 10

section .bss
    num1 resb 5
    num2 resb 5
    sum resb 5

section .text
    global _start

_start:
    write_string ask, asklen
    read_string num1, 5
    read_string num2, 5

    MOV ESI, 2              
    MOV ECX, 3              
    CLC                         ; clear carry flag

    add_loop:                   
        MOV AL, [num1 + ESI]    
        ADC AL, [num2 + ESI]    
        AAA                     ; adjust after addition
        PUSHF                   
        OR AL, 30h              ; 30h is the ascii code for '0' 
        POPF                    

        MOV [sum + ESI], AL     ; stores the updated sum in the sum
        DEC ESI                 ; moves one digit left
        LOOP add_loop           ; this checks if ESI is zero
    ;MOV ESI, 1             
    ;MOV AL, [sum + ESI]
    ;sub AL, 1
    ;MOV [sum + ESI], AL

    write_string show, showlen
    write_string sum, 5
    write_string newline, 10

    MOV EAX, 1
    MOV EBX, 0
    INT 0x80