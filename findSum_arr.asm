.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
    array word 01, 00, 10, 36, 65, 76
    sum word ?
.code
main Proc
Array_Sum:
    mov eax,0
    mov esi,offset array
    mov ecx,lengthOf array         
    call calculate_sum
    mov sum, ax 

    INVOKE ExitProcess,0
main ENDP

calculate_sum proc
    push ebx
    push ecx
    ;Base Condition
    cmp ecx, 0
    jbe L2

    ; Calculate 
    sub ecx, 1          
    mov ebx, ecx        
    movzx ebx, word ptr [esi + 2 * ebx] 
    
    call calculate_sum ; Recursive call findSum
    add eax, ebx        

L2:
    pop ecx
    pop ebx
    ret
calculate_sum endp

end main
