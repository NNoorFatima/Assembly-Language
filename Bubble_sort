INCLUDE Irvine32.inc

.data
Array BYTE 9,6,5,4,3,2,1
arraySize byte ?
temp dword ?



.code
main PROC


      mov arraySize,lengthOf Array
      mov ecx,lengthOf Array
      mov eax,0
      mov esi,offset Array
      call BubbleSort

	 

main ENDP

BubbleSort PROC uses ecx esi eax
      
	  dec ecx
	l1:
	    mov temp, ecx
		mov ecx, lengthof Array
		dec ecx
	    mov esi,0
	    l2:
	        mov bl,[Array+esi]
	        mov dl,[Array+(esi+1)]
	        cmp bl,dl
	        JA Label1
	        JMP Label2
	        Label1:
				xchg [Array+(esi+1)],bl
				xchg [Array+esi],dl
				JMP Label2
	        Label2:
				inc esi
	    loop l2
	    mov ecx,temp
	loop l1
    ret
BubbleSort ENDP

END main
