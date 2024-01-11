.386

.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

arr byte 20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
arraysize byte $-arr
temp dword ?
chn byte ?
.code
main proc
	
	mov ecx,19
	mov esi,0
	start_1:
		mov esi,0
		mov temp,ecx
		movzx eax,arraysize
		sub eax,1
		sub eax,esi
		mov ecx, eax
		start_2:
			mov al,[arr+esi+1]
			mov bl,[arr+esi]
			cmp al,bl
			jb low_
			jmp l
			low_:
				mov [arr+esi+1],bl
				mov [arr+esi],al
				jmp l
			l:
			inc esi
				loop start_2
			mov ecx,temp
		loop start_1
	

	INVOKE ExitProcess, 0

Main Endp
end main
