INCLUDE Irvine32.inc

.data msgEqual BYTE "All four numbers are equal.", 0 msgNotEqual BYTE "All four numbers are not equal.", 0 numbers DWORD 4 DUP(?)

.code main PROC mov ecx, 4 mov esi, OFFSET numbers

ReadLoop: call readInt mov [esi], eax add esi, 4 loop ReadLoop

; Compare all 4 numbers
mov esi, OFFSET numbers
mov eax, [esi]
cmp eax, [esi+4]
jne NotEqual
cmp eax, [esi+8]
jne NotEqual
cmp eax, [esi+12]
jne NotEqual

mov edx, OFFSET msgEqual
call WriteString
jmp Done
NotEqual: mov edx, OFFSET msgNotEqual call WriteString

Done: exit main ENDP

END main
