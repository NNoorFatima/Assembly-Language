.386
.model flat, stdcall
.stack 4096
GetStdHandle PROTO, a1:DWORD
WriteConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
ReadConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
.data
	msg byte "Enter marks: ",0
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

	sub buffer,48
	cmp buffer,5
	JB aless5
	JAE agreater5
	aless5:
		mov buffer,'D'
		jmp o
	agreater5:
		cmp buffer,7
		JB aless7
		JAE agreater7
	aless7:
		mov buffer,'C'
		jmp o
	agreater7:
		cmp buffer,9
		JB aless9
		JE aequal9
	aless9:
		mov buffer,'B'
		jmp o
	aequal9:
		mov buffer,'A'
		jmp o
	o:
		mov ecx,0

	invoke GetStdHandle, -11
	; EAX will have the handle 
	invoke WriteConsoleA, eax, offset buffer, ebx, offset x, 0

main endp
end main
