INCLUDE Irvine32.inc 


.data  
Str1 BYTE "127&j~3#*&**#45^",0  
target BYTE '#' 
index DWORD ?


.code  
main PROC  
call Scan_String ; Display result  
mov eax, index  
call WriteInt  
call Crlf

exit  
main ENDP 

Scan_String PROC  
mov esi, OFFSET Str1  
mov ecx, 0 

search_loop:  
mov al, [esi]  
cmp al, 0  
je not_found  
cmp al, target  
je found  
inc esi  
inc ecx  
jmp search_loop 

found:  
mov index, ecx  
ret 

not_found:  
mov index, -1 

ret  
Scan_String ENDP 
END main 
