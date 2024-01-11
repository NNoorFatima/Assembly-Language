.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	num word 12
	prime_c byte 1		;if prime answer =1 else 0
.code
main proc
	mov esi,2
	start:
		cmp esi,11
		ja out_
		jb work
			work:
				mov ax,num
				mov ebx,esi
				div bl
				cmp ah,0
				je n_prime
				inc esi
				jmp start
			n_prime:
				mov prime_c,0
			out_:	


	INVOKE ExitProcess, 0

Main Endp
end main
