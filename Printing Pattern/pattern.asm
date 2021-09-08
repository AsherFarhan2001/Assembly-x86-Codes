.model small
.data
	var1 dw 7
	var2 dw ?
	var3 db 1
.code
main proc
	
	mov ax,@data
	mov ds,ax

	mov cx,7
	
	l1:
		mov var2,cx
		mov cx,var1
		l2:
	
			mov dl,var3
			add dl,48
			
			mov ah,02h
			int 21h

			add var3,1

		loop l2
		
		mov var3,1


		mov dl,13
		mov ah,02h
		int 21h
		
		mov dl,10
		mov ah,02h
		int 21h

		dec var1
		
		mov cx,var2
	
	loop l1
		mov ah,4ch
		int 21h

main endp
end main	