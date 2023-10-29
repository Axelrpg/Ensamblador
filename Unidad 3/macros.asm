%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro exit 0
    mov eax, 1
    mov ebx, 0
    int 0x80
%endmacro

section .data
    msg1 db "Mensaje 1", 0xA, 0xD
    len1 equ $ - msg1

    msg2 db "Mensaje 2", 0xA, 0xD
    len2 equ $ - msg2

section .text
    global _start

_start:
    print msg1, len1
    exit