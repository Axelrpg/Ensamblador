section .data
    mensaje db 'Hola mundo', 10, 13
section .text
    global _start
_start:
    ; Escribir en la terminal
    mov eax, 4       ; número de la llamada al sistema para write
    mov ebx, 1       ; descriptor de archivo para stdout
    mov ecx, mensaje ; dirección del mensaje
    mov edx, 11      ; longitud del mensaje
    int 0x80         ; realizar la llamada al sistema
    ; Salir del programa
    mov eax, 1       ; número de la llamada al sistema para exit
    xor ebx, 0     ; código de salida 0
    int 0x80         ; realizar la llamada al sistema
