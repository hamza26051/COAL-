INCLUDE Irvine32.inc 


.data 
array DWORD 20 DUP(0) 
prompt BYTE "Enter 20 numbers:",0 
min_msg BYTE "Minimum: ",0 
max_msg BYTE "Maximum: ",0 


.code 
MinMaxArray PROC USES eax ebx ecx esi, 
arrPtr: PTR DWORD 
mov esi, arrPtr 
mov ecx, 20 
mov eax, [esi] 
mov ebx, eax 

L1: 
mov edx, [esi] 
cmp edx, eax 
jge not_min 
mov eax, edx 

not_min: 
cmp edx, ebx 
jle not_max 
mov ebx, edx 

not_max: 
add esi, 4 
loop L1 


mov edx, OFFSET min_msg 
call WriteString 
call WriteDec 
call Crlf 
mov edx, OFFSET max_msg 
call WriteString 
mov eax, ebx 
call WriteDec 
call Crlf 
ret 
MinMaxArray ENDP 

main PROC 
mov edx, OFFSET prompt 
call WriteString 
call Crlf 
mov esi, OFFSET array 
mov ecx, 20 
L2: 
call ReadDec 
mov [esi], eax 
add esi, 4 
loop L2 
INVOKE MinMaxArray, ADDR array 
call WaitMsg 

exit 
main ENDP 
END main 
