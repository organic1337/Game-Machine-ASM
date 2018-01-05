IDEAL
MODEL small
STACK 100h

DATASEG
;---variables for delay procedure--->
	Clock equ es:6Ch
;----------------------------------->

;------Keys Variables------>
Left_Key equ 75
Up_Key equ 72
Down_Key equ 80
Right_Key equ 77
;-------------------------->

;------SNAKE variables------->
dirX db -1 ;if 1 than snake is turning left if -1 snake is turning right
dirY db 0 ;if 1 snake is going down is -1 snake is going up
Tail dw 500 dup (0FFFFh)
ApplePosition dw ?
LengthOfSnake dw 0
HeadPosition dw ?
temp_snake dw 0FFFFh
esc_IsPressed db 0
;---------------------------->
CODESEG
proc ClearScreen
;---Used Registers--->
	push ax
	push bx
	push cx
	push es
;-------------------->
	mov ax, 0A000h
	mov es, ax
	xor bx, bx
	
	mov cx, 320 * 200
@@ClearingLbl:
	mov [byte ptr es:bx], 0
	inc bx
	loop @@ClearingLbl
	
;---Used Registers--->
	pop es
	pop cx
	pop bx
	pop ax
;-------------------->
	ret
endp ClearScreen	
	

proc ShiftArrLeft
	;---Used Registers--->
		push bx
		push si
		push cx
		push ax
	;-------------------->
		mov bx, offset Tail
		mov si, 498*2
		mov cx, 499
	@@ShiftingLoop:
		mov ax, [bx + si]
		mov [bx + si + 2], ax
		sub si, 2
		loop @@ShiftingLoop	
	;---Used Registers--->
		pop ax
		pop cx
		pop si
		pop bx
	;-------------------->
	ret
endp ShiftArrLeft
	
	
	
	
;=====Procedure Start======>
; - Parameters: hex value
; - Action: prints hex value in decimal base
proc PrintHexValue
;---Used Registers--->
	push ax cx dx si
;-------------------->
	push bp
	mov bp, sp
	hexValue equ [word ptr bp + 12]
	sub sp, 2
	tempDecimalValue equ [word ptr bp - 2]
	mov tempDecimalValue, 0
	mov bx, 10
	xor si, si
	xor cl, cl
@@hexToDecimal:
	mov ax, hexValue
	xor dx, dx
	div bx
	shl dx, cl
	add tempDecimalValue, dx
	add cl, 4
	cmp ax, 0
	je @@skipConvertionLoop
	mov hexValue, ax
	jmp @@hexToDecimal
@@skipConvertionLoop:

;Print decimal value	
	mov dx, tempDecimalValue
	mov cx, 4
@@printLoop:
	push dx
	and dh, 11110000b ;keep digit in dh
	mov dl, dh
	shr dl, 4
	add dl, 30h
	mov ah, 2
	int 21h
	pop dx
	rol dx, 4 ;go to next digit
	loop @@printLoop
	
	
	
	
	add sp, 2
	pop bp
;---Used Registers--->
	pop si dx cx ax
;-------------------->
	ret 2
endp PrintHexValue
;=====End of procedure=====>
	
;------------------------------------------------------------------>
;- Parameters: none
;- Action: Check if one of the arrows are pressed,
;          if it does, it changes the direction.
proc CheckIfPressed
	in al, 60h
	
	cmp al, 1
	jnz @@notEscPressed
;in case esc is pressed
	mov [byte ptr esc_IsPressed], 1
@@notEscPressed:
	
	cmp al, Left_Key
	jnz @@NotLeftKey
	cmp [dirX], 1
	je @@DontGoLeft
	mov [dirX], -1
	mov [dirY], 0
@@DontGoLeft:
	ret
@@NotLeftKey:
	cmp al, Right_Key
	jne @@NotRightKey
	cmp [dirX], -1
	je @@DontGoRight
	mov [dirX], 1
	mov [dirY], 0
@@DontGoRight:	
	ret
	
@@NotRightKey:	
	cmp al, Up_Key
	jne @@NotUpKey
	cmp [dirY], 1
	je @@DontGoUp
	mov [dirX], 0
	mov [dirY], -1
@@DontGoUp:
	ret
	
@@NotUpKey:	
	cmp al, Down_Key
	jnz @@Nopress
	cmp [dirY], -1
	je @@Nopress
	mov [dirX], 0
	mov [dirY], 1
@@Nopress:	
	ret
endp CheckIfPressed	
;-----------------------END OF PROCEDURE------------------------->
	




;--------------------------------------------------------------------->
;- Parameters: 1. y position 8 bit, x position 8 bit for example 0504h means line 5 row 4
;			   2. color
;- action: draws wanted color in wanted index of a 25*40 grid, each square is 8*8 pixels
proc ColorizeCell
	;---used Registers--->
	push ax
	push bx
	push cx
	push dx
	;-------------------->
	push bp
	mov bp, sp
	sub sp, 2
	TempValueHolder equ [word ptr bp - 2]
	Color equ [byte ptr bp + 12]

	mov al, Color
	mov cx, [bp + 14]
	
	cmp cx, 0FFFFh
	je @@endOfProc
	
	xor dx,dx
	xchg dl, ch
	shl cx, 3
	shl dx, 3
	inc cx
	inc dx
	mov TempValueHolder, cx
	
	mov ah, 0Ch ;print dot to screen
	mov bl, 0 ;page number
	mov cx, 6	
@@Line_Down_Loop:
	push cx
	mov cx, 6

	
@@PrintingLoop:
	push cx
	mov cx, TempValueHolder
	int 10h
	pop cx
	inc TempValueHolder
	loop @@PrintingLoop
	
	pop cx
	inc dx
	sub TempValueHolder, 6
loop @@Line_Down_Loop	
	
@@endOfProc:
	add sp, 2
	pop bp
	;---used Registers--->
	pop dx
	pop cx
	pop bx
	pop ax
	;-------------------->
	ret 4
endp ColorizeCell	
;-----------------------END OF PROCEDURE------------------------->




;---------------------------------------------------------------->
;- Parameters: y of wanted cell (8 bit), x of wanted cell (8 bit)
;- action: renturns the color in the wanted cell
;- returns: cell's color in al
proc ReadCellColor
;---Used Registers--->
	push bx
	push cx
	push dx
;-------------------->
	push bp
	mov bp, sp

	xor cx, cx
	xor dx, dx
	mov ax, [bp + 10]
	mov cl, al
	mov dl, ah
	
	shl cx, 3
	shl dx, 3
	
	inc cx
	inc dx
	
	mov ah, 0dh
	mov bh, 0
	int 10h
	
	pop bp
;---Used Registers--->
	pop dx
	pop cx
	pop bx
;-------------------->
		
	ret 2
endp ReadCellColor
;-------------------------End Of Procedure----------------------->	
	
	
	
	
;-------------------------------------------------------------->	
;- Parameters: number of seconds / 0.055, for example, 
;			   if we want 10 seconds, we should send 
;			   182 because 10 / 0.055 = 181.8
;- Action: delays program for wanted amount of time.
proc DelayProgram
	; wait for first change in timer
	;----Used Registers--->
	push ax
	push cx
	push es
	;--------------------->
	push bp
	mov bp, sp
	NumberOfTicks equ [word ptr bp + 10]
	
	mov ax, 40h
	mov es, ax
	mov ax, [Clock]
@@FirstTick:
	cmp ax, [Clock]
	call CheckIfPressed
	je @@FirstTick
	; count number of sec
	mov cx, NumberOfTicks ; EnteredNuMx0.055sec = ~actual number of seconds
@@DelayLoop:	
	call CheckIfPressed

	mov ax, [Clock]
	@@Tick:
	cmp ax, [Clock]
	je @@Tick
	loop @@DelayLoop
	
	pop bp
	;---Used Registers--->
	pop es
	pop cx
	pop ax
	;-------------------->
	ret 2
endp DelayProgram
;-----------------------END OF PROCEDURE------------------------->

	
	
;---------------------------------------------------------------->
;- Parameters: one number.
;- action: Generates random number from zero to given number.
;  and returns the random number in ax...
;- author: Or Gany

proc GenerateRandomNumber
;----used registers--->
	push cx
	push dx
;--------------------->
	push bp
	mov bp, sp
	
	mov ah, 2ch
	int 21h
	mov ax, dx
	xor dx, dx
	mov cx, [bp + 8]
	div cx
	mov ax,dx
	
	pop bp
;----used registers--->
	pop dx
	pop cx
;--------------------->	
ret 2
endp GenerateRandomNumber
;-----------------------END OF PROCEDURE------------------------->





proc DrawBorders
;---Used Registers--->
	push ax
	push bx
	push cx
	push dx
;-------------------->	

;----sent parameters to interrupt--->
	mov bl, 0 ;----Page Number
	mov al, 1 ;----Color (blue)
	mov ah, 0Ch ;--Draw Dot Interrupt
;----------------------------------->	

;---Draw Upper Border--->	
	mov cx, 8 ;----number of lines
	xor dx, dx ;---holds the number of line
@@DrawUpperBorderLoop:
	push cx
	mov cx, 320 ;--holds the number of pixel to colorize
	
@@innerUpperBorderLoop:
	dec cx ;-------cx - 1 = index of pixel
	int 10h
	inc cx ;-------returns the original value
	loop @@innerUpperBorderLoop
	
	inc dx ;-------new line
	pop cx
	loop @@DrawUpperBorderLoop
;----------------------->	
	
;---Drow Left Border--->	
	mov cx, 8 ;---holds the number of rows
	xor bx, bx;---uses as row holder
@@DrawLeftBorderLoop:
	push cx
	mov cx, 200 ;-number of pixel to colorize
@@innerLeftBorderLoop:
	push cx
	mov dx, cx ;--dx holds the y coordinates
	dec dx
	mov cx, bx ;--cx holds the x coordinates
	int 10h
	pop cx
	loop @@innerLeftBorderLoop
	
	inc bx
	pop cx
	loop @@DrawLeftBorderLoop
;---------------------->	

;---Drow Right Border--->	
	mov cx, 8 ;---holds the number of rows
	mov bx, 312;---uses as row holder
@@DrawRightBorderLoop:
	push cx
	mov cx, 200 ;-number of pixel to colorize
@@innerRightBorderLoop:
	push cx
	mov dx, cx ;--dx holds the y coordinates
	dec dx
	mov cx, bx ;--cx holds the x coordinates
	push bx
	xor bx, bx
	int 10h
	pop bx
	pop cx
	loop @@innerRightBorderLoop
	
	inc bx
	pop cx
	loop @@DrawRightBorderLoop
;---------------------->		


xor bx, bx

;---Draw Lower Border--->	
	mov cx, 8 ;----number of lines
	mov dx, 192 ;---holds the number of line
@@DrawLowerBorderLoop:
	push cx
	mov cx, 320 ;--holds the number of pixel to colorize
	
@@innerLowerBorderLoop:
	dec cx ;-------cx - 1 = index of pixel
	int 10h
	inc cx ;-------returns the original value
	loop @@innerLowerBorderLoop
	
	inc dx ;-------new line
	pop cx
	loop @@DrawLowerBorderLoop
;----------------------->	



;-----Used Registers--->
	pop dx
	pop cx
	pop bx
	pop ax
;---------------------->
	
	ret
endp DrawBorders






;---------------------------------------------------------------->
;- Parameters: None
;- Action: draws the apple in Random Place
;- author: Or Gany
proc DrawApple
;---Used Registers--->
	push ax
	push bx 
;-------------------->
@@CheckIfLeagalTeleport:
	xor ax, ax
	push 38
	call GenerateRandomNumber
	inc al
	mov bl, al
	push 23
	call GenerateRandomNumber
	inc al
	mov ah, al
	mov al, bl
	
	push ax
	push ax
	call ReadCellColor
	cmp al, 2
	pop ax
	je @@CheckIfLeagalTeleport
	
	push ax
	push 4
	call ColorizeCell
	
	mov [ApplePosition], ax
;---Used Registers--->
	pop bx
	pop ax
;---Used Registers--->	
	ret
endp DrawApple	
	
	
proc DrawHead
	push ax
	push [HeadPosition]
	push 2
	call ColorizeCell	
	mov ax,[HeadPosition]
	mov [temp_snake], ax
	pop ax
	ret
endp DrawHead	
	
	
proc DrawTail
xor si, si
@@Lbl:
	cmp [word ptr Tail + si], 0FFFFh
	je @@EndOfProc
	push [word ptr Tail + si]
	push 2
	call ColorizeCell
	add si,2
	jmp @@Lbl
	
@@EndOfProc:
	ret
endp DrawTail	
	
	
;--------------------------------------------->
;- Parameters: none
;- action: check if game over, if it is,
;		   it returns 1 in al , else , returns 0
;- returns: 0 or 1 in al
;- author: Or Gany
proc CheckIfGameOver
	push [HeadPosition]
	call ReadCellColor
	
	cmp al, 1
	je @@GameIsOver
	cmp al, 2
	je @@GameIsOver
	xor ax, ax
	jmp @@EndOfCheckingGameProc
@@GameIsOver:
	mov al, 1
@@EndOfCheckingGameProc:	
	ret	
endp CheckIfGameOver	
;---------------End Of Procedure------------->	
	
	
	
;=============================================SNAKE START=========================================>	
; - Parameters: speed. 1 = fast, 2 = medium. 3 = slow
proc Snake
	push bp
	mov bp, sp

;---Initialize game data--->
	mov [word ptr HeadPosition], 0D14h ;sets the start point in the middle of the screen
	mov [byte ptr dirX], -1
	mov [byte ptr dirY], 0
	push ds
	pop es
	mov ax, 0FFFFh
	mov di, offset Tail
	mov cx, 500
	rep stosw ;reset the tail array
	mov [word ptr LengthOfSnake], 0
	mov [word ptr temp_snake], 0FFFFh
	mov [byte ptr esc_IsPressed], 0
;-------------------------->

	call DrawBorders

	mov [word ptr HeadPosition], 0D14h ;sets the start point in the middle of the screen
	call DrawApple
	
		
MainLoop:
	mov ax, [bp + 4]
	push ax
	call DelayProgram
	
;-Check If esc is pressed->
	cmp [byte ptr esc_IsPressed], 1
	je @@EndOfProc
;------------------------->
	xor si, si
SearchForLastNumLoop:
	cmp [word ptr Tail + si + 2], 0FFFFh
	je SkipSearchingLoop
	add si, 2
	jmp SearchForLastNumLoop
SkipSearchingLoop: ;now si holds the index of the last cell
	cmp [word ptr Tail+si], 02040h
	ja @@skipColorize
	push [Tail + si]
	push 0	;black
	call ColorizeCell ;delete cell - colorize in black
@@skipColorize:
	
	call ShiftArrLeft
	mov ax, [HeadPosition]
	mov [word ptr Tail], ax ;saves one location backwards
	mov si, [LengthOfSnake]
	shl si, 1	;multiply si by 2 because the each cell is word 
	mov [word ptr Tail + si], 0FFFFh
		
	
	add ah, [dirY]
	add al, [dirX]
	mov [HeadPosition], ax
	
	
	push [temp_snake]
	push 0
	call ColorizeCell
	
	call CheckIfGameOver

	
	call DrawHead
	
	call DrawTail
	
	dec al
	je @@EndOfProc	
		
	mov ax, [HeadPosition]
	cmp ax, [ApplePosition]
	jne MainLoop
	inc [word ptr LengthOfSnake]
	call DrawApple
	jmp MainLoop
	
@@EndOfProc:
	call ClearScreen
	pop bp
	ret 2
endp Snake	
;====================================================SNAKE END==================================================>
