section .data
    resultado db 0    ; variable para almacenar el resultado

section .text
    global _start

_start:
    ; realiza la resta de b a a
    mov eax, 8     ; mueve 8 a eax
    mov ebx, 5      ; mueve 5 a ebx
    sub eax, ebx    ; resta ebx de eax
    add eax, 48     ; suma 48 a eax para convertirlo a ASCII
    mov [resultado], eax ; almacena el resultado en la variable 'resultado'

    ; imprimir el resultado
    mov eax, 4      ; mueve 4 a eax, que representa sys_write
    mov ebx, 1      ; mueve 1 a ebx, que representa stdout
    mov ecx, resultado ; mueve la dirección de la variable 'resultado' a ecx
    mov edx, 1      ; mueve 1 a edx, que es la longitud de la cadena a imprimir
    int 0x80        ; llama a la interrupción del sistema para imprimir el resultado

    ; salir del programa
    mov eax, 1      ; mueve 1 a eax, que representa sys_exit
    xor ebx, ebx    ; pone el código de salida en 0
    int 0x80        ; llama a la interrupción del sistema para salir del programa
