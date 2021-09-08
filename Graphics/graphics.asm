.model small
.data
	row db ?
	col db ?
	count db 0
.code
main proc

	mov ax,@data
	mov ds,ax
	
	;---------------------- clear the screen ----------------------
	
	mov al,03
	mov ah,00
	int 10h
	
	;--------------------- text mode -----------------------
	
	mov ah,01h
	mov al,03h
	int 10h
	
	;------------------ changing the background color to gray ----------------------
	
	mov ah,06h
	mov al,0
	mov ch,0
	mov cl,0
	mov dh,24
	mov dl,79
	mov bh,01110000b
	int 10h
	
	mov row,9
	mov col,25
	
	LeftBorder:				;----------------------- making left border of rectangle -----------
		
			;--------------- setting cursor position ---------------
		
			mov ah,02h
			mov bh,0
			mov dh,row
			mov dl,col
			int 10h
			inc row
			
			;-------------- priting ASCII character ----------------
			
			mov ah,09h
			mov al,'#'
			mov bl,01110100b
			mov bh,0
			mov cx,1
			int 10h
			inc count
			
			cmp count,7
			jBE LeftBorder
				
				mov row,9
				mov col,25
				mov count,0
				jmp UpperBorder
				
	UpperBorder:				;----------------------- making upper border of rectangle -----------
	
			;--------------- setting cursor position ---------------
	
			mov ah,02h
			mov bh,0
			mov dh,row
			mov dl,col
			int 10h
			inc col
			
			;-------------- priting ASCII character ----------------
			
			mov ah,09h
			mov al,'#'
			mov bl,01110001b
			mov bh,0
			mov cx,1
			int 10h
			inc count
			
			cmp count,28
			jBE UpperBorder

				mov row,10
				mov col,53
				mov count,0
				jmp RightBorder
				
	RightBorder:				;----------------------- making right border of rectangle -----------
		
			;--------------- setting cursor position ---------------
		
			mov ah,02h
			mov bh,0
			mov dh,row
			mov dl,col
			int 10h
			inc row
			
			;-------------- priting ASCII character ----------------
			
			mov ah,09h
			mov al,'#'
			mov bl,01110101b
			mov bh,0
			mov cx,1
			int 10h
			inc count
			
			cmp count,6
			jBE RightBorder
			
				mov row,16
				mov col,25
				mov count,0
				jmp LowerBorder
			
	LowerBorder:				;----------------------- making lower border of rectangle -----------
	
			;--------------- setting cursor position ---------------
	
			mov ah,02h
			mov bh,0
			mov dh,row
			mov dl,col
			int 10h
			inc col
			
			;-------------- priting ASCII character ----------------
			
			mov ah,09h
			mov al,'#'
			mov bl,01110110b
			mov bh,0
			mov cx,1
			int 10h
			inc count
			
			cmp count,28
			jBE LowerBorder
			
				mov row,13
				mov col,37
				jmp Print
				
	Print:
	
		;--------------- setting cursor position ---------------
	
		mov ah,02h
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		;-------------- priting letter A  ----------------
		
		mov ah,09h
		mov al,'A'
		mov bl,01111110b
		mov bh,0
		mov cx,1
		int 10h
		
		inc col
		
		;--------------- setting cursor position ---------------
		
		mov ah,02h
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		;-------------- priting letter S ----------------
		
		mov ah,09h
		mov al,'S'
		mov bl,01111110b
		mov bh,0
		mov cx,1
		int 10h
		
		inc col
		
		;--------------- setting cursor position ---------------
		
		mov ah,02h
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		;-------------- priting letter H ----------------
		
		mov ah,09h
		mov al,'H'
		mov bl,01111110b
		mov bh,0
		mov cx,1
		int 10h
		
		inc col
		
		;--------------- setting cursor position ---------------
		
		mov ah,02h
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		;-------------- priting letter E ----------------
		
		mov ah,09h
		mov al,'E'
		mov bl,01111110b
		mov bh,0
		mov cx,1
		int 10h
		
		inc col
		
		;--------------- setting cursor position ---------------
		
		mov ah,02h
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		;-------------- priting letter R ----------------
		
		mov ah,09h
		mov al,'R'
		mov bl,01111110b
		mov bh,0
		mov cx,1
		int 10h
		
		jmp Exit
		
		
	Exit:		
	
		mov ah,4ch
		int 21h
	
main endp
end main
	