INCLUDE Irvine32.inc 


.data  
prompt BYTE "Enter a number: ",0  
not_all_prime BYTE "Not all numbers are prime.",0  
largest_msg BYTE "Largest prime: ",0  
numbers DWORD 4 DUP(0) 


.code  
CheckPrime PROC USES ebx ecx edx,  
num: DWORD  
mov eax, num  
cmp eax, 1  
jle not_prime  
cmp eax, 2  
je is_prime  
mov ecx, eax  
shr ecx, 1  
mov ebx, 2

L1:  
xor edx, edx  
div ebx  
cmp edx, 0  
je not_prime  
inc ebx  
mov eax, num  
cmp ebx, ecx  
jle L1  

is_prime:  
mov eax, 1  
ret  

not_prime:  
xor eax, eax  
ret  
CheckPrime ENDP 

LargestPrime PROC USES ebx ecx esi,  
arrPtr: PTR DWORD  
mov esi, arrPtr  
mov ecx, 4  
mov eax, [esi]  

L2:  
mov ebx, [esi]  
cmp ebx, eax  
jle not_larger  
mov eax, ebx  
not_larger:  
add esi, 4  
loop L2  

mov edx, OFFSET largest_msg  
call WriteString  
call WriteDec  
call Crlf  
ret  
LargestPrime ENDP 
main PROC  
mov esi, OFFSET numbers  
mov ecx, 4  

L3:  
mov edx, OFFSET prompt  
call WriteString  
call ReadDec  
mov [esi], eax  
add esi, 4  
loop L3  

mov esi, OFFSET numbers  
mov ecx, 4  

L4:  
push [esi]  
call CheckPrime  
cmp eax, 0  
je not_all  
add esi, 4  
loop L4  

INVOKE LargestPrime, ADDR numbers  
jmp done  

not_all:  
mov edx, OFFSET not_all_prime  
call WriteString  
call Crlf  

done:  
call WaitMsg  

exit  
main ENDP  
END main 
