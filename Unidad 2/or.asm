section .data
    msg db "El resultado es: ", 0x0A, 0x0D
    msg_len equ $ - msg

section .bss
    resultado resb 1

section .text
    global _start

_start:
    mov al, 2
    mov bl, 1

    or al, bl
    
    add al, 48
    mov [resultado], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
