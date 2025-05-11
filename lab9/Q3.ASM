INCLUDE Irvine32.inc 

.data 
prompt BYTE "Enter a number: ",0 
result_msg BYTE "Square: ",0 

.code 
LocalSquare PROC 
enter 4, 0 
mov edx, OFFSET prompt 
call WriteString 
call ReadDec 
mov [ebp - 4], eax 
mul eax 
mov edx, OFFSET result_msg 
call WriteString 
call WriteDec 
call Crlf 
leave 
ret 
LocalSquare ENDP 

main PROC 
call LocalSquare 
call WaitMsg 

exit 
main ENDP 
END main
