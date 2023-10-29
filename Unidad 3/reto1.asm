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

section .bss
    num resb 1

section .data
    msg db "Hello, world!", 0xa
    len equ $ - msg

section .text
    global _start

_start:
    mov ecx, 3

for:
    mov [num], ecx
    print msg, len
    mov ecx, [num]
    loop for

    exit
