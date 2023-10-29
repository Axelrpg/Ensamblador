section .data
    resultado db "El resultado es: ", 10, 0
    num1 db 5
    num2 db 20

section .text
    global _start

_start:
    ; Realiza la resta
    mov eax, num1 ; Mueve el valor de num1 al eax
    sub eax, num2 ; Resta num2 al eax
    ; Convierte el resultado a un caracter ASCII
    add eax, 48 ; Suma 48 para convertir el valor a su representacion ASCII
    ; Imprime el resultado en la terminal
    mov edx, 17 ; Longitud de la cadena resultado
    mov ecx, resultado ; Direccion de la cadena resultado
    mov ebx, 1 ; Descriptor de archivo para terminal
    mov eax, 4 
    int 0x80

    mov eax, 1 ; Numero de sistema para la llamada exit
    xor ebx, ebx ; Codigo de salida
    int 0x80