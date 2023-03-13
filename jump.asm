section .data
    msg1 db "Etiqueta 1", 10
    msg1Len equ $-msg1
    msg2 db "Etiqueta 2", 10
    msg2Len equ $-msg2

section .bss

section .text
    global _start

_start:
    jmp etiqueta1

etiqueta1:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, msg1Len
    int 0x80

etiqueta2:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2Len
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80