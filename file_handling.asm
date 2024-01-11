INCLUDE irvine32.inc

.data
	paragraph_1 BYTE "A book can be defined as a collection of stories, incidents, and facts in written or image format. A book is a medium of information. It is one of the best companions a person can have.",0
	paragraph_2 BYTE " Books encourage creativity and the imaginative power of the mind. They enrich the thought process and help in updating one's vocabulary.",0
	paragraph_3 BYTE " Books are a vessel for spreading wisdom. Without books, one cannot learn how to read and write. A person's development depends on the kind of books he reads.",0

	buffer BYTE 3000 DUP(?)
	filename BYTE "q4.txt",0
	filehandle HANDLE ?
	vowel word ?
	s dword ?
	str1 byte "Anoosha", 0
	charac byte ?
	ot BYTE "enter the character you want to replace vowels with: ",0
.code

main proc

	mov edx, offset ot
	call Writestring 
	call ReadChar 
	mov charac, al

	mov edx, offset filename
	call createOutputfile
	mov filehandle,eax


	mov ecx, lengthof paragraph_1
	mov esi,0
	mov edi,0
	l1:
		mov al,[paragraph_1+esi]
		mov [buffer+edi],al
		inc esi
		inc edi
	loop l1

	mov ecx,lengthof paragraph_2
	mov esi,0
	l2:
		mov al,[paragraph_2+esi]
		mov [buffer+edi],al
		inc esi
		inc edi
	loop l2

	
	mov ecx,lengthof paragraph_3
	mov esi,0
	l3:
		mov al,[paragraph_3+esi]
		mov [buffer+edi],al
		inc esi
		inc edi
	loop l3

	

	mov esi,0
	mov eax, lengthof paragraph_1
	add eax, lengthof paragraph_2
	mov edx, lengthof paragraph_3
	add eax,edx
	mov ecx,eax
	mov s,ecx
	buffer_loop:

		mov al,[buffer+esi]
		jmp vowel_check
		o:
		inc esi

	loop buffer_loop
	jmp no_write
vowel_check:
	cmp al,'a'
	je inccount
	cmp al,'e'
	je inccount
	cmp al,'i'
	je inccount
	cmp al,'o'
	je inccount
	cmp al,'u'
	je inccount
	cmp al,'A'
	je inccount
	cmp al,'E'
	je inccount
	cmp al,'I'
	je inccount
	cmp al,'O'
	je inccount
	cmp al,'U'
	je inccount
	jmp o

inccount:
	mov bl,charac
	mov [buffer+esi],bl
	inc vowel
	jmp o
no_write:
	mov eax, filehandle 
	mov edx, offset buffer
	mov ecx, s
	call WriteToFile


	;writing to file done above 
	;writing after all the vowels are changed to user specified character
	mov eax,filehandle
	call CloseFile

main endp

end main
