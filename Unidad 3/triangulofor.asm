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

    space db " "
    spacelen equ $ - space

    asterisk db "*"
    asterisklen equ $ - asterisk

    jump db " " 0xA, 0xD
    jumplen equ $ - jump

    num db " "

section .text

    print:
        mov eax, 4
        mov ebx, 1
        int 0x80
        ret

    finish:
        mov eax, 1
        mov ebx, 0
        int 0x80

    global _start

_start:
    mov eax, 3
    mov ebx, 1
    mov ecx, num
    mov edx, 2
    int 0x80

    mov ecx, [num]

for:
    cmp ecx, 2
    jz number2

    loop for

number2:
    mov ecx, msg2
    mov edx, len2

    call finish