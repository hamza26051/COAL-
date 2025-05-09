INCLUDE Irvine32.inc

.data arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20 arrSize = LENGTHOF arr foundMsg BYTE "Value found in the array.", 0 notFoundMsg BYTE "Value not found in the array.", 0 prompt BYTE "Enter a number to search: ", 0 userInput WORD ?

.code main PROC mov edx, OFFSET prompt call WriteString call ReadInt mov userInput, ax

mov ecx, arrSize          
mov esi, OFFSET arr       
mov ax, userInput
SearchLoop: cmp ax, WORD PTR [esi] je Found

add esi, 2
loop SearchLoop

mov edx, OFFSET notFoundMsg
call WriteString
jmp Done
Found: mov edx, OFFSET foundMsg call WriteString

Done: exit main ENDP

END main

