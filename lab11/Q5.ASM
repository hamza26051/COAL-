INCLUDE Irvine32.inc 


.data 
array DWORD 1, 2, 3, 4, 5 
multiplier BYTE 5 
array_msg BYTE "Array after multiplication: ",0 


.code 
Load PROC USES eax ecx esi, 
arrayPtr: PTR DWORD, 
byteVal: BYTE 
mov esi, arrayPtr 
mov ecx, LENGTHOF array 

L1: 
mov eax, [esi] 
movzx ebx, byteVal 
mul ebx 
mov [esi], eax 
add esi, TYPE DWORD 
loop L1 

ret 
Load ENDP 

main PROC 
mov edx, OFFSET array_msg 
call WriteString 
INVOKE Load, ADDR array, multiplier 
mov esi, OFFSET array 
mov ecx, LENGTHOF array 

L2: 
mov eax, [esi] 
call WriteDec 
mov al, ' ' 
call WriteChar 
add esi, TYPE DWORD 
loop L2 

call Crlf 
call WaitMsg 
exit 
main ENDP 
END main
