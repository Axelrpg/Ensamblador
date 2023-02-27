section .data
    mensaje db "El resultado es: %d", 10, 0
    resultado db 0

section .text
    global _start

_start:
    ;Sumamos 15 y 35 y almacenamos el resultado en la variable "resultado"
    mov eax, 15
    add eax, 35
    mov [resultado], eax

    ;Llamada al sistema "write" para imprimir el mensaje en la terminal
    mov eax, 4 ;Codigo para escribir
    mov ebx, 1 ;Escribir en terminal
    mov ecx, mensaje ;Direccion de la cadena de texto con formato
    mov edx, 25 ;Longitud del mensaje en bytes
    int 0x80 ;Interrupcion para realizar la llamada al sistema

    ;Llamada al sistema "write" para imprimir el resultado en la terminal
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2
    int 0x80

    ;Llamada al sistema "exit" para finalizar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80