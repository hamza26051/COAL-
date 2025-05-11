INCLUDE Irvine32.inc 


.data  
Str1 BYTE "127&j~3#*&**#45^",0  
index DWORD ? 


.code  
main PROC  
mov edx, OFFSET Str1  
mov al, '#'  
call Scan_String_Param  
mov index, eax   
call WriteInt  
call Crlf  
exit  
main ENDP 

Scan_String_Param PROC  
mov esi, edx
mov ecx, 0

search_loop:  
mov bl, [esi]  
cmp bl, 0  
je not_found  
cmp bl, al  
je found  
inc esi  
inc ecx  
jmp search_loop 

found:  
mov eax, ecx  
ret 

not_found:  
mov eax, -1  
ret  
Scan_String_Param ENDP 
END main 
