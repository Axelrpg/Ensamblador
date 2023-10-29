;Pedir al usuario dos numeros enteros positivos, ademas de un simbolo que represente la operacion y que te devuelva el resultado, en ensamblador (asm)
section .data
    msg1 db "Introduce el primer digito", 10
    msg1Len equ $ - msg1

    msg2 db "Introduce el segundo digito", 10
    msg2Len equ $ - msg2

    msg3 db "Introduce el simbolo de la operacion", 10
    msg3Len equ $ - msg3

    msg4 db "El resultado es: "
    msg4Len equ $ - msg4

    salto db 10

    num1 db " "
    num2 db " "
    op db " "

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
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2Len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, msg3Len
    int 0x80

    mov eax, 3
    mov ebx, 1
    mov ecx, op
    mov edx, 2
    int 0x80

    mov al, byte[op]

    cmp al, '+'
    je suma

    cmp al, '-'
    je resta

    cmp al, '*'
    je multiplicacion

    cmp al, '/'
    je division

suma:
    mov eax, [num1]
    mov ebx, [num2]
    add eax, ebx
    sub eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, msg4Len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp salir

resta:
    mov eax, [num1]
    mov ebx, [num2]
    sub eax, ebx
    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, msg4Len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp salir

multiplicacion:
    mov eax, [num1]
    mov ebx, [num2]
    sub eax, 48
    sub ebx, 48
    mul ebx
    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, msg4Len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp salir

division:
    mov ax, [num1]
    mov cx, [num2]
    mov dx, 0

    sub ax, 48
    sub cx, 48
    
    div cx
    
    add ax, 48
    mov [resultado], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, msg4Len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp salir

salir:
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80