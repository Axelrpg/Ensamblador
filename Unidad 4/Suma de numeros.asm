section .data
    msg_prompt db 'Ingrese la cantidad de numeros a sumar: ', 0
    msg_input db 'Ingrese el numero: ', 0
    msg_suma db 'La suma total es: ', 0

section .bss
    cantidad resb 1
    numero resb 2
    suma resb 2

section .text
    global _start

_start:
    ; Solicitar al usuario la cantidad de numeros a sumar
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_prompt
    mov edx, 30
    int 0x80

    ; Leer la cantidad de numeros ingresada por el usuario
    mov eax, 3
    mov ebx, 0
    mov ecx, cantidad
    mov edx, 1
    int 0x80

    ; Convertir la cantidad de numeros de ASCII a entero
    add cantidad, 48

    ; Inicializar la suma en 0
    mov suma, 0

    ; Ciclo para solicitar y sumar los numeros ingresados por el usuario
    mov ebx, 0  ; Contador de numeros ingresados

input_loop:
    ; Solicitar al usuario ingresar un numero
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_input
    mov edx, 18
    int 0x80

    ; Leer el numero ingresado por el usuario
    mov eax, 3
    mov ebx, 0
    mov ecx, numero
    mov edx, 2
    int 0x80

    ; Convertir el numero de ASCII a entero
    sub byte [numero], '0'

    ; Sumar el numero a la suma total
    add byte [suma], byte [numero]

    ; Incrementar el contador de numeros ingresados
    inc ebx

    ; Verificar si se han ingresado todos los numeros
    cmp ebx, byte [cantidad]
    jne input_loop

    ; Mostrar la suma total
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_suma
    mov edx, 17
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, 2
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
