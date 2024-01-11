;Author
;Program NameL
;Program Description:
;Date

INCLUDE Irvine32.inc

.data
filename db "q1file.txt",0
fileHandle HANDLE ?
num dd ?
num_2 dd ?
result dd ?
buffer BYTE 5000 DUP(?)
bytesWritten DWORD ?

output db "Enter a digit of your choice: ",0
output_o db "Enter the operation you want to perform: ",0
.code
main PROC
	
	;creation of file
	mov edx,offset filename
	call CreateOutputFile
	mov fileHandle, eax

	;take input from user and store in num_1
	mov edx, offset output
	call WriteString
	mov edx,offset buffer
	mov ecx,50
	call ReadString
	sub buffer,48
	movzx eax,buffer
	mov num,eax
	add buffer,48

	;write num_1 to file  
	mov eax,fileHandle
	mov edx,offset buffer
	mov ecx,5000
	call WriteToFile
	jc error_
	mov bytesWritten,eax

	;taking input of num_2
	mov edx, offset output
	call WriteString
	mov edx,offset buffer
	mov ecx,50
	call ReadString
	sub buffer,48
	movzx eax,buffer
	mov num_2,eax
	add buffer,48

	;writing num_2 to file
	mov eax,fileHandle
	mov edx,offset buffer
	mov ecx,5000
	call WriteToFile
	jc error_
	mov bytesWritten,eax

	;take operator input 
	mov edx, offset output_o
	call WriteString
	mov edx,offset buffer
	mov ecx,50
	call ReadString


	;operator 
	mov eax,fileHandle
	mov edx,offset buffer
	mov ecx,5000
	call WriteToFile
	mov bytesWritten,eax
	
	;performs operations 
	movzx eax,buffer
	cmp eax,'+'
	je add_
	cmp eax,'-'
	je sub_
	cmp eax,'*'
	je mul_
	cmp eax,'/'
	je div_
	;operator 
	mov eax,fileHandle
	mov edx,offset buffer
	mov ecx,5000
	call WriteToFile
	mov bytesWritten,eax


add_:
	mov eax,num
	add eax,num_2
	jmp o
mul_:
	mov eax,num
	mul num_2
	jmp o
div_:
	mov eax,num
	div num_2
	jmp o
sub_:
	mov eax,num
	sub eax,num_2
	jmp o
o:
	mov result,eax
	add eax,48
	mov buffer,al
	mov eax,fileHandle
	mov edx,offset buffer
	mov ecx,5000
	call WriteToFile
	mov bytesWritten,eax
error_:
	mov al,0
main ENDP
END main
