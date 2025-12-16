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
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, trash
    MOV EDX, 1
    int 0x80
%endmacro

%macro endl 0
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, nl
    MOV EDX, nllen
    int 0x80
%endmacro

%macro return 0
    MOV EAX, 1
    int 0x80
%endmacro

section .data
    asknum db 'Enter the number of elements: ';
    asknumlen equ $-asknum

    ask db 'Enter the elements'
    asklen equ $-ask

    cont db 'Array: '
    contlen equ $-cont

    srtd db 'The Sorted Array is'
    srtedlen equ $-srtd

    pass db 'Pass '
    passlen equ $-pass

    arrow db ': '
    arlen equ $-arrow

    space db ' '
    splen equ $-space

    nl db '', 10
    nllen equ $-nl

    array times 10 dw 0
    len equ 10

section .bss
    n resb 4
    arr resb 10
    i resb 4
    j resb 9
    trash resb 1

section .text
    global _start
_start:
    write asknum, asknumlen
    read n, 1
    CALL input
    
    endl

    MOV EAX, '0'
    MOV [j], EAX

    CALL bubblesort

    write nl, nllen
    write srtd, srtedlen
    endl
    CALL display

    return

input:
    write ask, asklen   ; Write the "Enter the number of elements: " message
    write nl, nllen     ; Write a new line character

    MOV [i], dword '0'  ; Initialize the value stored in the memory location referenced by 'i' to ASCII '0'

loop1:
    MOV ESI, [i]        ; Move the value stored in the memory location referenced by 'i' into 'ESI'
    CMP ESI, [n]        ; Compare the values in 'ESI' and 'n'
    JGE after1          ; Jump to 'after1' if the value in 'ESI' is greater than or equal to 'n'

    SUB ESI, '0'        ; Convert the ASCII value in 'ESI' to its corresponding numeric value
    ADD ESI, arr        ; Add the value of 'arr' to 'ESI' to calculate the memory address
    read ESI, 1         ; Read one character of input and store it in the memory location referenced by 'ESI'

    INC dword[i]        ; Increment the value stored in the memory location referenced by 'i'
    JMP loop1           ; Jump back to 'loop1' to read the next input

after1:
    ret                 ; Return from the current subroutine

display:
    write pass, passlen ; Write the "Pass: " message
    write j, 9          ; Write the value of 'j' (assumed to be a single digit) followed by a space
    write arrow, arlen  ; Write the arrow symbol
    MOV [i], dword '0'  ; Initialize the value stored in the memory location referenced by 'i' to ASCII '0'

loop2:
    MOV ESI, [i]        ; Move the value stored in the memory location referenced by 'i' into 'ESI'
    CMP ESI, [n]        ; Compare the values in 'ESI' and 'n'
    JGE after2          ; Jump to 'after2' if the value in 'ESI' is greater than or equal to 'n'

    SUB ESI, '0'        ; Convert the ASCII value in 'ESI' to its corresponding numeric value
    ADD ESI, arr        ; Add the value of 'arr' to 'ESI' to calculate the memory address
    write ESI, 1        ; Write the value at the memory location referenced by 'ESI'
    write space, splen  ; Write a space character

    INC dword[i]        ; Increment the value stored in the memory location referenced by 'i'
    JMP loop2           ; Jump back to 'loop2' to process the next element

after2:
    write nl, nllen     ; Write a new line character
    ret                 ; Return from the current subroutine

bubblesort:
    MOV al, 0           ; Initialize the counter for the outer loop to 0

    MOV bl, [n]         ; Move the value stored in the memory location referenced by 'n' into 'bl'
    SUB bl, '0'         ; Convert the ASCII value in 'bl' to its corresponding numeric value
    SUB bl, 1           ; Subtract 1 from the numeric value in 'bl' (bl is n-1)

loop3:
    CMP al, bl          ; Compare the values in 'al' and 'bl'
    JGE after3          ; Jump to 'after3' if the value in 'al' is greater than or equal to 'bl'

    pushad              ; Save all general-purpose registers on the stack
    MOV EAX, arr        ; Move the address of 'arr' into 'EAX'
    MOV EDX, [n]        ; Move the value stored in the memory location referenced by 'n' into 'EDX'
    CALL display        ; Call the 'display' subroutine to print the array
    popad               ; Restore all general-purpose registers from the stack

    MOV ECX, 0          ; Initialize the counter for the inner loop to 0

    MOV dl, bl          ; Move the value stored in 'bl' into 'dl'
    SUB dl, al          ; Subtract the value in 'al' from the value in 'dl' (dl is n-1-al)

loop4:
    CMP cl, dl          ; Compare the values in 'cl' and 'dl'
    JGE after4          ; Jump to 'after4' if the value in 'cl' is greater than or equal to 'dl'

    MOV ESI, arr        ; Move the address of 'arr' into 'ESI'
    ADD ESI, ECX        ; Add the value of 'ECX' to 'ESI' to calculate the memory address of arr[ECX]

    MOV ah, [ESI]       ; Move the byte value at the memory location referenced by 'ESI' into 'ah'
    MOV bh, [ESI + 1]   ; Move the byte value at the memory location referenced by 'ESI+1' into 'bh'
    CMP ah, bh          ; Compare the values in 'ah' and 'bh'

    jle after5          ; Jump to 'after5' if the value in 'ah' is less than or equal to the value in 'bh'

    ; Swap arr[ECX] and arr[ECX+1]
    MOV [ESI + 1], ah   ; Move the value in 'ah' to the memory location referenced by 'ESI+1'
    MOV [ESI], bh       ; Move the value in 'bh' to the memory location referenced by 'ESI'

after5:
    INC cl              ; Increment the value stored in the memory location referenced by 'cl'
    JMP loop4           ; Jump back to 'loop4' to process the next pair of elements

after4:
    INC al              ; Increment the value stored in the memory location referenced by 'al'
    INC byte[j]         ; Increment the value stored in the memory location referenced by 'j'
    JMP loop3           ; Jump back to 'loop3' for the next iteration of the outer loop

after3:
    ret                 ; Return from the current subroutine
