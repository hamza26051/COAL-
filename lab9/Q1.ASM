INCLUDE Irvine32.inc 

.data 
prompt1 BYTE "Enter first number: ",0 
prompt2 BYTE "Enter second number: ",0 
prompt3 BYTE "Enter third number: ",0 
result_msg BYTE "Product: ",0 

.code 
ThreeProd PROC 
push ebp 
mov ebp, esp 
mov eax, [ebp + 16] 
mul DWORD PTR [ebp + 12] 
mul DWORD PTR [ebp + 8] 
call WriteDec 
call Crlf 
pop ebp 
ret 12 
ThreeProd ENDP 
main PROC 
mov edx, OFFSET prompt1 
call WriteString 
call ReadDec 
push eax 
mov edx, OFFSET prompt2 
call WriteString 
call ReadDec 
push eax 
mov edx, OFFSET prompt3 
call WriteString 
call ReadDec 
push eax 
call ThreeProd 
call WaitMsg 

exit 
main ENDP 
END main
