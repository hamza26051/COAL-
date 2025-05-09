INCLUDE Irvine32.inc

.data prompt BYTE "Enter a character: ", 0 isAlphaMsg BYTE "The character is an alphabet letter.", 0 notAlphaMsg BYTE "The character is NOT an alphabet letter.", 0 newline BYTE 13, 10, 0 inputChar BYTE ?

.code main PROC mov edx, OFFSET prompt call WriteString

call ReadChar
call WriteChar
call Crlf
mov inputChar, al

; Check if A-Z
cmp al, 'A'
jl NotAlpha
cmp al, 'Z'
jle IsAlpha

; Check if a-z
cmp al, 'a'
jl NotAlpha
cmp al, 'z'
jle IsAlpha
NotAlpha: mov edx, OFFSET notAlphaMsg call WriteString jmp EndProgram

IsAlpha: mov edx, OFFSET isAlphaMsg call WriteString

EndProgram: mov edx, OFFSET newline call WriteString exit main ENDP

END main
