section .bss
    resultado resb 1

section .text
    global _start

_start:
    mov ecx, 3
    mov eax, 0
    mov ebx, 1
    mov edx, 0

for:
    mov edx, ecx    ; Duplicamos el valor del ciclo
    and edx, ebx    ; Comprobamos si el AND da de resultado 1

    cmp edx, 1  ; Comparamos si el resultado es 1
    je impar    ; Si es 1, saltamos a la etiqueta impar

    loop for    ; Si no es 1, seguimos con el ciclo

impar:
    add eax, ecx    ; Sumamos el valor del ciclo a la variable acumuladora
    loop for    ; Seguimos con el ciclo

exit:
    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80