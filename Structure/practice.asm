.model small

Employee struct

	
	name1 db 10 dup (?)
	age db ?

Employee ends

.data

	E1 Employee <>
	string db "Enter the Name of the Employee : ",'$'
	string1 db "Enter the Age of the Employee : ",'$'
	print1 db "The Name of the Employee is : ",'$'
	print2 db "The Age of the Employee is : ",'$'
	count dw 0
	
.code
main proc

	mov ax,@data
	mov ds,ax
	
	mov dx,offset string
	mov ah,09h
	int 21h
	
	mov si,offset E1.name1
	
	L1:
		mov ah,01h
		int 21h
		cmp al,13
		jE L2
		
			mov E1.name1[si],al
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
		
		mov ah,01h
		int 21h
		sub al,48
		mov E1.age,al
		
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset print1
		mov ah,09h
		int 21h
		
		
		
		;--------------------- printing contents ------------------
		
		mov si,offset E1.name1
		mov cx,count
		
		L3:
			
			mov al,E1.name1[si]
			mov dl,al
			mov ah,02h
			int 21h
			inc si
			
		loop L3
		
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset print2
		mov ah,09h
		int 21h
		
		mov dl,E1.age
		add dl,48
		mov ah,02h
		int 21h
		
		jmp Exit
		
		
	Exit:
		
		mov ah,4ch
		int 21h
		
main endp
end main