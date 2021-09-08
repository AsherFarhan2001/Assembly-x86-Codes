.model small
.stack 100h
.data
	string1 db "Enter Elements of Array : ",'$'
	string2 db "The Array is : ",'$'
	string3 db "The Sum is : ",'$'
	array db 5 dup(?)
	sum dw ?
	
.code
main proc

	mov ax,@data
	mov ds,ax
	
	mov dx,offset string1
	mov ah,09h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov si,offset array
	mov cx,5
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
	
	mov dx,offset string2
	mov ah,09h
	int 21h
	
	mov si,offset array
	mov cx,5
	L2:
		mov al,[si]
		mov dl,al
		add dl,48
		mov ah,02h
		int 21h
		inc si
		
	loop L2
	
	mov si,offset array
	mov cx,5
	
	push si
	push cx					; passing by stack
	
	call ArraySum		; PC or IP goes stores proc address and pushes return address to stack
	
	mov dl,10				; return address
	mov ah,02h
	int 21h
	
	mov dx,offset string3
	mov ah,09h
	int 21h
	
	mov sum,bx
	mov dx,sum
	add dx,48
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
	
	
	ArraySum Proc
		
		push bp
		mov bp,sp
		
		push si						; storing si in stack
		push cx						; storing cx in stack
	
		mov bx,0
		mov cx,[bp+4]
		mov si,[bp+6]
	
		
		L3:
			add bx,[si]
			inc si
			
		loop L3
		
		pop cx
		pop si
		pop bp
		
		ret	4					; pop the return address of main proc
								; clearing the stack by 4 bytes
	
	ArraySum endp
	
	
main endp
end main