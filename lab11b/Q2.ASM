INCLUDE Irvine32.inc 


.code 
main PROC 
mov ax, -128
call DumpRegs
shl eax, 16         
sar eax, 16
call DumpRegs

exit 
main ENDP 
END main 
