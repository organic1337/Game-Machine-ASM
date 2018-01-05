
IDEAL
MODEL small
STACK 100h
DATASEG
;---player shape--->
player 	db 7*36 dup(15)
;------------------>


;---Ball Shape--->
ball 	db 0,0,15,15,15,15,0,0 
		db 0,15,15,15,15,15,15,0 
		db 15,15,15,15,15,15,15,15 
		db 15,15,15,15,15,15,15,15 
		db 15,15,15,15,15,15,15,15 
		db 15,15,15,15,15,15,15,15 
		db 0,15,15,15,15,15,15,0
		db 0,0,15,15,15,15,0,0

;---------------->


;---Player shape scales--->
	player_width 	equ 7
	player_height	equ 36
;------------------------->

;---ball shape scales--->
	ball_width		equ 8
	ball_height		equ 8
;----------------------->

;---Player 1 Position--->
	player1X		dw 290
	player1Y		dw ?
	pongHitCounter  db 0
;-------------------------->
;---Player 2 Position--->
	player2X		dw 30
	player2Y		dw ?
;-------------------------->

;---Points counters--->
	player1Points	db ?
	player2Points 	db ?
;--------------------->

;---ball Position--->
	ballX	dw ?
	ballY	dw ?
;------------------->


;---ball speed--->
	ballSpeed 		db ?   ;from 1 to 18
	numOfBallMoves	db 0   ;uses for slowing down the ball speed
	neededMoves		db ?
;---------------->

;---Wall--->
	wallCounter		db 0
;---------->

;---Keys--->
	enter_key 	equ 28
	up_key		equ 72
	down_key	equ 80
	left_key	equ 75
	right_key	equ 77
	w_key 		equ 17
	s_key 		equ 31
;---------->


;---Keys IsPressed?--->
; - Info:	these variables makes moving the two pongs
;			in the same time.if the button is pressed, the pong
;			will move, if the button is released, the player will
;			stop moving.
	up_IsPressed	db ?
	down_IsPressed	db ?
	w_IsPressed		db ?
	s_IsPressed		db ?
;--------------------->


;---Clock Address--->
	clock 		equ es:6ch
;------------------->


;---num of presses--->
; - Info: At first, the speed of the pong
;		  was too fast so tried to think on a way
;		  to make the movement slower, I decided to
;		  devide the speed by 4, how did I do that?
;		  instead of moving the pong one pixel each press,
;		  the pong moves every 4 presses, which means the original speed
;		  was divided by 4. To check the 4 presses I made variable 
;		  that uses as presses counters.
	up_Presses		db 0
	down_Presses	db 0
	w_Presses		db 0
	s_Presses		db 0
;-------------------->

;---Messages--->
;--1 player mode--
playAgain	db 'Press ENTER to play again...$'
startGame	db 'Press ENTER to start the game...$'
winnerMsg	db 'WINNER!$'
;-----------------		
			
;-------------->
CODESEG


;-----Procedure Start------>
; - Parameters: none
; - action: draws the upper and the lower borders
proc PrintBorders_2Players
;---Used Registers--->
	push ax cx di es
;-------------------->

	push 0A000h
	pop es	;moves to es the segment of the screen in graphics mode for stosb
	mov al, 15 ;15 = white color in the palette, value for stosb
	xor di, di ;start index for stosb
	mov cx, 320 * 8 ;8 lines
	rep stosb ;upper borders
	
	mov di, 320*192
	mov cx, 320*8 ;8 lines
	rep stosb ;lower border
;---Used Registers--->
	pop es di cx ax
;-------------------->
	ret
endp PrintBorders_2Players
;-----End Of Procedure----->

;-----Procedure Start------>
; - Parameters: none
; - Action: Prints the middle line
;			in the 2 players pong
proc PrintMidLine
;---Used Registers--->
	push ax cx di es
;-------------------->

	push 0A000h
	pop es	;moves to es the segment of the screen in graphics mode for stosb
	mov al, 15 ;15 = white color for the palette, value for stosb
	mov di, 160 - 4
	mov cx, 200
@@drawMidLine:
	push cx
	mov cx, 8
	rep stosb
	add di, 320 - 8
	pop cx
	loop @@drawMidLine
;---Used Registers--->
	pop es di cx ax
;-------------------->
	ret
endp PrintMidLine
;-----End Of Procedure----->


;-----Procedure Start------>
; - Parameters:	none
; - Action: checks if ball is touching the training
;			wall
proc CheckUpperWall
;---Used Registers--->
	push ax 
;-------------------->
	cmp [word ptr ballY], 8
	jne @@notUpperWall
	xor dh, dh
	cmp [byte ptr ballSpeed], 9
	ja @@above9_upperWall
;in case speed is 9 or below
	mov dl, [ballSpeed] 			;this action will make the ball change direction right away
	mov al, 10
	sub al, dl
	mov [ballSpeed], al
	jmp @@notUpperWall
@@above9_upperWall:					;in case speed is bigger than 9
	mov dl, [ballSpeed]
	sub dl, 9
	mov al, 28
	sub al, [ballSpeed]
	mov [ballSpeed], al
	jmp @@notUpperWall
@@notUpperWall:	
;---Used Registers--->
	pop ax 
;-------------------->
	ret
endp CheckUpperWall

proc CheckLeftWall
	cmp [word ptr ballX], 8			;the wall is 8 px from the left edge
	jne @@notLeftWall
	add [byte ptr ballSpeed], 9 	;we have to add 9 to get the opposite velocity
	xor dx, dx
@@notLeftWall:	
	ret
endp CheckLeftWall

proc CheckLowerWall
	cmp [word ptr ballY], 200 - 8 - ball_height
	jne @@notLowerWall
	xor dh, dh
	cmp [byte ptr ballSpeed], 9
	ja @@above9_lowerWall
;in case speed is 9 or below
	mov al, 10
	sub al, [ballSpeed]
	mov	[ballSpeed], al
	mov dl, al
	jmp @@notLowerWall	
@@above9_lowerWall:	;in case speed is greater than 9
	
	mov al, 28
	sub al, [ballSpeed]
	mov [ballSpeed], al
	sub al, 9
	mov dl, al
@@notLowerWall:	
	ret
endp CheckLowerWall


proc CheckIfBallTouchesWalls
;---Used Registers--->
	push ax bx cx 
;-------------------->
	push bp
	mov bp, sp
	numOfPlayers equ [word ptr bp + 4]
	
	mov al, [neededMoves]
	cmp [byte ptr numOfBallMoves], al;the ball runs once every 4 times
	jne @@endOfProc 				;in case the ball is not gonna move in this loop run	
	mov [byte ptr wallCounter], 0
	cmp numOfPlayers, 2
	je @@skipLeftWall
;---Check Left Wall---	
	call CheckLeftWall
;----------------------	
@@skipLeftWall:

;---Check upper wall---
	call CheckUpperWall
;----------------------

;---Check lower wall---
	call CheckLowerWall
;----------------------
@@endOfProc:
	pop bp	
;---Used Registers--->
	pop cx bx ax
;-------------------->
	ret 2
endp CheckIfBallTouchesWalls
;-----End of procedure----->

;-----Procedure Start------>
; - Parameters: none.
; - Action: Draws the line in the middle
;			of the arena
proc DrawMidLine
;---Used Registers--->
	push ax cx di es
;-------------------->
	push 0A000h
	pop es
	mov di, 160 - 8
	mov al, 15 ;15 = white color in the palette
	mov cx, 200
@@drawStart:
	push cx
	mov cx, 8
	rep stosb
	add di, 320 - 8
	pop cx
	loop @@drawStart

;---Used Registers--->
	pop es di cx ax
;-------------------->
	ret
endp DrawMidLine
;-----End Of Procedure----->

;-----Procedure start------>
; - Parameters: none
; - Action: Checks what is supposed to be the speed of the ball
;			when hits the pong
proc SetBallSpeed_player1
;---Used Registers--->
	push ax bx cx
;-------------------->
	mov al, [neededMoves]
	cmp [byte ptr numOfBallMoves], al
	jne_f @@endOfProc
	
	push dx	
;---Check if Encouters the pong--->
	mov ah, 0dh
	xor bl, bl
	mov dx, [ballY]
	add dx, ball_height/2 + 1 	;***Dangerous Line***
	mov cx, [ballX]
	add cx, ball_width
	int 10h 					;reads nearby pixel from screen
	cmp al, 15
	je @@nearbyPong
@@checkAgain:
	sub dx, 3					;***Dangerous Line***
	int 10h
	cmp al, 15
	je @@nearbyPong
	pop dx
	jmp @@endOfProc
@@nearbyPong:	
;--------------------------------->
	mov ax, [ballX]
	add ax, ball_width
	cmp ax, [player1X]
	je @@ballNearPong
	pop dx
	jmp @@endOfProc
@@ballNearPong:	
	cmp [byte ptr pongHitCounter], 10
	ja @@dontIncHitCounter
	inc [byte ptr pongHitCounter]
@@dontIncHitCounter:
	pop dx
	xor dx, dx
	mov ax, [ballY]
	sub ax, [player1Y]
	add ax, ball_height/2 + 3
	shr ax, 2 ;divide ax by 4
	jnz @@speedIsntLessThan1
	mov [byte ptr ballSpeed], 1
	jmp @@endOfProc
@@speedIsntLessThan1:	
	mov [ballSPeed], al
@@endOfProc:	
;---Used Registers--->
	pop cx bx ax
;-------------------->
	ret
endp SetBallSpeed_player1

;-----End of procedure----->

;-----Procedure start------>
; - Parameters: none
; - Action: Checks what is supposed to be the speed of the ball
;			when hits the pong
proc SetBallSpeed_player2
;---Used Registers--->
	push ax bx cx
;-------------------->
	mov al, [neededMoves]
	cmp [byte ptr numOfBallMoves], al
	jne_f @@endOfProc
	
	push dx	
;---Check if Encouters the pong--->
	mov ah, 0dh
	xor bl, bl
	mov dx, [ballY]
	add dx, ball_height/2 + 1 	;***Dangerous Line***
	mov cx, [ballX]
	dec cx ;****
	int 10h 					;reads nearby pixel from screen
	cmp al, 15
	je @@nearbyPong
@@checkAgain:
	sub dx, 3					;***Dangerous Line***
	int 10h
	cmp al, 15
	je @@nearbyPong
	pop dx
	jmp @@endOfProc
@@nearbyPong:	
;--------------------------------->
	mov ax, [ballX]
	sub ax, player_width
	cmp ax, [player2X]
	je @@ballNearPong
	pop dx
	jmp @@endOfProc
@@ballNearPong:	
	cmp [byte ptr pongHitCounter], 10
	ja @@dontIncHitCounter
	inc [byte ptr pongHitCounter]
@@dontIncHitCounter:
	pop dx
	xor dx, dx
	mov ax, [ballY]
	sub ax, [player2Y]
	add ax, ball_height/2 + 3
	cmp ax, player_height + 2
	jb @@notInEdge
	mov ax, player_height + 1
@@notInEdge:
	shr ax, 2 ;divide ax by 4
	jnz @@speedIsntLessThan1
	mov [byte ptr ballSpeed], 10
	jmp @@endOfProc
@@speedIsntLessThan1:	
	mov [ballSPeed], al
	add [byte ptr ballSpeed], 9
@@endOfProc:	
;---Used Registers--->
	pop cx bx ax
;-------------------->
	ret
endp SetBallSpeed_player2
;-----End of procedure----->


;-----Procedure Start------>
; - Parameters: none.
; - Action: Prints the borders and the wall
proc PrintBorders_1Player
;---Used Registers--->
	push ax bx cx dx es
;-------------------->
	push 0A000h
	pop es
	
	xor di, di ;start index
	mov al, 15 ;wanted color
	mov cx, 8
@@upperBorder:
	push cx
	mov cx, 320
	rep stosb ;store string - byte
	pop cx
	loop @@upperBorder
	
	mov di, 320 * 200 - 320 * 8
	mov cx, 8
@@lowerBorder:
	push cx
	mov cx, 320
	rep stosb ;store string - byte
	pop cx
	loop @@lowerBorder
	
	xor di, di
	mov cx, 200
@@leftWall:
	push cx
	mov cx, 8
	rep stosb ;store string - byte
	add di, 320 - 8
	pop cx
	loop @@leftWall
	
	
;---Used Registers--->
	pop es dx cx bx ax
;-------------------->	
	ret
endp PrintBorders_1Player
;-----End of procedure----->




;-----Procedure start------>
; - Parameters: offset of shape, x coordinates of player, y coordinates of player,
;			    height of shape, width of shape
; - Action: Prints shape
proc PrintShape_pong
;---Used Registers--->
	push ax bx cx dx si di
;-------------------->

	push bp
	mov bp, sp
	
	shape_width 	equ [word ptr bp + 16]
	shape_height	equ [word ptr bp + 18]
	shape_y 		equ [word ptr bp + 20]
	shape_x 		equ [word ptr bp + 22]
	shape_offset 	equ [word ptr bp + 24]
	
	
	mov ah, 0ch
	xor bl, bl
	
	xor di, di
	mov dx, shape_y
	mov cx, shape_height
	
@@printShapeLoop_pong:
	push cx
	mov cx, shape_width
	xor si, si
@@innerPrintingLoop_pong:
	push cx
	mov cx, shape_x
	add cx, si
	mov bx, shape_offset
	mov al, [bx + di]
	xor bx, bx
	int 10h
	pop cx
	inc di
	inc si
	loop @@innerPrintingLoop_pong
	pop cx
	inc dx
	loop @@printShapeLoop_pong
	
	pop bp
;---Used Registers--->
	pop di si dx cx bx ax
;-------------------->	
	ret 10
endp PrintShape_pong
;-----End of Procedure----->



;-----Procedure Start------>
; - Parameters: number of seconds / 0.055
;				for example: 10 seconds = 10 / 0.055 = 182
;				so if we want 10 seconds we should send 182
; - Action: delays the program for given num of ticks 
proc DelayProgram_pong
;---Used Registers--->
	push ax cx 
;-------------------->
	push bp
	mov bp, sp
	numOfTicks equ [word ptr bp + 8]
	
	mov  ax, 40h 
	mov  es, ax 
	mov  ax, [clock] 
@@FirstTick_pong:  
	cmp  ax, [clock] 
	je  @@FirstTick_pong 
	mov cx, numOfTicks
@@DelayLoop_pong: 
	mov  ax, [clock] 
@@Tick_pong: 
	cmp  ax, [clock] 
	je @@Tick_pong	
	loop @@DelayLoop_pong
		
	pop bp
;---Used Registers--->
	pop cx ax
;-------------------->	
	ret 2
endp DelayProgram_pong
;-----End of procedure----->


;-----Procedure start------>
; - Parameters: None.
; - Action: Clears screen with black color
proc ClearScreen_pong
;---Used Registers--->
	push ax cx di es
;-------------------->	
	push 0A000h
	pop es		;wanted segment
	xor di, di 	;start index
	xor al, al 	;black color is 0 in palette
	
	mov cx, 320 * 200
	rep stosb	;store string - byte
;---Used Registers--->
	pop es di cx ax
;-------------------->	
	ret
endp ClearScreen_pong
;-----End of procedure----->

;-----Procedure Start------>
; - Parameters: x coordinates of wanted line, y coordinates of wanted line.
; - action: deleted one line from player's trail
proc DeletePlayerTrail
;---Used Registers--->
	push ax cx dx 
;-------------------->	
	push bp
	mov bp, sp
	lineStart_y equ [word ptr bp + 10]
	lineStart_x equ [word ptr bp + 12]
	
	sub sp, 2
	temp equ [word ptr bp - 2]
	mov dx, lineStart_x
	mov temp, dx			;holds the x coordinates
	mov dx, lineStart_y		;holds the y coordinates
	mov ah, 0ch				;prints pixel to screen
	xor al, al 				;wanted color is black
	xor bl, bl 				;wanted page is 0
	
	mov cx, player_width
@@deleteLineLoop:
	push cx
	mov cx, temp
	int 10h
	pop cx
	inc temp
loop @@deleteLineLoop	

	add sp, 2
	pop bp
;---Used Registers--->
	pop dx cx ax
;-------------------->		
	ret 4
endp DeletePlayerTrail
;-----End of procedure----->


;-----Procedure start------>
; - Parameters: none
; - action: checks input and moves according it
; - returns: returns 1 in al if input is ESC
proc CheckInput_pong
;---Used Registers--->
	push dx
;-------------------->

	in al,60h			;put in al pressed key scan code
	
;---------Check If each button is pressed or released------------->
;--------up--------->
;--pressed-->
	cmp al, up_key
	jne @@notUpKey_Pressed
	mov [byte ptr up_IsPressed], 1
@@notUpKey_Pressed:
;----------->

;--Released-->
	mov bl, up_key
	or bl, 10000000B ;turn on the left bit... result = released button in scan code
	cmp al, bl
	jne @@notUpKey_Released
	mov [byte ptr up_IsPressed], 0
@@notUpKey_Released:	
;------------>
;------------------->

;--------down--------->
;--pressed-->
	cmp al, down_key
	jne @@notDownKey_Pressed
	mov [byte ptr down_IsPressed], 1
@@notDownKey_Pressed:
;----------->

;--Released-->
	mov bl, down_key
	or bl, 10000000B ;turn on the left bit... result = released button in scan code
	cmp al, bl
	jne @@notDownKey_Released
	mov [byte ptr down_IsPressed], 0
@@notDownKey_Released:	
;------------>
;------------------->

;--------W--------->
;--pressed-->
	cmp al, w_key
	jne @@notWKey_Pressed
	mov [byte ptr w_IsPressed], 1
@@notWKey_Pressed:
;----------->

;--Released-->
	mov bl, w_key
	or bl, 10000000B ;turn on the left bit... result = released button in scan code
	cmp al, bl
	jne @@notWKey_Released
	mov [byte ptr w_IsPressed], 0
@@notWKey_Released:	
;------------>
;------------------->

;--------S--------->
;--pressed-->
	cmp al, s_key
	jne @@notSKey_Pressed
	mov [byte ptr s_IsPressed], 1
@@notSKey_Pressed:
;----------->

;--Released-->
	mov bl, s_key
	or bl, 10000000B ;turn on the left bit... result = released button in scan code
	cmp al, bl
	jne @@notSKey_Released
	mov [byte ptr s_IsPressed], 0
@@notSKey_Released:	
;------------>
;------------------->
;----------------------------------------------------------------->
	
	
	
	cmp [player1Y], 8	;check if player is in top
	je @@not_up
	cmp [byte ptr up_IsPressed], 1		;check if pressed key is up
	jne @@not_up
	
;---Downgrades the speed of the pong--->	
	inc [byte ptr up_Presses] 	 	 ;another press was made
	cmp [byte ptr up_Presses], 2	 ;checks if 4 presses were made
	jne @@not_up
	mov [byte ptr up_Presses], 0	 ;if 4 presses made, resets the variable's value
;-------------------------------------->	
	
	push [player1X]
	mov dx, [player1Y]
	add dx, player_height - 1
	push dx
	call DeletePlayerTrail
	dec [player1Y]		;move the player up
@@not_up:	
	cmp [player1Y], 200 - player_height - 8 ;check if player is in bottom
	je @@not_down
	cmp [byte ptr down_IsPressed], 1	;check if down key is pressed
	jne @@not_down
	
;---Downgrades the speed of the pong--->	
	inc [byte ptr down_Presses] 	 ;another press was made
	cmp [byte ptr down_Presses], 2	 ;checks if 4 presses were made
	jne @@not_down
	mov [byte ptr down_Presses], 0	 ;if 4 presses made, resets the variable's value
;-------------------------------------->	
	
	push [player1X]
	push [player1Y]
	call DeletePlayerTrail	
	inc [player1Y]		;move player down
	
@@not_down:	


	cmp [player2Y], 8	;check if player is in top
	je @@not_w
	cmp [byte ptr w_IsPressed], 1		;check if pressed key is up
	jne @@not_w
	
;---Downgrades the speed of the pong--->	
	inc [byte ptr w_Presses] 	 	 ;another press was made
	cmp [byte ptr w_Presses], 2	 ;checks if 4 presses were made
	jne @@not_w
	mov [byte ptr w_Presses], 0	 ;if 4 presses made, resets the variable's value
;-------------------------------------->	
	
	push [player2X]
	mov dx, [player2Y]
	add dx, player_height - 1
	push dx
	call DeletePlayerTrail
	dec [player2Y]		;move the player up
@@not_w:	
	cmp [player2Y], 200 - player_height - 8 ;check if player is in bottom
	je @@not_s
	cmp [byte ptr s_IsPressed], 1	;check if down key is pressed
	jne @@not_s
	
;---Downgrades the speed of the pong--->	
	inc [byte ptr s_Presses] 	 ;another press was made
	cmp [byte ptr s_Presses], 2	 ;checks if 4 presses were made
	jne @@not_s
	mov [byte ptr s_Presses], 0	 ;if 4 presses made, resets the variable's value
;-------------------------------------->	
	
	push [player2X]
	push [player2Y]
	call DeletePlayerTrail	
	inc [player2Y]		;move player down
	
@@not_s:	
;---Used Registers--->
	pop dx
;-------------------->
	ret
endp CheckInput_pong
;-----End of procedure----->



;-----Procedure Start------>
; - Parameters: ball x, ball y
; - action: deletes the trail of the ball
proc DeleteBallTrail
;---Used Registers--->
	push ax bx cx dx si di
;-------------------->
	push bp 
	mov bp, sp
	sub sp, 2
	temp	  equ [word ptr bp - 2]
	positionY equ [word ptr bp + 16]
	positionX equ [word ptr bp + 18]
	
	mov ah, 0ch		;int 10.C prints pixel to screen
	xor bl, bl 		; we want to write in page 0
	xor al, al		; we want to delete, which means black color, black = 0
	
	mov dx, positionY
	mov cx, ball_height
@@deleteLeftSide: 	;this loop Deletes the left side of the ball
	push cx			;we must save cx value because of the loop
	mov cx, positionX
	int 10h			
	inc dx			;has to move on to next pixel
	pop cx
	loop @@deleteLeftSide
	
	mov cx, ball_height
	mov dx, positionY
@@deleteRightSide: 	;this loop Deletes the right side of the ball
	push cx			;we must save cx value because of the loop
	mov cx, positionX
	add cx, ball_width - 1
	int 10h			
	inc dx			;has to move on to next pixel
	pop cx
	loop @@deleteRightSide
	
	mov temp, 0		;needs to be zero because uses as a counter
	mov dx, positionY
	mov cx, ball_width
@@deleteUpSide:
	push cx
	mov cx, positionX
	add cx, temp
	int 10h
	inc temp
	pop cx
	loop @@deleteUpSide
	
	mov temp, 0		;needs to be zero because uses as a counter
	mov dx, positionY
	add dx, ball_height - 1
	mov cx, ball_width
@@deleteDownSide:
	push cx
	mov cx, positionX
	add cx, temp
	int 10h
	inc temp
	pop cx
	loop @@deleteDownSide
	
	
	add sp, 2 		;releasing the taken memory
	pop bp
;---Used Registers--->
	pop di si dx cx bx ax
;-------------------->
	ret 4
endp DeleteBallTrail
;-----End of procedure----->




;-----Procedure start------>
; - Parameters: none
; - action: Prints the score to screen
proc PrintScore
;---Used Registers--->
	push ax bx dx
;-------------------->
	;-----moves the cursor-----
	xor bh, bh ;we want page 0
	mov dh, 2 ;line
	mov dl, 17 ;column
	mov ah, 2
	int 10h	
	;--------------------------
	mov ah, 2
	mov dl, [player2Points]
	add dl, '0'
	int 21h
	
	;-----moves the cursor-----
	mov dh, 2 ;line
	mov dl, 21 ;column
	mov ah, 2
	int 10h	
	;--------------------------
	
	mov ah, 2
	mov dl, [player1Points]
	add dl, '0'
	int 21h
	
;---Used Registers--->
	pop dx bx ax
;-------------------->
	ret
endp PrintScore
;-----End of procedure----->



;-----Procedure start------>
; - Parameters: number
; - Action: changes the position
;			of the ball according to it's
;			movement pattern. To keep tracking of
;			the ball movement we use number which will be increased by 1 each loop run, 
;			this helps us dividing the moment into stages
proc MoveBall
;---Used Registers--->
	push ax bx dx si
;-------------------->
	push bp
	mov bp, sp
	
	mov al, [neededMoves]
	cmp [numOfBallMoves], al
	je @@startMoving
	inc [byte ptr numOfBallMoves]
	jmp @@endOfProc
@@startMoving:	
	mov [byte ptr numOfBallMoves], 0
	
	sentNumber 	equ [word ptr bp + 12] 	;uses for following the progression of the ball 
;---Delete Trail--->
	push [ballX]
	push [ballY]
	call DeleteBallTrail
;------------------>		
	mov ax, sentNumber
;---Check Speed of ball--->
;------Speed 1------
@@checkSpeedStart:
    cmp [byte ptr ballSpeed], 1	;checks if speed is:1
    jne @@speedNot1
	mov bl, 2
	div bl
	cmp ah, 0
	jne @@modNot0_speed1
	dec [word ptr ballX]		;move the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed1:
	dec [word ptr ballY] 		;move the ball up
    jmp @@skipCheckSpeed
;-------------------	

;------Speed 2------
@@speedNot1:
    cmp	[byte ptr ballSpeed], 2; checks if speed is:2
    jne @@speedNot2
	mov bl, 3
	div bl
	cmp ah, 0
	jne @@modNot0_speed2
	dec [word ptr ballX] 		;move the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed2:	
	cmp ah, 1
	jne @@modNot1_speed2
	dec [word ptr ballX]		;move the ball left
	jmp @@skipCheckSpeed
@@modNot1_speed2:	
	dec [word ptr ballY]		;move the ball up
    jmp @@SkipCheckSpeed
;--------------------	

;------Speed 3------
@@speedNot2:
    cmp [byte ptr ballSpeed], 3; checks if speed is:3
    jne @@speedNot3
	mov bl, 4
	div bl
	cmp ah, 0
	jne @@modNot0_speed3
	dec [word ptr ballX]	   ;moves the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed3:	
	cmp ah, 1
	jne @@modNot1_speed3
	dec [word ptr ballX]	   ;moves the ball left
    jmp @@SkipCheckSpeed
@@modNot1_speed3:
	cmp ah, 2
	jne @@modNot2_speed3
	dec [word ptr ballX]	   ;moves the ball left
	jmp @@skipCheckSpeed
@@modNot2_speed3:
	dec [word ptr ballY]	   ;moves the ball up
	jmp @@skipCheckSpeed
;--------------------
	
;------Speed 4------	
@@speedNot3:
    cmp [byte ptr ballSpeed], 4; checks if speed is:4
    jne @@speedNot4
	mov bl, 5
	div bl
	cmp ah, 0
	jne @@modNot0_speed4
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed4:	

	cmp ah, 1
	jne @@modNot1_speed4
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot1_speed4:

	cmp ah, 2
	jne @@modNot2_speed4
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot2_speed4:

	cmp ah, 3
	jne @@modNot3_speed4
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot3_speed4:
	dec [word ptr ballY]	;move the ball up
	jmp @@skipCheckSpeed	
;------------------------

;------Speed 5------
@@speedNot4:
    cmp[byte ptr ballSpeed], 5; checks if speed is:5
    jne @@speedNot5
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
;--------------------	
	
	
;------Speed 6------	
@@speedNot5:
    cmp [byte ptr ballSpeed], 6; checks if speed is:6
    jne @@speedNot6
	mov bl, 5
	div bl
	cmp ah, 0
	jne @@modNot0_speed6
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed6:	

	cmp ah, 1
	jne @@modNot1_speed6
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot1_speed6:

	cmp ah, 2
	jne @@modNot2_speed6
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot2_speed6:

	cmp ah, 3
	jne @@modNot3_speed6
	dec [word ptr ballX]	;move the ball left
	jmp @@skipCheckSpeed
@@modNot3_speed6:
	inc [word ptr ballY]	;move the ball down
	jmp @@skipCheckSpeed
;-------------------

;------Speed 7------
@@speedNot6:
    cmp [byte ptr ballSpeed], 7	;checks if speed is:7
    jne @@speedNot7
	mov bl, 4
	div bl
	cmp ah, 0
	jne @@modNot0_speed7
	dec [word ptr ballX]	   	;moves the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed7:	
	cmp ah, 1
	jne @@modNot1_speed7
	dec [word ptr ballX]	   	;moves the ball left
    jmp @@SkipCheckSpeed	
@@modNot1_speed7:
	cmp ah, 2
	jne @@modNot2_speed7		;moves the ball left
	dec [word ptr ballX]
	jmp @@skipCheckSpeed
@@modNot2_speed7:
	inc [word ptr ballY]		;moves the ball down
    jmp @@SkipCheckSpeed
;--------------------	
	
;------Speed 8------
@@speedNot7:
    cmp [byte ptr ballSpeed], 8	;checks if speed is:8
    jne @@speedNot8
	mov bl, 3
	div bl
	cmp ah, 0
	jne @@modNot0_speed8
	dec [word ptr ballX] 		;move the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed8:	
	cmp ah, 1
	jne @@modNot1_speed8
	dec [word ptr ballX]		;move the ball left
	jmp @@skipCheckSpeed
@@modNot1_speed8:	
	inc [word ptr ballY]		;move the ball down
    jmp @@SkipCheckSpeed
;--------------------
	
;------Speed 9------
@@speedNot8:
    cmp [byte ptr ballSpeed], 9	;checks if speed is:9
    jne @@speedNot9
	mov bl, 2
	div bl
	cmp ah, 0
	jne @@modNot0_speed9
	dec [word ptr ballX]		;move the ball left
	jmp @@skipCheckSpeed
@@modNot0_speed9:
	inc [word ptr ballY] 		;move the ball down
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 10------
@@speedNot9:
    cmp [byte ptr ballSpeed], 10; checks if speed is:10
    jne @@speedNot10
	mov bl, 2
	div bl
	cmp ah, 0
	jne @@modNot0_speed10
	inc [word ptr ballX]		;move the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed10:
	dec [word ptr ballY] 		;move the ball up
    jmp @@skipCheckSpeed
;-------------------	

;------Speed 11------
@@speedNot10:
    cmp [byte ptr ballSpeed], 11	;checks if speed is:11
    jne @@speedNot11
	mov bl, 3
	div bl
	cmp ah, 0
	jne @@modNot0_speed11
	inc [word ptr ballX] 		;move the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed11:	
	cmp ah, 1
	jne @@modNot1_speed11
	inc [word ptr ballX]		;move the ball right
	jmp @@skipCheckSpeed
@@modNot1_speed11:	
	dec [word ptr ballY]		;move the ball up
    jmp @@SkipCheckSpeed
;--------------------	

;------Speed 12------
@@speedNot11:
    cmp [byte ptr ballSpeed], 12; checks if speed is:12
    jne @@speedNot12
	mov bl, 4
	div bl
	cmp ah, 0
	jne @@modNot0_speed12
	inc [word ptr ballX]	   ;moves the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed12:	
	cmp ah, 1
	jne @@modNot1_speed12
	inc [word ptr ballX]	   ;moves the ball right
    jmp @@SkipCheckSpeed
@@modNot1_speed12:
	cmp ah, 2
	jne @@modNot2_speed12
	inc [word ptr ballX]       ;moves the ball right
	jmp @@skipCheckSpeed
@@modNot2_speed12:
	dec [word ptr ballY]       ;moves the ball up
	jmp @@skipCheckSpeed
;---------------------
	
;------Speed 13------	
@@speedNot12:
    cmp[byte ptr ballSpeed], 13; checks if speed is:13
    jne @@speedNot13
	mov bl, 5
	div bl
	cmp ah, 0
	jne @@modNot0_speed13
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed13:	

	cmp ah, 1
	jne @@modNot1_speed13
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot1_speed13:

	cmp ah, 2
	jne @@modNot2_speed13
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot2_speed13:

	cmp ah, 3
	jne @@modNot3_speed13
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot3_speed13:
	dec [word ptr ballY]	;move the ball up
	jmp @@skipCheckSpeed	
;------------------------

;------Speed 14------
@@speedNot13:
    cmp[byte ptr ballSpeed], 14; checks if speed is:5
    jne @@speedNot14
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
;--------------------	
	
	
;------Speed 15------	
@@speedNot14:
    cmp [byte ptr ballSpeed], 15; checks if speed is:14
    jne @@speedNot15
	mov bl, 5
	div bl
	cmp ah, 0
	jne @@modNot0_speed15
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed15:	

	cmp ah, 1
	jne @@modNot1_speed15
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot1_speed15:

	cmp ah, 2
	jne @@modNot2_speed15
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot2_speed15:

	cmp ah, 3
	jne @@modNot3_speed15
	inc [word ptr ballX]	;move the ball right
	jmp @@skipCheckSpeed
@@modNot3_speed15:
	inc [word ptr ballY]	;move the ball down
	jmp @@skipCheckSpeed
;-------------------

;------Speed 16------
@@speedNot15:
    cmp [byte ptr ballSpeed], 16	;checks if speed is:16
    jne @@speedNot16
	mov bl, 4
	div bl
	cmp ah, 0
	jne @@modNot0_speed16
	inc [word ptr ballX]	  	;moves the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed16:	
	cmp ah, 1
	jne @@modNot1_speed16
	inc [word ptr ballX]		;moves the ball right
    jmp @@SkipCheckSpeed
@@modNot1_speed16:
	cmp ah, 2
	jne @@modNot2_speed16	
	inc [word ptr ballX]		;moves the ball right
	jmp @@skipCheckSpeed
@@modNot2_speed16:
	inc [word ptr ballY]		;moves the ball down
    jmp @@SkipCheckSpeed
;--------------------	
	
;------Speed 17------
@@speedNot16:
    cmp[byte ptr ballSpeed], 17	;checks if speed is:17
    jne @@speedNot17
	mov bl, 3
	div bl
	cmp ah, 0
	jne @@modNot0_speed17
	inc [word ptr ballX] 		;move the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed17:	
	cmp ah, 1
	jne @@modNot1_speed17
	inc [word ptr ballX]		;move the ball right
	jmp @@skipCheckSpeed
@@modNot1_speed17:	
	inc [word ptr ballY]		;move the ball down
    jmp @@SkipCheckSpeed
;--------------------
	
;------Speed 18------
@@speedNot17:
    cmp[byte ptr ballSpeed], 18; checks if speed is:18
    jne @@speedNot18
	mov bl, 2
	div bl
	cmp ah, 0
	jne @@modNot0_speed18
	inc [word ptr ballX]		;move the ball right
	jmp @@skipCheckSpeed
@@modNot0_speed18:
	inc [word ptr ballY] 		;move the ball down
    jmp @@SkipCheckSpeed
;--------------------
@@speedNot18:
;------------------------->	

@@skipCheckSpeed:


@@endOfProc:	
	pop bp
;---Used Registers--->
	pop si dx bx ax
;-------------------->
	ret 2
endp MoveBall
;-----End of procedure----->


;-----Procedure Start------>
; - Parameters: line & column (8 bit each), offset of message
; - Action: Prints Massege in wanted location
proc PrintMsg
;---Used Registers--->
	push ax bx dx
;-------------------->
	push bp
	mov bp, sp
	MsgOffset 		equ [word ptr bp + 10]
	LineAndColumn	equ [word ptr bp + 12]

;-----moves the cursor-----
	xor bh, bh ;we want page 0
	mov dx, LineAndColumn
	mov ah, 2
	int 10h	
;--------------------------
	mov dx, MsgOffset
	mov ah, 9h
	int 21h
	
	pop bp
;---Used Registers--->
	pop dx bx ax
;-------------------->	
	ret 4
endp PrintMsg
;-----End of procedure----->





;-----Procedure start------>
; - Parameters: number of nopLoops
; - Action: slows down the program
;			and eventually downgrades the
;			speed of the objects
proc DowngradeFps
	push cx
	push bp
	mov bp, sp
	mov cx, [bp + 6]
@@nopLoop:
	nop
	nop
	loop @@nopLoop
	pop bp
	pop cx
	ret 2
endp DowngradeFps
;-----End of Procedure----->


;------------------------------------------------------------ONE PLAYER PONG START---------------------------------------------------------->
; Explenation: this procedure is the actual game that starts when the user request to play in single player mode. In this mode the player playes
; 			   against the wall, he hits the ball towards the walls and then the ball comes back towards him. After ten hits, the ball is speeding
;			   up.
;
; Keys: Enter - to play again
;		up arrow - to move up
;       down arrow - to move down
;		ESC - to quit the mode and move to the game manu
proc OnePlayerPong
	push bp
	mov bp, sp
	sub sp, 2
	numOfNopLoop equ [word ptr bp - 2] ;this is how exalaration is made
@@gameStart:	
	call PrintBorders_1Player
	xor dx, dx
	
;---Set Up--->	
	mov [word ptr ballX], 160 - ball_width/2
	mov [word ptr ballY], 100 - ball_height/2
	mov [byte ptr ballSpeed], 14
	mov [word ptr player1Y], 100 - player_height / 2
	mov [byte ptr neededMoves], 1
	mov [byte ptr pongHitCounter], 0
	mov [byte ptr up_IsPressed], 0
	mov [byte ptr down_IsPressed], 0
	mov [byte ptr w_IsPressed], 0
	mov [byte ptr s_IsPressed], 0
	mov numOfNopLoop, 8000
;------------>	
@@mainLoop:	
	
;---Print Ball--->
	push offset ball
	push [ballX]
	push [ballY]
	push ball_height
	push ball_width
	call PrintShape_pong
;---------------->

	push 1
	call CheckIfBallTouchesWalls
	call SetBallSpeed_player1

;---Print Player--->
	push offset player
	push [player1X]
	push [player1Y]
	push player_height
	push player_width
	call PrintShape_pong
;------------------->
	push numOfNopLoop ;number of nops
	call DowngradeFps
	push dx
	call MoveBall

	call CheckInput_pong
	dec al
	je @@exitMainLoop
	
;---Check If Player Missed--->
	mov ax,[player1X]
	add ax, player_width
	cmp [ballX], ax
	je @@gameOver
;---------------------------->	
	cmp [byte ptr pongHitCounter], 10
	jne @@dontSpeedUp
	dec [byte ptr neededMoves]
	inc [byte ptr pongHitCounter]
@@dontSpeedUp:	

	cmp [byte ptr numOfBallMoves], 0 ;check if ball had just make move
	jne @@dontIncDx
	cmp numOfNopLoop, 4500
	je @@skipDecNop
	dec numOfNopLoop
@@skipDecNop:
	inc dx	;info about dx in the end
@@dontIncDx:	
	jmp @@mainLoop
	
@@gameOver:
	mov ah, 11
	mov al, 7
	push ax
	push offset playAgain
	call PrintMsg
	
@@waitForEnter:
	xor ax, ax 	;ax needs to be 0 for the interrupt
	int 16h 	;get key from keyboard
	cmp ah, 1
	je @@exitMainLoop
	cmp ah, enter_key
	jne @@waitForEnter
	
	call ClearScreen_pong
	jmp @@gameStart
@@exitMainLoop:
	add sp, 2
	pop bp
	call ClearScreen_pong
	ret
endp OnePlayerPong
;----------------Explenations-------------------
; - Q:What is the DX register used for?
; - A:DX uses as the number that we get the modulu of.
;	  we need this number to divide the ball movement to parts.
;	  every remainder of division has a case that works according it.
;	  for example, if I wanted the ball to move in this order: one pixel left
;     and one pixel down, so what I did was dividing these two movements
;     and give every movement a division remainder. in this case, we only need 2
;	  options, so we could use the division remainder of dx / 2.
;
;
; - Q: How did you set the speed of the ball and the pong?
; - A: 	At first, I saw that those object were moving extremely fast, so I had to downgrade their speed.
; -		so I tried to use the "nop" keyword which basically does nothing but slowing down the program. but 
;		this option made ALL the object in the same speed because it slows down the whole program. so what I
;		did was setting a number of times that the movement will happen once each number of times, for example,
;		I decided that I wanna divide the pong's speed by 4, so I wrote a code that will make the pong to move one pixel
;		each 4 presses instead of 1. I saw that it worked well so I did the same this with the ball.
;------------------------------------------------------------ONE PLAYER PONG END---------------------------------------------------------->

;------------------------------------------------------------TWO PLAYERs PONG START-------------------------------------------------------->
proc TwoPlayersPong
	mov [byte ptr player1Points], 0
	mov [byte ptr player2Points], 0
@@gameStart:
	mov ah, 11
	mov al, 5
	push ax
	push offset startGame
	call PrintMsg
@@waitForEnter:	
	xor ax, ax ;needs to be 0 for the int 16h
	int 16h
	cmp ah, 1
	je_f @@exitMainLoop
	cmp ah, enter_key
	jne @@waitForEnter
	call ClearScreen_pong
;---Set Up--->	
	mov [word ptr ballX], 160 - ball_width/2
	mov [word ptr ballY], 100 - ball_height/2
	mov [byte ptr ballSpeed], 14
	mov [word ptr player1Y], 100 - player_height / 2
	mov [word ptr player2Y], 100 - player_height / 2
	mov [byte ptr neededMoves], 0
	mov [byte ptr pongHitCounter], 0
	mov [byte ptr up_IsPressed], 0
	mov [byte ptr down_IsPressed], 0
	mov [byte ptr w_IsPressed], 0
	mov [byte ptr s_IsPressed], 0
	xor dx, dx
;------------>	
	call PrintBorders_2Players
@@mainLoop:
;---Print Player1--->
	push offset player
	push [player1X]
	push [player1Y]
	push player_height
	push player_width
	call PrintShape_pong
;------------------->
;---Print Player2--->
	push offset player
	push [player2X]
	push [player2Y]
	push player_height
	push player_width
	call PrintShape_pong
;------------------->
	push 2
	call CheckIfBallTouchesWalls
	
	push 6000
	call DowngradeFps
	
	push dx
	call MoveBall
	inc dx
;---Print Ball--->
	push offset ball
	push [ballX]
	push [ballY]
	push ball_height
	push ball_width
	call PrintShape_pong
;---------------->
	call DrawMidLine
	call PrintScore
	call SetBallSpeed_player1
	call SetBallSpeed_player2
	
	call CheckInput_pong
	dec al
	jz @@exitMainLoop
;	cmp [byte ptr numOfBallMoves], 0
;	jne @@dontIncDx
;	inc dx
@@dontIncDx:	
;----Check if player 2 missed---->
	cmp [word ptr ballX], 12
	jne @@player1DidntMakePoint
	inc [byte ptr player1Points]
	jmp @@playerMadePoint
@@player1DidntMakePoint:	
;-------------------------------->
;----Check if player 1 missed---->
	cmp [word ptr ballX], 300
	jne @@player2DidntMakePoint
	inc [byte ptr player2Points]
	jmp @@playerMadePoint
@@player2DidntMakePoint:	
;-------------------------------->
	jmp @@mainLoop
@@playerMadePoint:
	cmp [byte ptr player2Points], 7
	je @@gameOver
	cmp [byte ptr player1Points], 7
	je @@gameOver
	jmp @@gameStart
	
;when game is over
@@gameOver:
	call PrintScore
	mov ah, 11
	cmp [byte ptr player2Points], 7
	jne @@player1Wins
	mov al, 8
	jmp @@skipPlayer1
@@player1Wins:
	mov al, 25
@@skipPlayer1:
	push ax
	push offset winnerMsg
	call PrintMsg
@@waitForEnter_GameOver:
	xor ax, ax
	int 16h
	cmp ah, enter_key
	je @@exitMainLoop
	dec ah
	jz @@exitMainLoop
	jmp @@waitForEnter_GameOver
@@exitMainLoop:
	call ClearScreen_pong
	ret
endp TwoPlayersPong
;------------------------------------------------------------TWO PLAYERs PONG END---------------------------------------------------------->
