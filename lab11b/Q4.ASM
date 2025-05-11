INCLUDE Irvine32.inc 


.data 
val1 DWORD 100
val2 DWORD 20 
val3 DWORD 5 


.code 
main PROC 
call DumpRegs
mov eax, val2
cdq                 
idiv val3
mov ebx, eax 
mov eax, val1
cdq                 
idiv val2
imul eax, ebx
mov val1, eax 
call DumpRegs

exit 
main ENDP 
END main
