;check if a given number is multiple of 3 (using divisibility test)
section .data
    prompt db 'Enter a number: '
    promptlen equ $ - prompt

    multiple_of_3_msg db 'The number is a multiple of 3.', 10
    multiple_of_3_msg_len equ $ - multiple_of_3_msg

    not_multiple_of_3_msg db 'The number is not a multiple of 3.', 10
    not_multiple_of_3_msg_len equ $ - not_multiple_of_3_msg

section .bss
    num resb 4

section .text
    global _start

_start:
    ; Print prompt
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, prompt
    MOV EDX, promptlen
    int 0x80

    ; Read input number
    MOV EAX, 3
    MOV EBX, 0
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    ; Convert ASCII to integer
    MOV EAX, 0          ; Initialize EAX to store the result
    MOV ECX, num        ; Load the address of the input string into ECX
    MOV EBX, 10         ; Set EBX to 10, the base for decimal conversion

convert_loop:
    XOR EDX, EDX        ; Clear EDX for division
    DIV EBX             ; Divide EAX by EBX, quotient in EAX, remainder in EDX
    ADD DL, '0'         ; Convert the remainder to ASCII character
    PUSH DX             ; Push the ASCII character onto the stack
    INC EAX             ; Increment the count of digits processed
    TEST EAX, EAX       ; Check if there are more digits to process
    JNZ convert_loop    ; Jump to convert_loop if there are more digits
    
    MOV ECX, num        ; Reset ECX to point to the beginning of the input string
    POP DX              ; Pop the ASCII character from the stack
    MOV [ECX], DL       ; Store the first digit of the converted integer

    ; Check if the number is a multiple of 3
    MOV EAX, 0          ; Initialize EAX to store the sum of digits
    MOV ECX, num        ; Load the address of the input string into ECX
    MOVZX EBX, byte [ECX]   ; Load the first byte of the input string into EBX (ASCII to integer conversion)
    ADD EAX, EBX        ; Add the integer value of the first digit to EAX
    MOVZX EBX, byte [ECX + 1]  ; Load the second byte of the input string into EBX
    ADD EAX, EBX        ; Add the integer value of the second digit to EAX
    MOVZX EBX, byte [ECX + 2]  ; Load the third byte of the input string into EBX
    ADD EAX, EBX        ; Add the integer value of the third digit to EAX
    TEST EAX, 3         ; Check if the sum is divisible by 3 (equivalent to checking if the original number is a multiple of 3)
    JZ multiple_of_3    ; Jump to multiple_of_3 if the sum is divisible by 3
    JMP not_multiple_of_3   ; Jump to not_multiple_of_3 if the sum is not divisible by 3


multiple_of_3:
    ; Print message for multiple of 3
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, multiple_of_3_msg
    MOV EDX, multiple_of_3_msg_len
    int 0x80
    JMP end_program

not_multiple_of_3:
    ; Print message for not a multiple of 3
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, not_multiple_of_3_msg
    MOV EDX, not_multiple_of_3_msg_len
    int 0x80

end_program:
    ; Exit the program
    MOV EAX, 1
    XOR EBX, EBX
    int 0x80
