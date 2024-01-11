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
	sub buffer,32
	invoke GetStdHandle, -11
	; EAX will have the handle 
	invoke WriteConsoleA, eax, offset buffer, ebx, offset x, 0

main endp
end main
