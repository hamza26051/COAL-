INCLUDE Irvine32.inc

.data intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0 msg BYTE "First non-zero value is: ", 0 arrSize = LENGTHOF intArr

.code main PROC mov ecx, arrSize mov esi, OFFSET intArr

FindLoop: movsx eax, WORD PTR [esi] cmp ax, 0 jne Found

add esi, 2
loop FindLoop

jmp Done
Found: mov edx, OFFSET msg call WriteString

movsx eax, WORD PTR [esi]
call WriteInt
Done: exit main ENDP

END main
