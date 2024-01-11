;INCLUDE Irvine32.inc 
.386
.model flat, stdcall
.stack 4096

GetStdHandle PROTO, a1:DWORD            ; iostream / using namespace std 
WriteConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
ReadConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword

.data
		msg1 byte "Enter number 1: ", 0
		msg2 byte "Enter number 2: ", 0
		msg3 byte "Enter the character: ", 0
		msg4 byte "Result: ", 0
		msg5 byte "Quotient: ", 0
		msg6 byte "Remainder: ", 0
		num1 byte ?
		num2 byte ?
		charac byte ?
		result byte 0
		result2 word ?
		quotient byte ?
		remainder byte ?
		buffer byte 15 dup(?)
		x dword ?
		newline db 10, 0 
.code
;---------------------------------------------------------------
printResult2 MACRO
			invoke GetStdHandle, -11
			mov ebx, lengthof msg4   
			invoke WriteConsoleA, eax, offset msg4, ebx, offset x, 0
			mov x, 0
			invoke GetStdHandle, -11
			mov ebx, lengthof result2  
			invoke WriteConsoleA, eax, offset result2, ebx, offset x, 0
ENDM
;---------------------------------------------------------------
printSUB MACRO
			invoke GetStdHandle, -11
			mov ebx, lengthof msg4   
			invoke WriteConsoleA, eax, offset msg4, ebx, offset x, 0
			mov x, 0
			invoke GetStdHandle, -11
			mov ebx, lengthof result  
			invoke WriteConsoleA, eax, offset result, ebx, offset x, 0
ENDM
;---------------------------------------------------------------
printADD MACRO
			invoke GetStdHandle, -11
			mov ebx, lengthof msg4   
			invoke WriteConsoleA, eax, offset msg4, ebx, offset x, 0
			mov x, 0
			invoke GetStdHandle, -11
			mov ebx, lengthof result  
			invoke WriteConsoleA, eax, offset result, ebx, offset x, 0
ENDM
;---------------------------------------------------------------
printDIV MACRO
	
			invoke GetStdHandle, -11
			mov ebx, lengthof msg5   
			invoke WriteConsoleA, eax, offset msg5, ebx, offset x, 0
			mov x, 0
			invoke GetStdHandle, -11
			mov ebx, lengthof quotient  
			invoke WriteConsoleA, eax, offset quotient, ebx, offset x, 0
			invoke GetStdHandle, -11
			invoke WriteConsoleA, eax, offset newline, lengthof newline, offset x, 0
			invoke GetStdHandle, -11
			mov ebx, lengthof msg6   
			invoke WriteConsoleA, eax, offset msg6, ebx, offset x, 0
			mov x, 0
			invoke GetStdHandle, -11
			mov ebx, lengthof remainder  
			invoke WriteConsoleA, eax, offset remainder, ebx, offset x, 0

ENDM
;---------------------------------------------------------------
Main proc

	    ; ------------------------------------------------INPUT Num 1 -----------------------------------------------------;
		mov ax, 0
		mov bx, 0
		mov cx, 0
		mov dx, 0
      ; INPUT MUST BE BETWEEN 0 and 9 inclusive 
		invoke GetStdHandle, -11
		mov ebx, lengthof msg1   
		invoke WriteConsoleA, eax, offset msg1, ebx, offset x, 0

		invoke GetStdHandle, -10
		invoke ReadConsoleA, eax, offset buffer, lengthof buffer, offset x, 0
		mov ebx, x
		mov al, buffer
		mov num1, al

		; ------------------------------------------------ INPUT Num 2 -----------------------------------------------------;

		invoke GetStdHandle, -11
		mov ebx, lengthof msg2   
		invoke WriteConsoleA, eax, offset msg2, ebx, offset x, 0

		invoke GetStdHandle, -10
		invoke ReadConsoleA, eax, offset buffer, lengthof buffer, offset x, 0
		mov ebx, x
		mov bl, buffer
		mov num2, bl

		; ------------------------------------------------ +,-,*,/ --------------------------------------------------;

		invoke GetStdHandle, -11
		mov ebx, lengthof msg3   
		invoke WriteConsoleA, eax, offset msg3, ebx, offset x, 0

		invoke GetStdHandle, -10
		invoke ReadConsoleA, eax, offset buffer, lengthof buffer, offset x, 0
		mov ebx, x
		mov dl, buffer
		mov charac, dl

		; ---------------------------------------------- Conditions ---------------------------------------------------;

		mov al, num1
		mov bl, num2
		cmp charac, 2Bh
		je addition
		cmp charac, 2Dh
		je subtraction
		cmp charac, 2Ah
		je multiplication
		cmp charac, 2Fh
		je Division
		Addition:
			call add1
			mov result, al
			add result, 48
			printADD
			jmp exit

		Subtraction: 
			call sub1
			mov result, al
			add result, 48
			printSUB
			jmp exit

		Multiplication: 
			;convert to integers
			sub al,48
			sub bl,48
			call multiply1 ;calls multiplication 
			mov result2, ax	;stores in result2
			add result2, 48	;converts to character
			printResult2	;;macro which prints result2
			jmp exit

		Division: 
			sub al,48	;convert to integer
			sub bl,48	;convert to integer
			call divide1
			;storing remainder and quotient
			mov quotient, al
			mov remainder, ah
			add quotient, 48	;converts to to characters
			add remainder, 48	;convert to acharcater
			printDIV
			jmp exit
		exit:

main endp
;-------------------------------------------------
add1 proc 
	add al, bl
	aaa
	ret
add1 ENDP
;-------------------------------------------------
sub1 proc 
	sub al, bl
	aas
	ret
sub1 ENDP
;-------------------------------------------------
multiply1 proc  
	mul bl
	;aam
	ret
multiply1 ENDP
;-------------------------------------------------
divide1 proc 
	xor ah, ah
	;aad
	div bl
	ret
divide1 ENDP
;-------------------------------------------------

end main
