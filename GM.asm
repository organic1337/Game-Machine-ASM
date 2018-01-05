;-----------MACROS-------------
jne_f macro lbl
        local skip
        je skip
        jmp lbl
skip:
endm

je_f macro lbl
        local skip
        jne skip
        jmp lbl
skip:
endm

jb_f macro lbl
        local skip
        jae skip
        jmp lbl
skip:
endm

ja_f macro lbl
        local skip
        jbe skip
        jmp lbl
skip:
endm

DelayProgram_m macro
		push 10
		call DelayProgram_pong
endm
;------------------------------

IDEAL
MODEL small
STACK 100h
;---Game Files--->
include "snkfnl.asm"
include "brkfnl.asm"
include "pongfnl.asm"
;---------------->
DATASEG
;---Data for bmp reading--->
;-file names->
mainMnuImg 	db 'MainMnu.bmp',0
snkMnuImg	db 'SnkMnu.bmp',0
snkInfImg	db 'SnkInf.bmp',0
snkLostImg	db 'SnkLost.bmp',0
pongMnuImg	db 'PongMnu.bmp',0
pongInfImg	db 'PongInf.bmp',0
brkMnuImg	db 'BrkMnu.bmp',0
brkInfImg	db 'BrkInf.bmp',0
brkLostImg	db 'BrkLost.bmp',0
;------------>

filehandle 	dw ?
Header 		db 54 dup (0)
Palette 	db 256*4 dup (0)
ScrLine 	db 320 dup (0)
ErrorMsg 	db 'Error', 13, 10,'$'
;--------------------------->
;----Messages---->
brkoutOverMsg	db 'you have reached level $'
snkLengthMsg	db 'your length was $'
;---------------->

;--------KEYS-------->
enter_key 	equ 28
i_key 		equ 23
one_key		equ 2
two_key		equ 3
three_key	equ 4
;-------------------->
CODESEG
;==========================READ BMP FILE=============================>
; - Credit: Barak Gonen. Gvahim asm book.
proc OpenFile ;file name offset as a parameter
; Open file
	push bp
	mov bp, sp
	mov ah, 3Dh
	xor al, al
	mov dx, [bp + 4]
	int 21h
	jc openerror
	mov [filehandle], ax
	pop bp
	ret 2
openerror:
	mov dx, offset ErrorMsg
	mov ah, 9h
	int 21h
	pop bp
	ret 2
endp OpenFile

proc CloseFile
mov ah,3Eh
mov bx, [filehandle]
int 21h
ret
endp CloseFile

proc ReadHeader
; Read BMP file header, 54 bytes
	mov ah,3fh
	mov bx, [filehandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	ret
endp ReadHeader

proc ReadPalette
; Read BMP file color palette, 256 colors * 4 bytes (400h)
	mov ah,3fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	ret
endp ReadPalette

proc CopyPal
; Copy the colors palette to the video memory
; The number of the first color should be sent to port 3C8h
; The palette is sent to port 3C9h
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h
	mov al,0
; Copy starting color to port 3C8h
	out dx,al
; Copy palette itself to port 3C9h
	inc dx
PalLoop:
; Note: Colors in a BMP file are saved as BGR values rather than RGB.
	mov al,[si+2] ; Get red value.
	shr al,2 ; Max. is 255, but video palette maximal
; value is 63. Therefore dividing by 4.
	out dx,al ; Send it.
	mov al,[si+1] ; Get green value.
	shr al,2
	out dx,al ; Send it.
	mov al,[si] ; Get blue value.
	shr al,2
	out dx,al ; Send it.
	add si,4 ; Point to next color.
; (There is a null chr. after every color.)
	loop PalLoop
	ret
endp CopyPal

proc CopyBitmap
; BMP graphics are saved upside-down.
; Read the graphic line by line (200 lines in VGA format),
; displaying the lines from bottom to top.
	mov ax, 0A000h
	mov es, ax
	mov cx,200
	PrintBMPLoop:
	push cx
; di = cx*320, point to the correct screen line
	mov di,cx
	shl cx,6
	shl di,8
	add di,cx
	; Read one line
	mov ah,3fh
	mov cx,320
	mov dx,offset ScrLine
	int 21h
; Copy one line into video memory
	cld ; Clear direction flag, for movsb
	mov cx,320
	mov si,offset ScrLine

	rep movsb ; Copy line to the screen
 ;rep movsb is same as the following code:
 ;mov es:di, ds:si
 ;inc si
 ;inc di
 ;dec cx
 ;loop until cx=0
	pop cx
	loop PrintBMPLoop
	ret
endp CopyBitmap


proc PrintBmp ;offset of file name as a parameter
; Process BMP file
;---Used Registers--->
	push ax bx cx dx si di es
;-------------------->
	push bp
	mov bp, sp
	push [bp + 18]
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
	pop bp
;---Used Registers--->
	pop es di si dx cx bx ax
;-------------------->
	ret 2
endp PrintBmp
;========================END OF READ BMP=============================>

;=====Procedure Start======>
; - Parameters: None.
; - Action: opening the breakout game
proc PlayBreakout
@@procStart:
;--Print Menu-->
	push offset brkMnuImg
	call PrintBmp
;-------------->
	DelayProgram_m
;----Wait for key press---->
@@waitForKeyPress:
	in al, 60h
	cmp al, enter_key
	jne @@notEnter
;in case enter is pressed
;-Reset Palette->
	mov ax, 3
	int 10h
	mov ax, 13h
	int 10h
;--------------->
	call Breakout
;when game over
	push offset brkLostImg
	call PrintBmp
	mov ah, 15	;line
	mov al, 8	;column
	push ax
	push offset brkoutOverMsg
	call PrintMsg
	call PrintLevelNum
	DelayProgram_m ;delay so the key will not longer be pressed
@@waitForEsc1:
	in al, 60h
	dec al
	jnz @@waitForEsc1
	jmp @@procStart
@@notEnter:
	
	
	cmp al, i_key
	jne @@notI
;in case I pressed
	push offset brkInfImg
	call PrintBmp

@@waitForEsc2:
	in al, 60h
	dec al
	jnz @@waitForEsc2
	jmp @@procStart
@@notI:

	dec al
	jnz @@waitForKeyPress
	
@@endOfProc:	
	ret
endp PlayBreakout
;=====End of Procedure=====>


;=====Procedure Start======>
; - Parameters: none.
; - Action: opening snake game
proc PlaySnake
;---Used Registers--->
	push ax dx
;-------------------->
@@procStart:

;Print Menu
	push offset snkMnuImg
	call PrintBmp
	
	DelayProgram_m
@@waitForKeyPress:
	in al, 60h
	
;--Check If I pressed-->	
	cmp al, i_key
	jne @@notI
;in case I pressed
	push offset snkInfImg
	call PrintBmp
@@waitForEsc1:	
	in al, 60h
	dec al
	jnz @@waitForEsc1
	jmp @@procStart
@@notI:
;---------------------->

;--Check if 1, 2 or 3 pressed-->
	cmp al, three_key
	ja @@not123
	cmp al, 1
	je @@endOfProc	

	
	mov dx, 4
	dec al
	sub dl, al
	push dx
;reset palette
	mov ax, 3h
	int 10h
	mov ax, 13h
	int 10h
	
	call Snake
;when game is over
	push offset snkLostImg
	call PrintBmp
	
;-Print Size of snake->
	mov ah, 15
	mov al, 10
	push ax
	push offset snkLengthMsg
	call PrintMsg
	inc [word ptr LengthOfSnake] ;the length does not include the head
	push [LengthOfSnake]
	call PrintHexValue
;--------------------->
	DelayProgram_m ;delay so the key will not longer be pressed
@@waitForEsc2:
	in al, 60h
	dec al
	jnz @@waitForEsc2
	jmp @@procStart
@@not123:
;----------------------------->
	jmp @@waitForKeyPress
@@endOfProc:
;---Used Registers--->
	pop dx ax
;-------------------->
	ret
endp PlaySnake
;=====End of procedure=====>


;=====Procedure start======>
; - Parameters: none
; - Actio: opening pong game
proc PlayPong
;---Used Registers--->
	push ax
;-------------------->
	
@@procStart: ;Print pong menu
	push offset pongMnuImg
	call PrintBmp
	
	DelayProgram_m ;delay so the key will not longer be pressed
@@waitForKeyPress:
	in al, 60h
;--Check if I pressed-->
	cmp al, i_key
	jne @@notI
;in case I pressed
	push offset pongInfImg
	call PrintBmp
@@waitForEsc1:	
	in al, 60h
	dec al
	jnz @@waitForEsc1
	jmp @@procStart
@@notI:
;---------------------->

;--Check if 1 pressed-->
	cmp al, one_key
	jne @@not1
;in case 1 pressed
;Reset Palette
	mov ax, 3h
	int 10h
	mov ax, 13h
	int 10h
	
	call OnePlayerPong
	jmp @@procStart
@@not1:
;---------------------->

;--Check if 2 pressed-->
	cmp al, two_key
	jne @@not2
;in case 2 pressed
;Reset Palette
	mov ax, 3h
	int 10h
	mov ax, 13h
	int 10h
	
	call TwoPlayersPong
	jmp @@procStart
@@not2:
;---------------------->

	dec al
	jnz @@waitForKeyPress

@@endOfProc:
;---Used Registers--->
	pop ax
;-------------------->
	ret
endp PlayPong
;=====End of procedure=====>
;===================Main Game Procedure=================>
; - Parameters: none
proc GameMachine
@@procStart:
;---Print main menu--->
	push offset mainMnuImg
	call PrintBmp
;--------------------->
	DelayProgram_m
;--------Get key from keyboard---------->
@@waitForKeyPress:
	in al, 60h

;--check if 1 pressed-->	
	cmp al, one_key
	jne @@notBreakout
	call PlayBreakout
	jmp @@procStart
@@notBreakout:
;---------------------->	

;--check if 2 pressed-->	
	cmp al, two_key
	jne @@notSnake
	call PlaySnake
	jmp @@procStart
@@notSnake:
;---------------------->	

;--check if 3 pressed-->	
	cmp al, three_key
	jne @@notPong	
	call PlayPong
	jmp @@procStart
@@notPong:
;---------------------->	

	dec al
	jnz @@waitForKeyPress
@@endOfProc:
	ret
endp GameMachine
;===================Main Game Procedure=================>
start:
	mov ax, @data
	mov ds, ax

	mov ax, 13h
	int 10h
	
	call GameMachine
	
	mov ax, 3h
	int 10h
		
	
	
	
exit:
	mov ax, 4c00h
	int 21h
	END start