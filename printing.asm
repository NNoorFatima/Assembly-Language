.386

.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
GetStdHandle PROTO, a1:DWORD
WriteConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
ReadConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword

.data
	buffer byte 15 dup(?)
	space db 0ah
	x dword ?
	num db 0
	sum db 0
	l db ?
	handle dword ?
.code
;---------------------------------------------------------
printSpace MACRO
	invoke GetStdHandle, -11   ; Get console handle
	invoke WriteConsoleA, eax, offset space,lengthof space , offset x, 0
ENDM
;----------------------------------------------------------
main proc

	invoke GetStdHandle, -11   ; Get console handle
    mov handle, eax
	mov ecx,10
	mov ebx,0
	call printNum 
	printSpace	;;macro
	
	mov ecx,26
	mov eax,0
	call printAlpha
	printSpace	;macro
	
	mov ecx,26
	call printAlphaReverse
	printSpace		;;macro
		
	


	INVOKE ExitProcess,0
Main Endp
;---------------------------------------------------------

;----------------------------------------------------------
addEven proc uses edx 
	
	push edx
	movzx ebx,  num
	movzx edx,  sum
	L1:
	add edx,ebx
	sub ebx,2

	loop L1
	mov sum,dl
	pop edx
ret
addEven endp
;----------------------------------------------------------
printAlphaReverse proc

	mov l,90
	L1:
	push ecx
	invoke GetStdHandle, -11
	invoke WriteConsoleA, eax, offset l,lengthof l , offset x, 0
	dec l
	pop ecx
	loop L1
ret
printAlphaReverse endp
;------------------------------------------------------------
printAlpha proc
	mov l,97

	L1:
	push ecx
	invoke GetStdHandle, -11
	invoke WriteConsoleA, eax, offset l,lengthof l , offset x, 0
	inc l
	pop ecx
	loop L1

ret
printAlpha endp
;------------------------------------------------------------
printNum proc 

	mov l,0
	add l,48	
	L1:
	push ecx
	invoke GetStdHandle, -11
	invoke WriteConsoleA, eax, offset l,lengthof l , offset x, 0
	inc l
	pop ecx
	
	loop L1
ret
printNum endp
;-------------------------------------------------------------------
end main


