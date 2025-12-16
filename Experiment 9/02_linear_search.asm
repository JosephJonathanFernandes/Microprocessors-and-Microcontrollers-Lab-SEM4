%macro write 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1 
    mov edx, %2 
    int 80h
%endmacro

%macro read 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1 
    mov edx, %2
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, trash
    mov edx, 1
    int 80h
%endmacro

%macro return 0
    mov eax, 1
    int 80h
%endmacro

section .data
    asknum db 'Enter the number of elements: '
    asknumlen equ $-asknum

    ask db 'Enter the elements'
    asklen equ $-ask

    cont db 'Array: '
    contlen equ $-cont

    search db 'Enter element to be searched: '
    slen equ $-search

    found_msg db 'Element found at index: '
    foundlen equ $-found_msg

    not_found_msg db 'Element not found'
    nfoundlen equ $-not_found_msg

    array times 10 dw 0
    len equ 10

    nl db '', 10
    nllen equ $-nl

    space db ''

section .bss
    n resb 4
    num resb 4
    arr resb 10
    index resb 4
    trash resb 1

section .text
    global _start
_start:
    write asknum, asknumlen
    read n, 1
    sub [n], byte '0'

    write ask, asklen
    write nl, nllen
    mov eax, arr
    mov edx, [n]
    call input

    write cont, contlen
    write nl, nllen
    mov eax, arr 
    mov edx, [n]
    call display

    write search, slen
    read num, 1

    mov eax, arr
    mov edx, [n]
    mov edi, [num]
    call linsearch

    write nl, nllen
    return

; procedures start here

input:
    mov ecx, 0

    repin: 
        cmp ecx, edx
        jge after_in

        mov esi, eax
        add esi, ecx

        pushad

        read esi, 1

        popad

        inc ecx
        jmp repin

    after_in:
        ret

display:
    mov ecx, 0

    repdis: 
        cmp ecx, edx
        jge after_dis

        mov esi, eax
        add esi, ecx

        pushad

        write esi, 1
        write nl, nllen

        popad

        inc ecx
        jmp repdis

    after_dis:
        write nl, nllen
        ret

linsearch:
    mov ecx, 0

    repsearch:
        cmp ecx, edx
        jge not_found

        mov esi, eax
        add esi, ecx

        cmp word [esi], di
        je element_found

        inc ecx
        jmp repsearch

    element_found:
        mov eax, ecx
        add eax, '0'
        mov [index], eax

        pushad

        write found_msg, foundlen
        write index, 1

        popad
        ret

    not_found:
        pushad
        write not_found_msg, nfoundlen
        write nl, nllen
        popad
        ret

