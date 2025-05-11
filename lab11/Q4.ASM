INCLUDE Irvine32.inc 


.data  
string_1 BYTE "Hello World",0  
original_msg BYTE "Original string: ",0  
reversed_msg BYTE "Reversed string: ",0 


.code  
Str_Reverse PROC USES eax ebx ecx esi edi,  
stringPtr: PTR BYTE  
INVOKE Str_length, stringPtr  
mov ecx, eax  
dec ecx  
jz done  
mov esi, stringPtr  
mov edi, stringPtr  
add edi, eax  
dec edi  
shr ecx, 1  

L1:  
mov al, [esi]  
mov bl, [edi]  
mov [esi], bl  
mov [edi], al  
inc esi  
dec edi  
loop L1  

done:  
ret  
Str_Reverse ENDP 

main PROC  
mov edx, OFFSET original_msg  
call WriteString  
mov edx, OFFSET string_1  
call WriteString  
call Crlf  
INVOKE Str_Reverse, ADDR string_1  
mov edx, OFFSET reversed_msg  
call WriteString  
mov edx, OFFSET string_1  
call WriteString  
call Crlf  
call WaitMsg  

exit  
main ENDP  
END main
