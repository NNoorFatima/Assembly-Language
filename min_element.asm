.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
 
    a sbyte 1,4,45,6,50,0,2
    n =($-a)
    result dword 1000

.code
main PROC
    
    ;program to find minimum element of the array 
    mov eax,offset a
    mov ecx, n
    push eax
    push result 
    push ecx
    
    call findMinRec
   
    pop ecx
    pop result 
    mov result,edx
    pop eax
 

INVOKE ExitProcess,0
main ENDP
;============================================
findMinRec proc
 
    push ebp
    mov ebp,esp
    mov ebx,0
    mov eax,[ebp+16]
   
    mov ecx,[ebp+8]    ;value of n
    cmp ecx,0
    je base
    jne recursive

recursive:
    
    dec ecx
    mov bl,[eax+ecx]
    
    mov edx,[ebp+12]  ;result
    cmp ebx,edx 
    jl bxgreater
o:
    push eax    ;aray 
    push edx    ;result
    push ecx    ;n
    
    call findMinRec
    pop ecx
    pop result
    mov result,edx
    pop eax
    jmp base
bxgreater:
    mov edx,ebx
    mov [ebp+12],edx ;update result
    jmp o
base: 
    
    pop ebp
     ret  
 
findMinRec endp

end main
