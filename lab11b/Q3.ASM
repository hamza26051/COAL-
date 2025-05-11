INCLUDE Irvine32.inc 


.code 
main PROC 
mov ax, 1           
mov bx, 0
call DumpRegs
shr bx, 1           
mov cx, ax          
shl cx, 15          
or bx, cx           
call DumpRegs
mov ax, 1           
mov bx, 0           
shrd bx, ax, 1
call DumpRegs

exit 
main ENDP 
END main
