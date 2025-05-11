INCLUDE Irvine32.inc 


.data 
array DWORD 10, 5, 8, 1, 3 
sorted_msg BYTE "Sorted array: ",0 


.code 
BubbleSort PROC 
push ebp 
mov ebp, esp 
mov esi, [ebp + 8] 
mov ecx, 4 

outer_loop: 
push ecx 
mov edi, esi 
mov edx, ecx 
inner_loop: 
mov eax, [edi] 
cmp eax, [edi + 4] 
jle no_swap 
xchg eax, [edi + 4] 
mov [edi], eax 

no_swap: 
add edi, 4 
dec edx 
jnz inner_loop 
pop ecx 
loop outer_loop 
pop ebp 
ret 4 
BubbleSort ENDP 

main PROC 
mov edx, OFFSET sorted_msg 
call WriteString 
push OFFSET array 
call BubbleSort 
mov esi, OFFSET array 
mov ecx, 5 

L1: 
mov eax, [esi] 
call WriteDec 
mov al, ' ' 
call WriteChar 
add esi, 4 
loop L1 

call Crlf 
call WaitMsg 

exit 
main ENDP 
END main
