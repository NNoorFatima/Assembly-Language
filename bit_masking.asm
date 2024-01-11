.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

	num_1 word 8575h
	ans_1 word ?
	ans_2 word ?
	ans_3 word ?
	ans_4 word ?
.code
main proc

	;task3
	mov ax,num_1
	and ax,000Fh
	mov ans_1,ax

	mov ax,num_1
	and ax,00FFh
	mov ans_2,ax

	mov ax,num_1
	and ax,0FFFh
	mov ans_3,ax

	mov ax,num_1
	and ax,0FF0Fh
	mov ans_4,ax

	

	INVOKE ExitProcess, 0

Main Endp
end main
