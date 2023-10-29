section .data
    msg1 db "Mensaje 1", 0xA, 0xD
    len1 equ $ - msg1

    msg2 db "Mensaje 2", 0xA, 0xD
    len2 equ $ - msg2

section .text

    print:
        mov eax, 4
        mov ebx, 1
        int 0x80
        ret

    global _start

_start:
    mov ecx, msg1
    mov edx, len1

    call print

    mov eax, 1
    mov ebx, 0
    int 0x80