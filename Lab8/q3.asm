INCLUDE Irvine32.inc

.data intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0 var DWORD 5 edx_val DWORD ? x DWORD ?

.code main PROC mov eax, var mov edx, eax add edx, 1 ; edx = var + 1 movsx ecx, WORD PTR intArr[6] ; Get the 4th element = 150

; Check if (var < ecx)
mov eax, var            
cmp eax, ecx            
jge Else_Block           ; Jump to else if var >= ecx

; Check if (ecx >= edx)
cmp ecx, edx
jl Else_Block            ; Jump to else if ecx < edx

; x = 0
mov x, 0
jmp End_If
Else_Block: mov x, 1

End_If: ; Print result mov edx, OFFSET x mov eax, [edx] call WriteInt call Crlf exit main ENDP

END main
