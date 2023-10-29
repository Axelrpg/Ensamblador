section .data
    msg1 db  "         *", 0xA, 0xD
    len1 equ $ - msg1

    msg2 db  "        * *", 0xA, 0xD
    len2 equ $ - msg2

    msg3 db  "       * * *", 0xA, 0xD
    len3 equ $ - msg3

    msg4 db  "      * * * *", 0xA, 0xD
    len4 equ $ - msg4

    msg5 db  "     * * * * *", 0xA, 0xD
    len5 equ $ - msg5

    msg6 db  "    * * * * * *", 0xA, 0xD
    len6 equ $ - msg6

    msg7 db  "   * * * * * * *", 0xA, 0xD
    len7 equ $ - msg7

    msg8 db  "  * * * * * * * *", 0xA, 0xD
    len8 equ $ - msg8

    msg9 db  " * * * * * * * * *", 0xA, 0xD
    len9 equ $ - msg9

    msg10 db "* * * * * * * * * *", 0xA, 0xD
    len10 equ $ - msg10

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

    mov ecx, msg2
    mov edx, len2

    call print

    mov ecx, msg3
    mov edx, len3

    call print

    mov ecx, msg4
    mov edx, len4

    call print

    mov ecx, msg5
    mov edx, len5

    call print

    mov ecx, msg6
    mov edx, len6

    call print

    mov ecx, msg7
    mov edx, len7

    call print

    mov ecx, msg8
    mov edx, len8

    call print

    mov ecx, msg9
    mov edx, len9

    call print

    mov ecx, msg10
    mov edx, len10

    call print

    mov eax, 1
    mov ebx, 0
    int 0x80