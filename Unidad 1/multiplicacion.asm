; Declaración de la sección .bss, que se utiliza para definir variables sin inicializar
section .bss
    resultado resb 1 ; Reservar 1 byte para la variable resultado

; Declaración de la sección .text, que es donde se escribe el código del programa
section .text
    global _start ; Indica el punto de inicio del programa

_start:
    ; Cálculo de la multiplicación de 3 y 2
    mov ax, 3 ; Almacenar el valor 3 en el registro ax
    mov cx, 3 ; Almacenar el valor 2 en el registro cx
    mul cx ; Realizar la multiplicación entre ax y cx, el resultado se guarda en ax
    ; Convertir el resultado de decimal a ASCII
    add ax, 48 ; Sumar 48 al valor de ax para convertir el resultado a su valor ASCII equivalente
    mov [resultado], ax ; Guardar el valor en la variable resultado

    ; Imprimir el resultado en la terminal
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, resultado ; dirección del resultado
    mov edx, 3      ; longitud de la cadena
    int 0x80

    ; Salir del programa
    mov eax, 1      ; sys_exit
    mov ebx, 0      ; código de salida 0
    int 0x80        ; realizar la llamada al sistema para salir del programa
