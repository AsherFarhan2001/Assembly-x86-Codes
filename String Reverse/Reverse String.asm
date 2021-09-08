.model small
.stack 100h
.data
	array db 40 dup(?)
	string0 db "Enter the String : ",'$'
	string1 db "The String is : ",'$'
	string2 db "The Reversed String is : ",'$'
	count dw 0
.code
main proc

	mov ax,@data
	mov ds,ax
	
	mov dx,offset string0
	mov ah,09h
	int 21h
	
	mov si,offset array
	
	L1:
		mov ah,01h
		int 21h
		cmp  al,13
		jE L2
			
			mov [si],al
			inc si
			inc count
			jmp L1
			
	L2:
		
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset string1
		mov ah,09h
		int 21h
		
		mov cx,count
		mov si,offset array
		
		print:
			
			mov al,[si]
			mov dl,al
			mov ah,02h
			int 21h
			inc si
			push ax
			
		loop print
		
		jmp L4
		
	L4:
	
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset string2
		mov ah,09h
		int 21h
		
		mov cx,count
		
		Display:
		
			pop ax
			mov dx,ax
			mov ah,02h
			int 21h
			
		loop Display
		
		jmp Exit
	
	
	Exit:
		mov ah,4ch
		int 21h
		
main endp
end main
			
			
			
			