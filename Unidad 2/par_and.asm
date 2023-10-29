section .data
    msg_par db "El numero es par", 10, 0
    msg_par_len equ $ - msg_par

    msg_impar db "El numero es impar", 10, 0
    msg_impar_len equ $ - msg_impar

section .text
    global _start

_start:
    add al, 5
    add bl, 1

    and al, bl

    cmp al, 1
    je impar

par:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_par
    mov edx, msg_par_len
    int 0x80

    jmp salir

impar:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_impar
    mov edx, msg_impar_len
    int 0x80

salir:
    mov eax, 1
    mov ebx, 0
    int 0x80
