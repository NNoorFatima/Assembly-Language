INCLUDE irvine32.inc

.data
	player BYTE "#",0
	xpos BYTE 5
	ypos BYTE 5
	inputch BYTE ?
	str1 byte "Noor", 0
	space_ BYTE 32
.code
		
main proc

mov eax, red
call settextcolor

call drawplayer
gameloop:
	
	;the ascii of arrow keys is not specified therefor using a w s d
	call ReadChar 
	mov inputch,al

	cmp inputch,'x'
	je game_over
	cmp inputch, 'a';
	je movleft
	cmp inputch,'w';
	je movup
	cmp inputch, 's';
	je movdown
	cmp inputch,'d';
	je movright

	movleft:
		mov eax, yellow 
		call settextcolor
		call updateplayer 
		dec xpos
		call drawplayer 
		jmp gameloop 
	movright:
		call updateplayer 
		inc xpos 
		mov eax, red
		call settextcolor
		call drawplayer
		jmp gameloop 
	movup:
		mov eax, blue 
		call settextcolor
		call updateplayer
		dec ypos 
		call drawplayer
		jmp gameloop

	movdown:
		mov eax, white
		call settextcolor
		call updateplayer
		inc ypos 
		call drawplayer
		jmp gameloop






	game_over:



















main endp

updateplayer PROC
	mov dl,xpos
	mov dh,ypos
	call gotoxy

	mov edx, offset space_
	call WriteString 
	
ret
updatePlayer ENDP
	

drawplayer PROC

	
	mov dl, xpos
	mov dh,ypos
	call gotoxy
	mov edx, offset player 
	call WriteString 
	;jmp gameloop
ret 
drawplayer ENDP

end main
