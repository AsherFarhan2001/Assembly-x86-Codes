.model small
.data
	array db 10 dup('$')
	print1 db "Entering Elements of the Array.. ",'$'
	print db "The Array is : ",'$'
	number db "Enter Any Number : ",'$'
	string1 db "Found.. ",'$'
	string2 db "Not Found.. ",'$'
	var db 0
	var1 db ?
.code
main proc

	mov ax,@data
	mov ds,ax
	
	mov dx,offset print1
	mov ah,09h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h

	mov si,offset array
	mov cx,10

	L1:
		mov ah,01h
		int 21h
		sub al,48
		mov [si],al
		inc si

	loop L1

	mov dl,10
	mov ah,02h
	int 21h

	mov dx,offset print
	mov ah,09h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h

	mov si,offset array
	mov cx,10

	L2:	
		mov al,[si]
		mov dl,al
		add dl,48
		mov ah,02h
		int 21h

		mov dl,' '
		mov ah,02h
		int 21h

		inc si

	loop L2

	mov dl,10
	mov ah,02h
	int 21h

	mov dx,offset number
	mov ah,09h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h

	mov ah,01h	
	int 21h
	sub al,48
	mov bl,al

	mov si,offset array
	mov cx,10

	L3:
		mov al,[si]
		cmp bl,al
		jNE NotEqual
			mov var,1
			jmp L5

		NotEqual:
			mov var,0		
		
		inc si
	loop L3

	mov dl,10
	mov ah,02h
	int 21h

	mov dx,offset string2
	mov ah,09h
	int 21h
	jmp Exit

	L5:
		mov dl,10
		mov ah,02h
		int 21h

		mov dx,offset string1
		mov ah,09h
		int 21h

	Exit:
		mov ah,4ch	
		int 21h
		
main endp
end main
		