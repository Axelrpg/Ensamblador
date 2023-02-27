section .bss
    resultado resb 1  ; Reserva un byte de espacio para almacenar el resultado

section .text
    global _start   ; Punto de entrada del programa

_start:
    mov bx, 2     ; Almacenamos en bx el valor de 2
    mov dx, 0     ; Borramos el registro dx
    mov ax, 8     ; Almacenamos en ax el valor de 8

    div bx       ; Dividimos ax por bx, almacenamos el cociente en al y el resto en dx

    add ax, 48   ; Convertimos el valor numérico de al a su correspondiente valor en ASCII
    mov [resultado], ax  ; Almacenamos el valor ASCII de al en la variable resultado

    mov eax, 4   ; Código de llamada al sistema para sys_write
    mov ebx, 1   ; Descriptor de archivo para stdout
    mov ecx, resultado ; Dirección del buffer para imprimir
    mov edx, 1   ; Número de bytes a imprimir
    int 0x80     ; Llamada al sistema para imprimir el valor de resultado en la consola

    mov eax, 1   ; Código de llamada al sistema para sys_exit
    mov ebx, 0   ; Código de salida para el programa
    int 0x80     ; Llamada al sistema para salir del programa
