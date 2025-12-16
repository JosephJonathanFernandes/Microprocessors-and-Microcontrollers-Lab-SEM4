;Write an assembly language program that compares two strings and checks if they are same string.
section .data
string1 db 'Enter the first string: '
string1len equ $ - string1
string2 db 'Enter the second string: '
string2len equ $ - string2
equal_msg db 'The strings are equal.', 10
equal_msg_len equ $ - equal_msg
not_equal_msg db 'The strings are not equal.', 10
not_equal_msg_len equ $ - not_equal_msg

section .bss
    str1 resb 128
    str2 resb 128

section .text
    global _start

_start:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, string1
    MOV EDX, string1len
    int 0x80

    MOV EAX, 3
    MOV EBX, 2  ;make it 0 if not working
    MOV ECX, str1
    MOV EDX, 128
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, string2
    MOV EDX, string2len
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, str2
    MOV EDX, 128
    int 0x80

    MOV ESI, str1   ; Pointer to str1
    MOV EDI, str2   ; Pointer to the str2

COMPARE_LOOP:
    MOV AL, [ESI]   ; Load character from str1
    MOV BL, [EDI]   ; Load character from str2
    CMP AL, BL      ; Compare characters
    JNE NOT_EQUAL   ; Jump if characters are not equal
    CMP AL, 0       ; Check for end of string
    JE EQUAL        ; Jump if end of string reached
    INC ESI         ; Move to the next character in str1
    INC EDI         ; Move to the next character in str2
    JMP COMPARE_LOOP; Repeat the comparison loop

EQUAL:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, equal_msg
    MOV EDX, equal_msg_len
    int 0x80
    JMP END_PROGRAM

NOT_EQUAL:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, not_equal_msg
    MOV EDX, not_equal_msg_len
    int 0x80

END_PROGRAM:
MOV EAX, 1
MOV EBX, 0
int 0x80
