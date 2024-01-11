.386
.model flat, stdcall
.stack 4096
GetStdHandle PROTO, a1:DWORD
WriteConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
ReadConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
.data
	msg byte "Enter a character: ",0
	msg1 byte "A"
	buffer byte 15 dup(?)
	var dw ?
	arr dw 1,2,3,4,5,6,7,8,9,10
	x dword ?
.code
Main proc

	; We can write to console using this handle
	invoke GetStdHandle, -11

	; EAX will have the handle 
	mov ebx, lengthof msg

	invoke WriteConsoleA, eax, offset msg, ebx, offset x, 0

	; TO get standard input handle
	; We can read from console using this handle
	invoke GetStdHandle, -10

	invoke ReadConsoleA, eax, offset buffer, lengthof buffer, offset x, 0
	mov ebx, x
	mov ecx,x
	mov esi,0
	start_1:
		add [buffer+esi],1
	inc esi

	loop start_1
	invoke GetStdHandle, -11
	; EAX will have the handle 
	invoke WriteConsoleA, eax, offset buffer, ebx, offset x, 0

main endp
end main
