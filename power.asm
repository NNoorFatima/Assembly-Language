.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
 
    x dw 2
    y dw 3
    z dw 1
    answer dw ?
.code
main PROC

    push x
    push y
    push z
    call power
    mov ax,z
    mov answer,ax
    pop z
    pop y
    pop x
  

INVOKE ExitProcess,0
main ENDP
;============================================
power proc
    
    push ebp
    mov ebp,esp
    
    mov eax,0
    mov ax,[ebp+8]  ;z
    mov ecx,0
    mov cx,[ebp+12]     ;values of x
    mov ebx,0
    mov bl,[ebp+10]  ;value of y is being compared
    cmp bl,0
    je base
    jne recursive
base:
    jmp o

recursive:
    dec bx
    push cx ;x
    push bx ;y
    push ax ;z
    call power
    pop z
    mov z,ax
    pop bx
    pop cx
 o:
  

   mul cx
   pop ebp
  
    ret 
power endp

end main
