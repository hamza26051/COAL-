INCLUDE Irvine32.inc 


.data 
num1Low  DWORD 0FFFFFFFFh
num1High DWORD 00000000h
num2Low  DWORD 00000001h
num2High DWORD 00000000h
sumLow   DWORD ?             
sumHigh  DWORD ?


.code 
Extended_Add PROC 
push eax 
push ebx 
push edx
mov eax, num1Low 
add eax, num2Low
mov sumLow, eax
mov eax, num1High 
adc eax, num2High
mov sumHigh, eax
pop edx 
pop ebx 
pop eax 
ret 
Extended_Add ENDP 

main PROC 
call DumpRegs
call Extended_Add
mov eax, sumHigh 
mov ebx, sumLow 
call DumpRegs   

exit 
main ENDP 
END main
