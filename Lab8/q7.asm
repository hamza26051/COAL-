INCLUDE Irvine32.inc

.data prompt BYTE "Enter a number (1-7): ", 0 invalidMsg BYTE "Invalid input. Please enter a number between 1 and 7.", 0 weekdays BYTE "Monday", 0, "Tuesday", 0, "Wednesday", 0, "Thursday", 0, "Friday", 0, "Saturday", 0, "Sunday", 0 userInput DWORD ? newline BYTE 13, 10, 0

.code main PROC mov edx, OFFSET prompt call WriteString call ReadInt mov userInput, eax

; Validate input
cmp eax, 1
jl Invalid
cmp eax, 7
jg Invalid

; Convert input to index (0-based)
dec eax                    
mov ebx, eax               ; EBX = index
mov esi, OFFSET weekdays
FindWeekday: cmp ebx, 0 je PrintWeekday

SkipString: cmp BYTE PTR [esi], 0 je FoundNull inc esi jmp SkipString

FoundNull: inc esi dec ebx jmp FindWeekday

PrintWeekday: mov edx, esi call WriteString mov edx, OFFSET newline call WriteString jmp ExitProgram

Invalid: mov edx, OFFSET invalidMsg call WriteString mov edx, OFFSET newline call WriteString

ExitProgram: exit main ENDP

END main
