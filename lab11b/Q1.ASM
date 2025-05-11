INCLUDE Irvine32.inc  

.code  
main PROC  
mov eax, 2
call DumpRegs 
mov ebx, eax        
shl eax, 4          
mov ecx, ebx        
shl ecx, 2          
add eax, ecx        
add eax, ebx        
call DumpRegs     

exit 
main ENDP  
END main
