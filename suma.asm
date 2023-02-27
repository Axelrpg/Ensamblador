; Definir la sección de datos
section .data
    resultado db 0 ; Define la variable resultado como un byte inicializado en 0

; Definir la sección de código
section .text
    global _start ; Indica el punto de inicio del programa

_start:
; Realizar la suma
    mov eax, 2 ; Mueve el valor 2 al registro eax
    mov ebx, 3 ; Mueve el valor 3 al registro ebx
    add eax, ebx ; Suma el valor de ebx al registro eax
    add eax, 48 ; Suma 48 al registro eax para que imprima el caracter correcto (se convierte de decimal a ASCII)
    mov [resultado], eax ; Mueve el valor de eax a la variable resultado

    ; Imprimir el resultado
    mov eax, 4 ; Mueve el valor 4 al registro eax para realizar la llamada al sistema para imprimir
    mov ebx, 1 ; Mueve el valor 1 al registro ebx para indicar que se imprime en la salida estándar
    mov ecx, resultado ; Mueve la dirección de la variable resultado al registro ecx para imprimir su contenido
    mov edx, 1 ; Mueve el valor 1 al registro edx para indicar que se imprime un byte
    int 0x80 ; Realiza la llamada al sistema

    ; Salir del programa
    mov eax, 1 ; Mueve el valor 1 al registro eax para realizar la llamada al sistema para salir
    xor ebx, ebx ; Pone el valor 0 en el registro ebx para indicar una salida exitosa
    int 0x80 ; Realiza la llamada al sistema
