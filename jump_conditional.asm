section .data
    msg db "No es posible dividir entre cero", 10, 13
    msgLen equ $ - msg

    msg1 db "Introduce el dividendo", 10
    msg1Len equ $ - msg1

    numero db " "

section .bss
    resultado resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, msg1Len
    int 0x80

    mov eax, 3
    mov ebx, 1
    mov ecx, numero
    mov edx, 2
    int 0x80

    mov ebx, 2
    mov edx, 0
    mov eax, [numero]
    sub eax, 48

    cmp ebx, 0
    je escero

    div ebx

    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp salir

escero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

salir:
    mov eax, 1
    mov ebx, 0
    int 0x80