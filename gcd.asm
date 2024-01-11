.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
 
    n1 db 128
    n2 db 96
    result dword ?

.code
main PROC
    movzx ebx,n2
    movzx eax,n1
    mov edx,result
    call GCD
    mov eax,0
   
 

INVOKE ExitProcess,0
main ENDP
;============================================
GCD proc

    cmp ebx,0
    je base
    jne recursive

recursive:
    mov cl,bl
    div cl
    movzx edx,ah
    
    mov eax,ebx
    mov ebx,edx
    call GCD

base:
    mov result,eax

     ret  
 
GCD endp

end main
