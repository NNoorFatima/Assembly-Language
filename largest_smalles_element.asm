.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
largest byte ?
smallest byte 100
arr byte 10,20,50,30,40,60,90,70,80,4
arraysize byte $-arr
.code
main proc
  	mov esi,0 
  	movzx ecx, arraysize
start:
		mov al, [arr+esi]
		cmp largest,al
		jb large
		jmp next

large:
	mov largest,al
	jmp next
	next: 
		mov bl,smallest
		cmp bl,al
		JA small
		jmp o
small:
	mov smallest,al
	jmp o
	o: 
		inc esi
		loop start
	INVOKE ExitProcess, 0

Main Endp
end main
