section .data
    Msg1 db "Introduce un numero", 10
    Msg1Len equ $-Msg1
    Msg2 db "El numero que ingresaste es: "
    Msg2Len equ $-Msg2
    Msg3 db 10

    Numero db " "

section .bss

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, Msg1
    mov edx, Msg1Len
    int 0x80

    mov eax, 3
    mov ebx, 1
    mov ecx, Numero
    mov edx, 2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, Msg2
    mov edx, Msg2Len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, Numero
    mov edx, 2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, Msg3
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80