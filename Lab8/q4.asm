INCLUDE Irvine32.inc

.data var DWORD 0 msgHello BYTE "Hello", 0 msgWorld BYTE "World", 0

.code main PROC mov var, 0

While_Loop: mov eax, var cmp eax, 10 jg EndLoop ; (var <= 10)

cmp eax, 5 
jl Print_Hello
Print_World: mov edx, OFFSET msgWorld call WriteString call Crlf jmp Increment

Print_Hello: mov edx, OFFSET msgHello call WriteString call Crlf

Increment: inc var
jmp While_Loop

EndLoop: exit main ENDP

END main
