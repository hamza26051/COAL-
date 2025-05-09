INCLUDE Irvine32.inc

.data arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20 newline BYTE 13, 10, 0

.code main PROC mov ecx, 11
dec ecx ; n passes for n - 1 elements

OuterLoop: push ecx

mov esi, 0                
mov ecx, 11
dec ecx                   ; Inner loop: up to n-1-i 
InnerLoop: mov edi, esi shl edi, 1 ; edi = esi * 2 mov ax, arr[edi] ; AX = arr[esi] mov bx, arr[edi+2] ; BX = arr[esi + 1] cmp ax, bx jle NoSwap

; Swap arr[esi] and arr[esi+1]
mov arr[edi], bx
mov arr[edi+2], ax
NoSwap: inc esi loop InnerLoop

pop ecx
loop OuterLoop

; Print sorted array
mov ecx, 11
mov esi, 0
PrintLoop: mov edi, esi shl edi, 1 movzx eax, arr[edi]
call WriteDec mov edx, OFFSET newline call WriteString inc esi loop PrintLoop

exit
main ENDP END main
