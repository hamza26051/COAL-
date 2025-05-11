INCLUDE Irvine32.inc 


.data 
str1 BYTE "COAL Lab", 0 
str2 BYTE "COAL Lab", 0 
resultMsg BYTE "Strings are equal", 0 
notEqualMsg BYTE "Strings are not equal", 0 


.code 
main PROC 
mov esi, OFFSET str1 
mov edi, OFFSET str2 
call IsCompare 
cmp eax, 1 
je equal_msg 
mov edx, OFFSET notEqualMsg 
call WriteString 
call Crlf 
jmp exit_prog 
equal_msg: 
mov edx, OFFSET resultMsg 
call WriteString 
call Crlf 
exit_prog: 
exit 
main ENDP 

IsCompare PROC 
compare_loop: 
mov al, [esi] 
mov bl, [edi] 
cmp al, bl 
jne not_equal 
cmp al, 0 
je equal 
inc esi 
inc edi 
jmp compare_loop 

equal: 
mov eax, 1 
ret 

not_equal: 
mov eax, 0 
ret 
IsCompare ENDP 
END main 
