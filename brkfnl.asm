
IDEAL
MODEL small
STACK 100h
DATASEG

;---the arenas--->
arena db 25*20 dup(?)   ;the arena itself


arena1_origin   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,46,13,32,40,42,11,44,44,11,42,40,32,13,46,0,0,0
        db 0,0,34,46,13,32,40,42,11,44,44,11,42,40,32,13,46,34,0,0
        db 0,44,34,46,13,32,40,42,11,44,44,11,42,40,32,13,46,34,44,0
        db 0,0,34,46,13,32,40,42,11,44,44,11,42,40,32,13,46,34,0,0
        db 0,0,0,46,13,32,40,42,11,44,44,11,42,40,32,13,46,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


arena2_origin   db 44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44
        db 44,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,44
        db 44,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,44
        db 44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44
        db 44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44
        db 44,0,42,42,42,42,0,40,40,40,40,40,40,0,42,42,42,42,0,44
        db 44,0,42,42,42,42,0,40,32,32,32,32,40,0,42,42,42,42,0,44
        db 44,0,42,42,42,42,0,40,32,13,13,32,40,0,42,42,42,42,0,44
        db 44,0,42,42,42,42,0,40,32,46,46,32,40,0,42,42,42,42,0,44
        db 44,0,42,42,42,42,0,40,32,46,46,32,40,0,42,42,42,42,0,44
        db 44,0,42,42,42,42,0,40,32,13,13,32,40,0,42,42,42,42,0,44
        db 44,0,0,0,0,0,0,40,32,32,32,32,40,0,0,0,0,0,0,44
        db 44,0,0,0,0,0,0,40,40,40,40,40,40,0,0,0,0,0,0,44
        db 44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44
        db 34,34,34,34,0,0,0,0,0,0,0,0,0,0,0,0,34,34,34,34
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


arena3_origin   db 40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40
        db 40,11,11,11,11,11,11,13,13,13,13,13,13,11,11,11,11,11,11,40
        db 40,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,40
        db 40,11,0,0,44,44,0,0,0,0,0,0,0,0,44,44,0,0,11,40
        db 40,11,0,0,44,44,0,0,0,0,0,0,0,0,44,44,0,0,11,40
        db 40,11,0,0,44,44,0,0,0,0,0,0,0,0,44,44,0,0,11,40
        db 40,11,0,0,44,44,0,0,0,0,0,0,0,0,44,44,0,0,11,40
        db 40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40
        db 40,0,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44,0,40
        db 40,0,0,44,0,0,0,0,0,0,0,0,0,0,0,0,44,0,0,40
        db 40,0,0,0,44,0,0,0,0,0,0,0,0,0,0,44,0,0,0,40
        db 40,0,0,0,0,44,44,44,44,44,44,44,44,44,44,0,0,0,0,40
        db 40,0,0,0,0,0,0,0,0,13,13,0,0,0,0,0,0,0,0,40
        db 40,40,40,40,40,40,40,40,40,13,13,40,40,40,40,40,40,40,40,40
        db 0,0,0,0,0,0,0,0,0,13,13,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,13,13,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


arena4_origin   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0
        db 0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,40,40,40,40,11,40,40,40,40,0,0,0,0,0,0
        db 0,0,0,0,32,32,32,32,32,11,32,32,32,32,32,0,0,0,0,0
        db 42,42,42,42,42,42,42,42,42,11,42,42,42,42,42,42,42,42,42,42
        db 0,0,0,0,32,32,32,32,32,11,32,32,32,32,32,0,0,0,0,0
        db 0,0,0,0,0,40,40,40,40,11,40,40,40,40,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0
        db 0,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,0
        db 0,0,0,0,0,0,13,13,13,13,13,13,13,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0



arena5_origin   db 0,0,0,0,0,0,44,0,0,0,0,44,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,44,0,0,0,0,44,0,0,0,0,0,0,0,0
        db 0,0,0,44,44,44,44,44,44,44,44,44,44,44,44,0,0,0,0,0
        db 0,0,0,0,0,0,44,42,42,42,42,44,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,44,42,40,40,42,44,0,0,0,0,0,0,0,0
        db 0,0,0,44,44,44,44,42,40,40,42,44,44,44,44,0,0,0,0,0
        db 0,0,0,0,0,0,44,42,40,40,42,44,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,44,42,40,40,42,44,0,0,0,0,0,0,0,0
        db 0,0,0,44,44,44,44,42,42,42,42,44,44,44,44,0,0,0,0,0
        db 0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,44,0,0,0,44,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,44,0,0,0,44,0,0,0,0,0,0,0,0
        db 32,11,32,11,32,11,0,44,0,0,0,44,0,32,11,32,11,32,11,32
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


arena6_origin   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 46,34,46,34,46,34,46,34,46,34,46,34,46,34,46,34,46,34,46,34
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 11,0,0,0,0,0,0,0,32,32,32,32,0,0,0,0,0,0,0,11
        db 11,0,0,0,0,0,0,32,32,11,11,32,32,0,0,0,0,0,0,11
        db 11,0,0,0,0,0,32,32,32,11,11,32,32,32,0,0,0,0,0,11
        db 11,0,0,0,0,0,32,32,32,11,11,32,32,32,0,0,0,0,0,11
        db 11,0,0,0,0,0,0,32,32,11,11,32,32,0,0,0,0,0,0,11
        db 11,0,0,0,0,0,0,0,32,32,32,32,0,0,0,0,0,0,0,11
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 46,34,46,34,46,34,46,34,46,34,46,34,46,34,46,34,46,34,46,34
        db 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


arena7_origin   db 34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 42,42,42,42,40,42,42,42,40,42,42,42,40,42,42,42,40,42,42,42
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 42,42,42,42,40,42,42,42,40,42,42,42,40,42,42,42,40,42,42,42
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 0,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0,40,0,0,0
        db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena8_origin   db 46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 44,11,44,11,44,11,44,11,44,11,44,11,44,11,44,11,44,11,44,11
        db 11,44,11,44,11,44,11,44,11,44,11,44,11,44,11,44,11,44,11,44
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 32,34,32,34,32,34,32,34,32,34,32,34,32,34,32,34,32,34,32,34
        db 34,32,34,32,34,32,34,32,34,32,34,32,34,32,34,32,34,32,34,32
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 13,13,13,13,13,13,0,0,0,0,0,0,0,0,13,13,13,13,13,13
        db 13,13,13,13,13,13,0,0,0,0,0,0,0,0,13,13,13,13,13,13
        db 13,13,13,13,13,13,0,0,0,0,0,0,0,0,13,13,13,13,13,13
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena9_origin   db 40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40
        db 40,0,0,0,0,0,40,0,0,0,0,0,0,40,0,0,0,0,0,40
        db 40,0,0,0,0,0,40,0,0,0,0,0,0,40,0,0,0,0,0,40
        db 40,0,44,44,44,44,40,0,0,0,0,0,0,40,44,44,44,44,0,40
        db 40,0,46,46,46,46,40,0,0,0,0,0,0,40,46,46,46,46,0,40
        db 40,0,34,34,34,34,40,0,0,0,0,0,0,40,34,34,34,34,0,40
        db 40,0,48,48,48,48,40,0,0,0,0,0,0,40,48,48,48,48,0,40
        db 40,0,32,32,32,32,40,0,0,0,0,0,0,40,32,32,32,32,0,40
        db 40,0,42,42,42,42,40,40,40,40,40,40,40,40,42,42,42,42,0,40
        db 40,0,11,11,11,11,40,0,0,0,0,0,0,40,11,11,11,11,0,40
        db 40,0,13,13,13,13,40,0,0,0,0,0,0,40,13,13,13,13,0,40
        db 40,0,0,0,0,0,40,0,0,0,0,0,0,40,0,0,0,0,0,40
        db 40,0,0,0,0,0,40,0,0,0,0,0,0,40,0,0,0,0,0,40
        db 40,0,0,0,0,0,40,0,0,0,0,0,0,40,0,0,0,0,0,40
        db 40,40,40,40,40,0,40,0,0,0,0,0,0,40,0,40,40,40,40,40
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena10_origin  db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
        db 40,40,40,40,40,40,40,40,0,0,0,0,40,40,40,40,40,40,40,40
        db 42,42,42,42,42,42,42,0,0,0,0,0,0,42,42,42,42,42,42,42
        db 11,11,11,11,11,11,0,0,0,0,0,0,0,0,11,11,11,11,11,11
        db 46,46,46,46,46,0,0,0,0,0,0,0,0,0,0,46,46,46,46,46
        db 13,13,13,13,0,0,0,0,0,0,0,0,0,0,0,0,13,13,13,13
        db 40,40,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40,40,40
        db 34,34,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,34
        db 34,34,34,34,34,34,0,0,0,0,0,0,0,0,34,34,34,34,34,34
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 44,44,44,44,44,44,0,0,0,0,0,0,0,0,44,44,44,44,44,44
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,48,48,48,48,48,48,48,48,48,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena11_origin  db 44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44
        db 44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44
        db 44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44
        db 44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44
        db 44,0,0,0,0,0,42,11,42,11,42,11,42,11,0,0,0,0,0,44
        db 44,0,0,0,0,0,11,42,11,42,11,42,11,42,0,0,0,0,0,44
        db 44,0,0,0,0,0,42,11,42,11,42,11,42,11,0,0,0,0,0,44
        db 44,0,0,0,0,0,11,42,11,42,11,42,11,42,0,0,0,0,0,44
        db 0,0,0,0,0,0,42,11,42,11,42,11,42,11,0,0,0,0,0,0
        db 0,0,0,0,0,0,11,42,11,42,11,42,11,42,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 32,32,32,32,32,32,32,32,32,0,0,32,32,32,32,32,32,32,32,32
        db 13,13,13,13,13,13,13,13,13,0,0,13,13,13,13,13,13,13,13,13
        db 46,46,46,46,46,46,46,46,46,0,0,46,46,46,46,46,46,46,46,46
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena12_origin  db 42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42
        db 42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,42
        db 42,0,0,48,48,48,48,48,48,48,48,48,48,48,48,48,48,0,0,42
        db 42,0,0,34,34,34,34,34,34,34,34,34,34,34,34,34,34,0,0,42
        db 42,0,0,46,46,46,0,0,0,0,0,0,0,0,46,46,46,0,0,42
        db 42,0,0,13,13,13,0,0,0,0,0,0,0,0,13,13,13,0,0,42
        db 42,0,0,32,32,32,0,0,0,0,0,0,0,0,32,32,32,0,0,42
        db 42,0,0,40,40,40,0,0,0,0,0,0,0,0,40,40,40,0,0,42
        db 42,0,0,11,11,11,0,0,0,0,0,0,0,0,11,11,11,0,0,42
        db 42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,42
        db 42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,42
        db 42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,42
        db 42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,42
        db 42,0,0,0,0,0,46,46,46,46,46,46,46,46,0,0,0,0,0,42
        db 42,0,0,0,0,0,46,46,46,46,46,46,46,46,0,0,0,0,0,42
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena13_origin  db 0,0,0,0,0,0,42,0,0,0,0,0,0,42,0,0,0,0,0,0
        db 0,0,0,0,0,0,42,0,0,0,0,0,0,42,0,0,0,0,0,0
        db 0,0,0,0,0,0,42,0,0,0,0,0,0,42,0,0,0,0,0,0
        db 0,0,0,0,0,0,42,0,0,0,0,0,0,42,0,0,0,0,0,0
        db 0,0,0,44,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0,0
        db 0,0,0,11,0,0,0,0,0,0,0,0,0,0,0,0,11,0,0,0
        db 0,0,0,11,0,0,0,0,0,0,0,0,0,0,0,0,11,0,0,0
        db 0,0,0,11,0,0,0,0,0,0,0,0,0,0,0,0,11,0,0,0
        db 0,0,0,11,0,0,40,40,40,40,40,40,40,40,0,0,11,0,0,0
        db 0,0,0,11,0,0,40,40,40,40,40,40,40,40,0,0,11,0,0,0
        db 0,0,0,11,0,0,40,40,40,40,40,40,40,40,0,0,11,0,0,0
        db 0,0,0,11,0,0,40,40,40,40,40,40,40,40,0,0,11,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 32,32,32,32,32,32,0,0,0,0,0,0,0,0,32,32,32,32,32,32
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena14_origin  db 42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0,0
        db 0,0,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,0,0,0
        db 0,0,46,46,46,46,46,0,0,0,0,0,46,46,46,46,46,0,0,0
        db 0,0,34,34,34,34,34,0,0,0,0,0,34,34,34,34,34,0,0,0
        db 0,0,48,48,48,48,48,0,0,0,0,0,48,48,48,48,48,0,0,0
        db 0,0,13,13,13,13,13,0,0,0,0,0,13,13,13,13,13,0,0,0
        db 0,0,32,32,32,32,32,0,0,0,0,0,32,32,32,32,32,0,0,0
        db 0,0,40,40,40,40,40,0,0,0,0,0,40,40,40,40,40,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,42,42,42,42,42,0,0,0,0,0,42,42,42,42,42,42,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

arena15_origin  db 13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13
        db 0,0,0,0,0,0,0,44,0,0,0,0,44,0,0,0,0,0,0,0
        db 0,0,11,11,11,0,0,44,0,0,0,0,44,0,0,11,11,11,0,0
        db 0,0,42,42,42,0,0,44,0,0,0,0,44,0,0,42,42,42,0,0
        db 0,0,11,11,11,0,0,44,0,0,0,0,44,0,0,11,11,11,0,0
        db 0,0,42,42,42,0,0,44,0,0,0,0,44,0,0,42,42,42,0,0
        db 0,0,11,11,11,0,0,44,0,0,0,0,44,0,0,11,11,11,0,0
        db 0,0,42,42,42,0,0,44,0,0,0,0,44,0,0,42,42,42,0,0
        db 0,0,11,11,11,0,0,44,0,0,0,0,44,0,0,11,11,11,0,0
        db 0,0,42,42,42,0,0,44,0,0,0,0,44,0,0,42,42,42,0,0
        db 0,0,11,11,11,0,0,44,0,0,0,0,44,0,0,11,11,11,0,0
        db 0,0,42,42,42,0,0,44,0,0,0,0,44,0,0,42,42,42,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,40,40,40,40,40,40,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0




;Arena Data:
arena_height    equ 25
arena_width     equ 20
;---------------->

;---Heart--->
heart   db 0,0,4,4,0,0,0,4,4,0,0
    db 0,4,4,4,4,0,4,4,4,4,0
    db 4,4,4,4,4,4,4,4,4,4,4
    db 4,4,4,4,4,4,4,4,4,4,4
    db 0,4,4,4,4,4,4,4,4,4,0
    db 0,0,4,4,4,4,4,4,4,0,0
    db 0,0,0,4,4,4,4,4,0,0,0
    db 0,0,0,0,4,4,4,0,0,0,0
    db 0,0,0,0,0,4,0,0,0,0,0

heart_width     equ 11
heart_height    equ 9
;----------->


;---Player Shape--->
player_breakout db 54*7 dup (15)
;------------------>

;---Ball Shape--->
ball_breakout    db 0,0,15,15,15,15,0,0
    db 0,15,15,15,15,15,15,0
    db 15,15,15,15,15,15,15,15
    db 15,15,15,15,15,15,15,15
    db 15,15,15,15,15,15,15,15
    db 15,15,15,15,15,15,15,15
    db 0,15,15,15,15,15,15,0
    db 0,0,15,15,15,15,0,0
;---------------->

;---Stone data--->
    stone_height    equ 6
    stone_width         equ 14
;---------------->

;---ball shape data--->
    ball_width_breakout     equ 8
    ball_height_breakout    equ 8

    ballX_breakout  dw 160
    ballY_breakout  dw 100

    numOfBallMoves_breakout     db ?
    neededBallMoves_breakout    db ?
    ballSpeed_breakout          db ?
;----------------------->

;---Player shape data--->
    player_breakout_height_breakout     equ 7
    player_breakout_width_breakout  equ 54

    player_breakoutX_breakout       dw ?
    player_breakoutY_breakout       dw ?

    numOfPlayerMoves_breakout       db ?
    neededPlayerMoves_breakout      db ?

    level       db ?
    numOfLives      db ?
;----------------------->

;---Keys--->
    enter_key       equ 28
    left_key    equ 75
    right_key       equ 77


    left_IsPressed_breakout     db ?
    right_IsPressed_breakout  db ?
;---------->

;---Messages--->
pressToStart db 'press any key to start...$'
livesMsg     db 'Lives:$'
levelMsg     db 'Level:$'
breakoutMsg      db '<-Breakout->$'
;-------------->

CODESEG
;-----Procedure Start------>
; - Parameters: none.
; - Action: moves the arenas to temporary buffer
;           that will show on screen. this procedure
;           was made to make sure that the user can
;           play over and over again all the arenas
proc LoadArena
;---Used Registers--->
    push si di es
;-------------------->


    cmp [byte ptr level], 1
    jne @@levelNot1
;in case levelIs1
    mov si, offset arena1_origin
    jmp @@skipChecking
@@levelNot1:
    cmp [byte ptr level], 2
    jne @@levelNot2
;in case levelIs2
    mov si, offset arena2_origin
    jmp @@skipChecking
@@levelNot2:
    cmp [byte ptr level], 3
    jne @@levelNot3
;in case levelIs3
    mov si, offset arena3_origin
    jmp @@skipChecking
@@levelNot3:
    cmp [byte ptr level], 4
    jne @@levelNot4
;in case levelIs4
    mov si, offset arena4_origin
    jmp @@skipChecking
@@levelNot4:
    cmp [byte ptr level], 5
    jne @@levelNot5
;in case levelIs5
    mov si, offset arena5_origin
    jmp @@skipChecking
@@levelNot5:
    cmp [byte ptr level], 6
    jne @@levelNot6
;in case levelIs6
    mov si, offset arena6_origin
    jmp @@skipChecking
@@levelNot6:
    cmp [byte ptr level], 7
    jne @@levelNot7
;in case levelIs7
    mov si, offset arena7_origin
    jmp @@skipChecking
@@levelNot7:
    cmp [byte ptr level], 8
    jne @@levelNot8
;in case levelIs8
    mov si, offset arena8_origin
    jmp @@skipChecking
@@levelNot8:
    cmp [byte ptr level], 9
    jne @@levelNot9
;in case levelIs9
    mov si, offset arena9_origin
    jmp @@skipChecking
@@levelNot9:
    cmp [byte ptr level], 10
    jne @@levelNot10
;in case levelIs10
    mov si, offset arena10_origin
    jmp @@skipChecking
@@levelNot10:
    cmp [byte ptr level], 11
    jne @@levelNot11
;in case levelIs11
    mov si, offset arena11_origin
    jmp @@skipChecking
@@levelNot11:
    cmp [byte ptr level], 12
    jne @@levelNot12
;in case levelIs12
    mov si, offset arena12_origin
    jmp @@skipChecking
@@levelNot12:
    cmp [byte ptr level], 13
    jne @@levelNot13
;in case levelIs13
    mov si, offset arena13_origin
    jmp @@skipChecking
@@levelNot13:
    cmp [byte ptr level], 14
    jne @@levelNot14
;in case levelIs14
    mov si, offset arena14_origin
    jmp @@skipChecking
@@levelNot14:
    cmp [byte ptr level], 15
    jne @@levelNot15
;in case levelIs15
    mov si, offset arena15_origin
    jmp @@skipChecking
@@levelNot15:

@@skipChecking:
;------------------------->

    mov di, offset arena    ;di holds the Destination Index
    push ds
    pop es

    mov cx, arena_height*arena_width
    rep movsb

;---Used Registers--->
    pop es di si
;-------------------->
    ret
endp LoadArena
;-----End of procedure----->
;-----Procedure Start------>
; - Parameters: none
; - Action: deletes player_breakout's trail
; **must be put AFTER drawing the player_breakout**
proc DeletePlayerTrail_breakout
;---Used Registers--->
    push ax bx cx dx
;-------------------->

;--Check If player_breakout goes right-->
    cmp [byte ptr right_IsPressed_breakout], 1
    jne @@notGoingRight
;In case the player_breakout goes right
    mov dx, [player_breakoutY_breakout] ;Y coordinates
    mov ah, 0ch ;prints pixel to screen
    mov bl, 0 ;0 = wanted page
    mov al, 0 ;0 = wanted color in palette = black
    mov cx, player_breakout_height_breakout
@@deleteLeftLine:
    push cx
    mov cx, [player_breakoutX_breakout] ;X coordinates
    dec cx
    int 10h
    inc dx
    pop cx
    loop @@deleteLeftLine
    jmp @@endOfProc
@@notGoingRight:
;------------------------------>

;--Check If player_breakout goes left-->
    cmp [byte ptr left_IsPressed_breakout], 1
    jne @@notGoingLeft
;In case the player_breakout goes right
    mov dx, [player_breakoutY_breakout] ;Y coordinates
    mov ah, 0ch ;prints pixel to screen
    mov bl, 0 ;0 = wanted page
    mov al, 0 ;0 = wanted color in palette = black
    mov cx, player_breakout_height_breakout
@@deleteRightLine:
    push cx
    mov cx, [player_breakoutX_breakout] ;X coordinates
    add cx, player_breakout_width_breakout
    int 10h
    inc dx
    pop cx
    loop @@deleteRightLine
    jmp @@endOfProc
@@notGoingLeft:
;----------------------------->

@@endOfProc:
;---Used Registers--->
    pop dx cx bx ax
;-------------------->
    ret
endp DeletePlayerTrail_breakout
;-----End of procedure----->





;-----Procedure Start------>
; - Parameters: x,y,color
; - action: prints block
proc PrintBlock
;---Used Registers--->
    push ax cx si di es
;------------------->
    push bp
    mov bp, sp
    sub sp, 2

    blockColor      equ [word ptr bp + 14]
    blockY      equ [word ptr bp + 16]
    blockX      equ [word ptr bp + 18]
    startPixel      equ [word ptr bp - 2]

;-VGA->
    push 0A000h
    pop es
;----->
;initialize position
    shl blockX, 4   ;multiply by 16
    shl blockY, 3   ;multiply by 8

;--Print first line-->
    mov di, blockX
    shl blockY, 6   ;multiply by 64
    mov ax, blockY
    shl ax, 2       ;multiply by 256
    add ax, blockY  ;y*64 + y*256 = 320*y
    add di, ax      ;di holds the exact position
    mov startPixel, di

    xor al, al ;wanted color - black
    mov cx, stone_width + 2 ;+ 2 edges
    rep stosb
;-------------------->

    mov di, startPixel
    add di, stone_width + 2
    mov cx, stone_height
@@printingLoop:
    push cx ;must save the date for the loop
;---Print First Pixel--->
    sub di, stone_width + 2
    add di, 320
    mov [byte ptr es:di], 0
    inc di
;----------------------->
;---Print line from the block--->
    mov cx, stone_width
    mov ax, blockColor
    rep stosb
;------------------------------->
;---Print lase pixel--->
    inc di
    mov [byte ptr es:di], 0
;---------------------->
    pop cx
    loop @@printingLoop

;--Print Last line-->
    mov cx, stone_width + 2 ;+ 2 edges
    xor al, al ;wanted color - black
    add di, 320

;------------------->
    add sp, 2
    pop bp
;---Used Registers--->
    pop es di si cx ax
;-------------------->

    ret 6
endp PrintBlock
;-----End of procedure----->





;-----Procedure start------>
; - Parameters: offset of arena.
; - action: prints the arena to the screen.
proc PrintArena
;---Used Registers--->
    push ax bx cx si
;-------------------->
    push bp
    mov bp, sp
    sub sp, 4
;Temporary variables
    xIndex_temp     equ [word ptr bp - 2]
    yIndex_temp     equ [word ptr bp - 4]

    mov xIndex_temp, 0 ;uses as an index
    mov yIndex_temp, 0 ;uses as an index

    mov bx, [bp + 12] ;bx holds the offset of the array
    xor si, si

    mov cx, arena_height
@@printArenaLoop:
    push cx ;must save the data in cx for the loop
    mov cx, arena_width
@@innerPrintLoop:
    cmp [byte ptr ds:bx + si], 0
    je @@skipPrintBlock
    push xIndex_temp    ;x
    push yIndex_temp    ;y
    mov al, [bx + si]
    push ax         ;color
    call PrintBlock
@@skipPrintBlock:
    inc si
    inc xIndex_temp
    loop @@innerPrintLoop
    mov xIndex_temp, 0 ;start from the beginning
    inc yIndex_temp ;move to next line
    pop cx ;recovers the data in cx for the loop operation
    loop @@printArenaLoop

    add sp, 4
    pop bp
;---Used Registers--->
    pop si cx bx ax
;-------------------->
    ret 2
endp PrintArena
;-----End of procedure----->




;-----Procedure start------>
; - Parameters: none.
; - Action: checks if the ball should change it's direction
proc ChangeDir
;---Used Registers--->
    push ax bx
;-------------------->

;---Check If ball hits Player--->
    mov ax, [ballY_breakout]
    add ax, ball_height_breakout
    cmp ax, [player_breakoutY_breakout]
    jne @@notHitsPlayer
    mov ax, [player_breakoutX_breakout]
    cmp ax, 2
    jb @@dontSubFromAx ;because if we sub from ax it will give us a very big unsigned number
    sub ax, 2 ;**dangerous**
@@dontSubFromAx:
    mov bx,[ballX_breakout]
    add bx, ball_width_breakout/2
    cmp bx, ax
    jb @@notHitsPlayer
    add ax, player_breakout_width_breakout + 4 ;**dangerout**
    mov bx, [ballX_breakout]
    add bx, ball_width_breakout/2
    cmp bx, ax
    ja @@notHitsPlayer
;In case ball hits player_breakout

    mov ax, [ballX_breakout] ;ax holds the X position of the ball comparing to the player_breakout
    add ax, ball_width_breakout/2
    mov bx, [player_breakoutX_breakout]
    sub ax, bx


;makes sure that's the result won't cause errors.
    jnc @@notBelow0
    mov [byte ptr ballSpeed_breakout], 9
    xor dx, dx
    jmp @@endOfProc
@@notBelow0:

    add ax, 3
    mov bl, 6
    div bl

;Checks the possible results
    cmp al, 1
    jnb @@resNot0
    mov [byte ptr ballSpeed_breakout], 9
    xor dx, dx
    jmp @@endOfProc
@@resNot0:
    cmp al, 9
    jna @@resNotAbv9
    mov [byte ptr ballSpeed_breakout], 1
    xor dx, dx
    jmp @@endOfProc
@@resNotAbv9:

;change the speed according to the position of the ball
    mov bl, 10
    sub bl, al
    mov [ballSpeed_breakout], bl
    xor dx, dx
    jmp @@endOfProc
@@notHitsPlayer:
;------------------------------->

;---Check If ball is in left edge--->
    cmp [ballX_breakout], 0
    jne @@notInLeftEdge
	cmp [byte ptr ballSpeed_breakout], 6
	jb @@notInLeftEdge
	
;In case the ball is in left edge
    cmp [byte ptr ballSpeed_breakout], 9
    ja @@speedAbove9_leftEdge
;In case speed is below 9
    mov al, 10
    sub al, [ballSpeed_breakout]
    mov [ballSpeed_breakout], al
    mov dl, [ballSpeed_breakout]
    xor dh, dh
    jmp @@endOfProc
@@speedAbove9_LeftEdge:
;in case speed is above 9
    mov al, 28
    sub al, [ballSpeed_breakout]
    mov [ballSpeed_breakout], al
    sub al, 9
    mov dl, al
    xor dh,dh
    jmp @@endOfProc
@@notInLeftEdge:
;----------------------------------->

;---Check If ball is in right edge--->
    cmp [word ptr ballX_breakout], 320 - ball_width_breakout
    jne @@notInRightEdge
;In case the ball is in right edge
    cmp [byte ptr ballSpeed_breakout], 9
    ja @@speedAbove9_RightEdge
;In case speed is below 9
    mov al, 10
    mov dl, [ballSpeed_breakout]
    xor dh, dh
    sub al, [ballSpeed_breakout]
    mov [ballSpeed_breakout], al
    jmp @@endOfProc
@@speedAbove9_RightEdge:
;in case speed is above 9
    mov al, 28
    sub al, [ballSpeed_breakout]
    sub [ballSpeed_breakout], 9
    mov dl, [ballSpeed_breakout]
    xor dh, dh
    mov [ballSpeed_breakout], al
    jmp @@endOfProc
@@notInRightEdge:
;----------------------------------->

;---Check If ball is in Top edge--->
    cmp [word ptr ballY_breakout], 0
    jne @@notInTopEdge
;In case the ball is in top edge
    add [byte ptr ballSpeed_breakout], 9
    xor dx, dx
    jmp @@endOfProc
@@notInTopEdge:
;----------------------------------->
@@endOfProc:
;---Used Registers--->
    pop bx ax
;-------------------->
    ret
endp ChangeDir
;-----End of procedure----->



;-----Procedure start------>
; - Parameters: offset of shape, x coordinates of player_breakout, y coordinates of player_breakout,
;           height of shape, width of shape
; - Action: Prints shape
proc PrintShape_breakout
;---Used Registers--->
    push ax bx cx dx si di
;-------------------->

    push bp
    mov bp, sp

    shape_width     equ [word ptr bp + 16]
    shape_height    equ [word ptr bp + 18]
    shape_y     equ [word ptr bp + 20]
    shape_x     equ [word ptr bp + 22]
    shape_offset    equ [word ptr bp + 24]


    mov ah, 0ch
    xor bl, bl

    xor di, di
    mov dx, shape_y
    mov cx, shape_height

@@printShapeLoop_breakout:
    push cx
    mov cx, shape_width
    xor si, si
@@innerPrintingLoop_breakout:
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
    loop @@innerPrintingLoop_breakout
    pop cx
    inc dx
    loop @@printShapeLoop_breakout

    pop bp
;---Used Registers--->
    pop di si dx cx bx ax
;-------------------->
    ret 10
endp PrintShape_breakout
;-----End of Procedure----->


;-----Procedure Start------>
; - Parameters: number of nops.
; - Action: delay program.
proc DelayPro
;---Used Registers--->
    push cx
;-------------------->
    push bp
    mov bp, sp
    mov cx, [bp + 6]
@@nopLoop:
    nop
    loop @@nopLoop
    pop bp
;---Used Registers--->
    pop cx
;-------------------->
    ret 2
endp DelayPro
;-----End Of procedure----->


;-----Procedure Start------>
; - Parameters: none.
; - Action: moves the player_breakout left.
proc MovePlayerLeft
    cmp [word ptr player_breakoutX_breakout], 0
    je @@skip
    dec [word ptr player_breakoutX_breakout]
    @@skip:
    ret
endp MovePlayerLeft
;-----End Of Procedure----->


;-----Procedure Start------>
; - Parameters: none.
; - Action: moves the player_breakout right.
proc MovePlayerRight
    cmp [word ptr player_breakoutX_breakout], 320 - player_breakout_width_breakout
    je @@skip
    inc [word ptr player_breakoutX_breakout]
    @@skip:
    ret
endp MovePlayerRight
;-----End Of Procedure----->


;-----Procedure Start------>
; - Parameters: None.
; - Action: checks input and acts accordingly
; - returns: input value in al.
proc CheckInput
;---Used Registers--->
    push bx
;-------------------->
    in al, 60h

;---Slows down the movement of the player_breakout--->
    mov bl, [neededPlayerMoves_breakout]
    cmp [numOfPlayerMoves_breakout], bl
    je @@startMoving
    inc [byte ptr numOfPlayerMoves_breakout]
    jmp @@endOfProc
@@startMoving:
    mov [byte ptr numOfPlayerMoves_breakout], 0
;------------------------------------------->
;---Check If Left Pressed--->
    cmp al, left_key
    jne @@notLeftPressed
;checks in keyboard buffer
    mov [byte ptr left_IsPressed_breakout], 1
@@notLeftPressed:
;--------------------------->
;---Check If Left Released--->
    mov bl, left_key
    or bl, 10000000B
    cmp al, bl
    jne @@notLeftReleased
;checks in keyboard buffer
    mov [byte ptr left_IsPressed_breakout], 0
@@notLeftReleased:
;--------------------------->

;---Check If Right Pressed--->
    cmp al, right_key
    jne @@notRightPressed
;checks in keyboard buffer
    mov [byte ptr right_IsPressed_breakout], 1
@@notRightPressed:
;--------------------------->
;---Check If Right Released--->
    mov bl, right_key
    or bl, 10000000B
    cmp al, bl
    jne @@notRightReleased
;checks in keyboard buffer
    mov [byte ptr right_IsPressed_breakout], 0
@@notRightReleased:
;--------------------------->


;---Check If Left--->
    cmp [byte ptr left_IsPressed_breakout], 1
    jne @@notLeft
    ;in case left key is pressed
    call MovePlayerLeft
@@notLeft:
;------------------->

;---Check If Up--->
    cmp [byte ptr right_IsPressed_breakout], 1
    jne @@notRight
    ;in case right key is pressed
    call MovePlayerRight
@@notRight:
;----------------->
@@endOfProc:
;---Used Registers--->
    pop bx
;-------------------->
    ret
endp CheckInput
;-----End Of Procedure----->



;-----Procedure Start------>
; - Parameters: ball x, ball y
; - action: deletes the trail of the ball
proc DeleteBallTrail_breakout
;---Used Registers--->
    push ax bx cx dx si di
;-------------------->
    push bp
    mov bp, sp
    sub sp, 2
    temp      equ [word ptr bp - 2]
    positionY equ [word ptr bp + 16]
    positionX equ [word ptr bp + 18]

    mov ah, 0ch     ;int 10.C prints pixel to screen
    xor bl, bl      ; we want to write in page 0
    xor al, al      ; we want to delete, which means black color, black = 0

    mov dx, positionY
    mov cx, ball_height_breakout
@@deleteLeftSide:       ;this loop Deletes the left side of the ball
    push cx     ;we must save cx value because of the loop
    mov cx, positionX
    int 10h
    inc dx      ;has to move on to next pixel
    pop cx
    loop @@deleteLeftSide

    mov cx, ball_height_breakout
    mov dx, positionY
@@deleteRightSide:      ;this loop Deletes the right side of the ball
    push cx     ;we must save cx value because of the loop
    mov cx, positionX
    add cx, ball_width_breakout - 1
    int 10h
    inc dx      ;has to move on to next pixel
    pop cx
    loop @@deleteRightSide

    mov temp, 0     ;needs to be zero because uses as a counter
    mov dx, positionY
    mov cx, ball_width_breakout
@@deleteUpSide:
    push cx
    mov cx, positionX
    add cx, temp
    int 10h
    inc temp
    pop cx
    loop @@deleteUpSide

    mov temp, 0     ;needs to be zero because uses as a counter
    mov dx, positionY
    add dx, ball_height_breakout - 1
    mov cx, ball_width_breakout
@@deleteDownSide:
    push cx
    mov cx, positionX
    add cx, temp
    int 10h
    inc temp
    pop cx
    loop @@deleteDownSide


    add sp, 2       ;releasing the taken memory
    pop bp
;---Used Registers--->
    pop di si dx cx bx ax
;-------------------->
    ret 4
endp DeleteBallTrail_breakout
;-----End of procedure----->



;-----Procedure start------>
; - Parameters: number
; - Action: changes the position
;           of the ball according to it's
;           movement pattern. To keep tracking of
;           the ball movement we use number which will be increased by 1 each loop run,
;           this helps us dividing the moment into stages
proc MoveBall_breakout
;---Used Registers--->
    push ax bx dx si
;-------------------->
    push bp
    mov bp, sp

    mov al, [neededBallMoves_breakout]
    cmp [numOfBallMoves_breakout], al
    je @@startMoving
    inc [byte ptr numOfBallMoves_breakout]
    jmp @@endOfProc
@@startMoving:
    mov [byte ptr numOfBallMoves_breakout], 0

    sentNumber      equ [word ptr bp + 12]  ;uses for following the progression of the ball

;---Delete Trail--->
    push [ballX_breakout]
    push [ballY_breakout]
    call DeleteBallTrail_breakout
;------------------>

    mov ax, sentNumber
    xor ah, ah
;---Check Speed of ball--->
;------Speed 1------
@@checkSpeedStart:
    cmp [byte ptr ballSpeed_breakout], 1    ;checks if speed is:1
    jne @@speedNot1
    mov bl, 2
    div bl
    cmp ah, 0
    jne @@modNot0_speed1
    dec [word ptr ballY_breakout]       ;move the ball up
    jmp @@skipCheckSpeed
@@modNot0_speed1:
    inc [word ptr ballX_breakout]       ;move the ball right
    jmp @@skipCheckSpeed
;-------------------

;------Speed 2------
@@speedNot1:
    cmp [byte ptr ballSpeed_breakout], 2; checks if speed is:2
    jne @@speedNot2
    mov bl, 3
    div bl
    cmp ah, 0
    jne @@modNot0_speed2
    dec [word ptr ballY_breakout]       ;move the ball up
    jmp @@skipCheckSpeed
@@modNot0_speed2:
    cmp ah, 1
    jne @@modNot1_speed2
    dec [word ptr ballY_breakout]       ;move the ball up
    jmp @@skipCheckSpeed
@@modNot1_speed2:
    inc [word ptr ballX_breakout]       ;move the ball right
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 3------
@@speedNot2:
    cmp [byte ptr ballSpeed_breakout], 3; checks if speed is:3
    jne @@speedNot3
    mov bl, 4
    div bl
    cmp ah, 0
    jne @@modNot0_speed3
    dec [word ptr ballY_breakout]      ;moves the ball up
    jmp @@skipCheckSpeed
@@modNot0_speed3:
    cmp ah, 1
    jne @@modNot1_speed3
    dec [word ptr ballY_breakout]      ;moves the ball up
    jmp @@SkipCheckSpeed
@@modNot1_speed3:
    cmp ah, 2
    jne @@modNot2_speed3
    dec [word ptr ballY_breakout]      ;moves the ball up
    jmp @@skipCheckSpeed
@@modNot2_speed3:
    inc [word ptr ballX_breakout]      ;moves the ball right
    jmp @@skipCheckSpeed
;--------------------

;------Speed 4------
@@speedNot3:
    cmp [byte ptr ballSpeed_breakout], 4; checks if speed is:4
    jne @@speedNot4
    mov bl, 5
    div bl
    cmp ah, 0
    jne @@modNot0_speed4
    dec [word ptr ballY_breakout]   ;move the ball up
    jmp @@skipCheckSpeed
@@modNot0_speed4:

    cmp ah, 1
    jne @@modNot1_speed4
    dec [word ptr ballY_breakout]   ;move the ball up
    jmp @@skipCheckSpeed
@@modNot1_speed4:

    cmp ah, 2
    jne @@modNot2_speed4
    dec [word ptr ballY_breakout]   ;move the ball up
    jmp @@skipCheckSpeed
@@modNot2_speed4:

    cmp ah, 3
    jne @@modNot3_speed4
    dec [word ptr ballY_breakout]   ;move the ball up
    jmp @@skipCheckSpeed
@@modNot3_speed4:
    inc [word ptr ballX_breakout]   ;move the ball right
    jmp @@skipCheckSpeed
;------------------------

;------Speed 5------
@@speedNot4:
    cmp[byte ptr ballSpeed_breakout], 5; checks if speed is:5
    jne @@speedNot5
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
;--------------------


;------Speed 6------
@@speedNot5:
    cmp [byte ptr ballSpeed_breakout], 6; checks if speed is:6
    jne @@speedNot6
    mov bl, 5
    div bl
    cmp ah, 0
    jne @@modNot0_speed6
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot0_speed6:

    cmp ah, 1
    jne @@modNot1_speed6
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot1_speed6:

    cmp ah, 2
    jne @@modNot2_speed6
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot2_speed6:

    cmp ah, 3
    jne @@modNot3_speed6
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot3_speed6:
    dec [word ptr ballX_breakout]   ;move the ball left
    jmp @@skipCheckSpeed
;-------------------

;------Speed 7------
@@speedNot6:
    cmp [byte ptr ballSpeed_breakout], 7    ;checks if speed is:7
    jne @@speedNot7

;-Delay speed 7 ->
; Info - for some reason, the speed 7 was
;    too fast, so I used nop to downgrade it's speed.
    mov cx, 900h
@@nopLoop7:
    nop
    loop @@nopLoop7
;---------------->

    mov bl, 4
    div bl
    cmp ah, 0
    jne @@modNot0_speed7
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot0_speed7:
    cmp ah, 1
    jne @@modNot1_speed7
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@SkipCheckSpeed
@@modNot1_speed7:
    cmp ah, 2
    dec [word ptr ballY_breakout]   ;move the ball Up
    dec [word ptr ballX_breakout]
    jmp @@skipCheckSpeed
@@modNot2_speed7:
    dec [word ptr ballX_breakout]   ;move the ball left
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 8------
@@speedNot7:
    cmp [byte ptr ballSpeed_breakout], 8    ;checks if speed is:8
    jne @@speedNot8
    mov bl, 3
    div bl
    cmp ah, 0
    jne @@modNot0_speed8
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot0_speed8:
    cmp ah, 1
    jne @@modNot1_speed8
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot1_speed8:
    dec [word ptr ballX_breakout]   ;move the ball left
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 9------
@@speedNot8:
    cmp [byte ptr ballSpeed_breakout], 9    ;checks if speed is:9
    jne @@speedNot9
    mov bl, 2
    div bl
    cmp ah, 0
    jne @@modNot0_speed9
    dec [word ptr ballY_breakout]   ;move the ball Up
    jmp @@skipCheckSpeed
@@modNot0_speed9:
    dec [word ptr ballX_breakout]   ;move the ball left
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 10------
@@speedNot9:
    cmp [byte ptr ballSpeed_breakout], 10; checks if speed is:10
    jne @@speedNot10
    mov bl, 2
    div bl
    cmp ah, 0
    jne @@modNot0_speed10
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed10:
    inc [word ptr ballX_breakout]       ;move the ball right
    jmp @@skipCheckSpeed
;-------------------

;------Speed 11------
@@speedNot10:
    cmp [byte ptr ballSpeed_breakout], 11       ;checks if speed is:11
    jne @@speedNot11
    mov bl, 3
    div bl
    cmp ah, 0
    jne @@modNot0_speed11
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed11:
    cmp ah, 1
    jne @@modNot1_speed11
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot1_speed11:
    inc [word ptr ballX_breakout]       ;move the ball right
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 12------
@@speedNot11:
    cmp [byte ptr ballSpeed_breakout], 12; checks if speed is:12
    jne @@speedNot12
    mov bl, 4
    div bl
    cmp ah, 0
    jne @@modNot0_speed12
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed12:
    cmp ah, 1
    jne @@modNot1_speed12
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@SkipCheckSpeed
@@modNot1_speed12:
    cmp ah, 2
    jne @@modNot2_speed12
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot2_speed12:
    inc [word ptr ballX_breakout]       ;move the ball right
    jmp @@skipCheckSpeed
;---------------------

;------Speed 13------
@@speedNot12:
    cmp[byte ptr ballSpeed_breakout], 13; checks if speed is:13
    jne @@speedNot13
    mov bl, 5
    div bl
    cmp ah, 0
    jne @@modNot0_speed13
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed13:

    cmp ah, 1
    jne @@modNot1_speed13
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot1_speed13:

    cmp ah, 2
    jne @@modNot2_speed13
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot2_speed13:

    cmp ah, 3
    jne @@modNot3_speed13
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot3_speed13:
    inc [word ptr ballX_breakout]       ;move the ball right
    jmp @@skipCheckSpeed
;------------------------

;------Speed 14------
@@speedNot13:
    cmp[byte ptr ballSpeed_breakout], 14; checks if speed is:5
    jne @@speedNot14
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
;--------------------


;------Speed 15------
@@speedNot14:
    cmp [byte ptr ballSpeed_breakout], 15; checks if speed is:14
    jne @@speedNot15
    mov bl, 5
    div bl
    cmp ah, 0
    jne @@modNot0_speed15
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed15:

    cmp ah, 1
    jne @@modNot1_speed15
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot1_speed15:

    cmp ah, 2
    jne @@modNot2_speed15
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot2_speed15:

    cmp ah, 3
    jne @@modNot3_speed15
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot3_speed15:
    dec [word ptr ballX_breakout]       ;move the ball left
    jmp @@skipCheckSpeed
;-------------------

;------Speed 16------
@@speedNot15:
    cmp [byte ptr ballSpeed_breakout], 16       ;checks if speed is:16
    jne @@speedNot16
    mov bl, 4
    div bl
    cmp ah, 0
    jne @@modNot0_speed16
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed16:
    cmp ah, 1
    jne @@modNot1_speed16
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@SkipCheckSpeed
@@modNot1_speed16:
    cmp ah, 2
    jne @@modNot2_speed16
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot2_speed16:
    dec [word ptr ballX_breakout]       ;move the ball left
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 17------
@@speedNot16:
    cmp[byte ptr ballSpeed_breakout], 17    ;checks if speed is:17
    jne @@speedNot17
    mov bl, 3
    div bl
    cmp ah, 0
    jne @@modNot0_speed17
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed17:
    cmp ah, 1
    jne @@modNot1_speed17
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot1_speed17:
    dec [word ptr ballX_breakout]       ;move the ball left
    jmp @@SkipCheckSpeed
;--------------------

;------Speed 18------
@@speedNot17:
    cmp[byte ptr ballSpeed_breakout], 18; checks if speed is:18
    jne @@speedNot18
    mov bl, 2
    div bl
    cmp ah, 0
    jne @@modNot0_speed18
    inc [word ptr ballY_breakout]       ;move the ball dowm
    jmp @@skipCheckSpeed
@@modNot0_speed18:
    dec [word ptr ballX_breakout]       ;move the ball left
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
endp MoveBall_breakout
;-----End of procedure----->


;-----Procedure start------>
; - Parameters: None.
; - Action: Clears screen with black color
proc ClearScreen_breakout
;---Used Registers--->
    push ax cx di es
;-------------------->
    push 0A000h
    pop es      ;wanted segment
    xor di, di      ;start index
    xor al, al      ;black color is 0 in palette

    mov cx, 320 * 200
    rep stosb       ;store string - byte
;---Used Registers--->
    pop es di cx ax
;-------------------->
    ret
endp ClearScreen_breakout
;-----End of procedure----->


;-----Procedure Start------>
; - Parameters: line & column (8 bit each), offset of message
; - Action: Prints Massege in wanted location
proc PrintMsg_breakout
;---Used Registers--->
    push ax bx dx
;-------------------->
    push bp
    mov bp, sp
    MsgOffset       equ [word ptr bp + 10]
    LineAndColumn   equ [word ptr bp + 12]

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
endp PrintMsg_breakout
;-----End of procedure----->


;-----Procedure start------>
; - Parameters: none
; - action: print level
proc PrintLevelNum
;---Used Registers--->
    push ax dx
;-------------------->
    mov ah, 2
    mov dl, [level]
    cmp [byte ptr level], 9
    jbe @@printLevelNum
;in case num above 9
    mov dl, '1'
    int 21h
    mov dl, [level]
    sub dl, 10
@@printLevelNum:
    add dl, '0'
    int 21h

;---Used Registers--->
    pop dx ax
;-------------------->
    ret
endp PrintLevelNum
;-----End of procedure----->



;-----Procedure start------>
; - Parameters: X,Y
; - Action: returns the index on vga
; - returns: pixel index in video graphics array in AX
proc GetPixelIndex
;---Used Registers--->
    push bx dx
;-------------------->
    push bp
    mov bp, sp
    yOffset equ [bp + 8]
    xOffset equ [bp + 10]
    mov ax, xOffset
    mov bx, yOffset
    shl bx, 6       ;multiply by 64
    mov dx, bx
    shl dx, 2       ;multiply by 256
    add bx, dx      ;y*320
    add bx, ax      ;now bx holds the pixel
    mov ax, bx

    pop bp
;---Used Registers--->
    pop dx bx
;-------------------->
    ret 4
endp GetPixelIndex
;-----End of procedure----->




;-----Procedure start------>
; - Parameters: none.
; - Action: check If game over, or level completed
; - Returns: returns 0 if nothing happens, returns 1 if player_breakout died,
;        returns 2 if player_breakout completed the level.
proc CheckGame
;---Used Registers--->
    push cx si di
;-------------------->
    xor ax, ax
    cmp [word ptr ballY_breakout], 200 - ball_height_breakout - 12 ;12 pixels from bottom
    jne @@didntDie
    mov ax, 1
    jmp @@endOfProc
@@didntDie:

    mov si, offset arena
    mov cx, arena_height*arena_width
@@cmpLoop:
    cmp [byte ptr ds:si], 0
    je @@black
;in case color isnt black
    jmp @@endOfProc
@@black:
    inc si
    loop @@cmpLoop
;in case player_breakout won
    mov ax, 2

@@endOfProc:
;---Used Registers--->
    pop di si cx
;-------------------->
    ret
endp CheckGame
;-----End of procedure----->







;-----Procedure start------>
; - Parameters: None.
; - Action: checks if the ball hits a block.
;           if it does, it deletes the ball
proc CheckIfBallNearBlock
;---Used Registers--->
    push ax bx cx es
;-------------------->
    push bp
    mov bp, sp
    sub sp, 2
    temp equ [bp - 2]


    push 0A000h
    pop es
;------Start of checking top------>
;-These ball speeds cannot be top->
    cmp [byte ptr ballSpeed_breakout], 9
    ja_f @@skipTop
;--------------------------------->
    mov ax, [ballX_breakout]
    mov bx, [ballY_breakout]
;       add ax, ball_width_breakout/2
    dec bx ;we need one pixel above the head of the ball
    push ax ;x
    push bx ;y
    call GetPixelIndex ;returns pixel index in ax
    mov bx, ax ;now bx holds the pixel index

    add bx, 2
    mov cx, 2
@@checkTopLoop:
    push bx
;-Check If ball touches block->
    cmp [byte ptr es:bx], 0
    je @@notTop
    cmp [byte ptr es:bx], 0Fh
    je @@notTop
    cmp [byte ptr es:bx], 16
    je @@notTop
;----------------------------->



@@ballMetBlock_top:
;in case the ball has hit a block
    mov ax, [ballY_breakout]
    mov bl, stone_height + 2
    div bl
    xor ah, ah
    mov temp, ax
    mov bl, arena_width
    mul bl
    mov bx, ax
    mov ax, [ballX_breakout]
;-ball touches block (before/after center)->
    cmp cl, 2
    jne @@incAx_top
    add ax, 2       ;- need to be changed if the ball size is changed
    jmp @@skipIncAx_top
@@incAx_top:
    add ax, 6       ;- need to be changed if the ball size is changed
@@skipIncAx_top:
;------------------------------------------>

;       add ax, ball_width_breakout/2
    mov dl, stone_width + 2
    div dl
    xor ah, ah

;-Delete hit block->
    push ax
    push temp
    push 16
    call PrintBlock
;------------------>

    add bx, ax
    add bx, offset arena
    mov [byte ptr bx], 0
    add [byte ptr ballSpeed_breakout], 9
    xor dx, dx
    pop bx
    jmp @@endOfProc
@@notTop:
    pop bx
    add bx, 4
    loop @@checkTopLoop
@@skipTop:
;-------End Of checking top------>




;------Start of checking Bottom------>
;-These ball speedes cannot be bottom->
    cmp [byte ptr ballSpeed_breakout], 10
    jb_f @@skipBottom
;------------------------------------->
    mov ax, [ballX_breakout]
    mov bx, [ballY_breakout]
;       add ax, ball_width_breakout/2
    add bx, ball_height_breakout ;we need one pixel below the head of the ball
    push ax ;x
    push bx ;y
    call GetPixelIndex ;returns pixel index in ax
    mov bx, ax ;now bx holds the pixel index

    add bx, 2       ;- need to be changed if the ball size is changed
    mov cx, 2
@@checkBottomLoop:
    push bx
;-Check If ball touches block->
    cmp [byte ptr es:bx], 0
    je @@notBottom
    cmp [byte ptr es:bx], 0Fh
    je @@notBottom
    cmp [byte ptr es:bx], 16
    je @@notBottom
;----------------------------->



@@ballMetBlock_bottom:
;in case the ball has hit a block
    mov ax, [ballY_breakout]
    add ax, ball_width_breakout
    mov bl, stone_height + 2
    div bl
    xor ah, ah
    mov temp, ax
    mov bl, arena_width
    mul bl
    mov bx, ax
    mov ax, [ballX_breakout]
;-ball touches block (before/after center)->
    cmp cl, 2
    jne @@incAx_bottom
    add ax, 2       ;- need to be changed if the ball size is changed
    jmp @@skipIncAx_bottom
@@incAx_bottom:
    add ax, 6 ;- need to be changed if the ball size is changed
@@skipIncAx_bottom:
;------------------------------------------>

;       add ax, ball_width_breakout/2
    mov dl, stone_width + 2
    div dl
    xor ah, ah

;-Delete hit block->
    push ax
    push temp
    push 16
    call PrintBlock
;------------------>

    add bx, ax
    add bx, offset arena
    mov [byte ptr bx], 0
;change speed
    sub [byte ptr ballSpeed_breakout], 9
    xor dx, dx
    pop bx
    jmp @@endOfProc
@@notBottom:
    pop bx
    add bx, 2
    loop @@checkBottomLoop
@@skipBottom:
;-------End Of checking buttom------>




;-------Start of checking left--->
;-cant be left in these speeds->
    cmp [byte ptr ballSpeed_breakout], 6
    jb_f @@notLeft
    cmp [byte ptr ballSpeed_breakout], 10
    jnae @@skipSkippingLeft
    cmp [byte ptr ballSpeed_breakout], 15
    jb_f @@notLeft
@@skipSkippingLeft:
;------------------------------>
    mov ax, [ballX_breakout]
    mov bx, [ballY_breakout]
    add bx, ball_height_breakout/2
    dec ax
    push ax ;X
    push bx ;Y
    call GetPixelIndex
    mov bx, ax ;now bx holds the offset of the pixel near the ball
;-Checking if pixel hits block->
    cmp [byte ptr es:bx], 0
    je @@notLeft
    cmp [byte ptr es:bx], 0Fh
    je @@notLeft
    cmp [byte ptr es:bx], 16
    je @@notLeft
;------------------------------>
;in case the ball has hit a block
    mov ax, [ballY_breakout]
    add ax, ball_height_breakout/2
    mov bl, stone_height + 2
    div bl
    xor ah, ah
    mov temp, ax
    mov bl, arena_width
    mul bl
    mov bx, ax
    mov ax, [ballX_breakout]

    dec ax
    mov dl, stone_width + 2
    div dl
    xor ah, ah

;-Delete hit block->
    push ax
    push temp
    push 16
    call PrintBlock
;------------------>

    add bx, ax
    add bx, offset arena
    mov [byte ptr bx], 0

;change speed -
    mov dh, [ballSpeed_breakout] ;DH holds the speed
    cmp [byte ptr ballSpeed_breakout], 9 ;in case the speed is between 1 - 9
    ja @@speedAbove9_left
;in case the speed is between 1 - 9
    mov dl, 10
    sub dl, dh
    xor dh, dh
    mov [ballSpeed_breakout], dl
    jmp @@skipSpeedAbove9_left
@@speedAbove9_left:
    mov dl, 28
    sub dl, dh
    mov [ballSpeed_breakout], dl
    sub dl, 9
    xor dh, dh

@@skipSpeedAbove9_left:
    jmp @@endOfProc
@@notLeft:
;-----End of checking left------->


;-------Start of checking right--->
;-cant be right in these speeds->
    cmp [byte ptr ballSpeed_breakout], 13
    ja_f @@notRight
    cmp [byte ptr ballSpeed_breakout], 5
    jnae @@skipSkippingRight
    cmp [byte ptr ballSpeed_breakout], 10
    jb_f @@notRight
@@skipSkippingRight:
;------------------------------>

    mov ax, [ballX_breakout]
    mov bx, [ballY_breakout]
    add bx, ball_height_breakout/2
    add ax, ball_width_breakout ;we need the right edge of the ball
    push ax ;X
    push bx ;Y
    call GetPixelIndex
    mov bx, ax ;now bx holds the offset of the pixel near the ball
;-Checking if pixel hits block->
    cmp [byte ptr es:bx], 0
    je @@notRight
    cmp [byte ptr es:bx], 0Fh
    je @@notRight
    cmp [byte ptr es:bx], 16
    je @@notRight
;------------------------------>
;in case the ball has hit a block
    mov ax, [ballY_breakout]
    add ax, ball_height_breakout/2
    mov bl, stone_height + 2
    div bl
    xor ah, ah
    mov temp, ax
    mov bl, arena_width
    mul bl
    mov bx, ax
    mov ax, [ballX_breakout]
    add ax, ball_width_breakout
    mov dl, stone_width + 2
    div dl
    xor ah, ah

;-Delete hit block->
    push ax
    push temp
    push 16
    call PrintBlock
;------------------>

    add bx, ax
    add bx, offset arena
    mov [byte ptr bx], 0

;change speed -
    mov dl, [ballSpeed_breakout] ;DL holds the speed
    cmp [byte ptr ballSpeed_breakout], 9 ;in case the speed is between 1 - 9
    ja @@speedAbove9_right
;in case the speed is between 1 - 9
    mov dh, 10
    sub dh, dl
    mov [ballSpeed_breakout], dh
    xor dh, dh
    jmp @@skipSpeedAbove9_right
@@speedAbove9_right:
    mov dh, 28
    sub dh, dl
    mov [ballSpeed_breakout], dh
    sub dl, 9
    xor dh, dh

@@skipSpeedAbove9_right:
    jmp @@endOfProc
@@notRight:
;-----End of checking right------->

@@endOfProc:
    add sp, 2
    pop bp
;---Used Registers--->
    pop es cx bx ax
;-------------------->
    ret
endp CheckIfBallNearBlock
;-----End of procedure----->


;-----Procedure Start------>
; - Parameters: none.
; - actione: draw number of hearts as the number
;        of remaining lives.
proc DrawHearts
;---Used Registers--->
    push ax cx
;-------------------->
    mov ax, 5 ;ax holds the x of the first heart
    xor ch, ch
    mov cl, [numOflives]
@@drawingLoop:
    push offset heart
    push ax
    push 200 - heart_height - 1 ;3 pixels from bottom-
    push heart_height
    push heart_width
    call PrintShape_breakout

    add ax, heart_width + 2 ;2 pixel distance between hearts
    loop @@drawingLoop

;---Used Registers--->
    pop cx ax
;-------------------->
    ret
endp DrawHearts
;-----End of procedure----->


;-----------------------------------------Main Breakout procedure---------------------------------------------->
proc Breakout
;---PrintStartMessage--->
    mov ah,11
    mov al, 9
    push ax
    push offset pressToStart
    call PrintMsg_breakout
    xor ax, ax
    int 16h
    call ClearScreen_breakout
;----------------------->
    mov [byte ptr level], 1
    mov [byte ptr numOfLives], 5

;-----Load Arena----->
    call LoadArena
;-------------------->
@@startOfGame:
;---Initialize game data--->
    mov [word ptr player_breakoutX_breakout], 160 - player_breakout_width_breakout/2
    mov [word ptr player_breakoutY_breakout], 200 - player_breakout_height_breakout - 18 ;18 pixels above bottom
    mov [word ptr ballX_breakout], 160 - ball_width_breakout/2
    mov ax, [word ptr player_breakoutY_breakout]
    sub ax, player_breakout_height_breakout
    mov [word ptr ballY_breakout], ax
    mov [byte ptr left_IsPressed_breakout], 0
    mov [byte ptr right_IsPressed_breakout], 0
    mov [byte ptr neededBallMoves_breakout], 4
    mov [byte ptr numOfBallMoves_breakout], 0
    mov [byte ptr ballSpeed_breakout], 8
    mov [byte ptr neededPlayerMoves_breakout], 3
    mov [byte ptr numOfPlayerMoves_breakout], 0
    xor dx, dx
;-------------------------->
;---Print Info--->
;Breakout
    mov al, 15      ;column
    mov ah, 24      ;line
    push ax
    push offset breakoutMsg
    call PrintMsg_breakout

;number of lives
    call DrawHearts


;current level
    mov al, 31      ;column
    mov ah, 24      ;line
    push ax
    push offset levelMsg
    call PrintMsg_breakout
    call PrintLevelNum
;---------------->
@@mainLoop:

;---Delete player_breakout's trail--->
    call DeletePlayerTrail_breakout
;--------------------------->



;---Print Player--->
    push offset player_breakout
    push [word ptr player_breakoutX_breakout]
    push [word ptr player_breakoutY_breakout]
    push player_breakout_height_breakout
    push player_breakout_width_breakout
    call PrintShape_breakout
;------------------>



;---Delay Program--->
;       push 0FFFFh
;       call DelayPro
;------------------->

;---Move Ball--->
    push dx
    call MoveBall_breakout
;--------------->
;---Checks Input--->
    call CheckInput
;------------------>

;---Checks If Input If esc--->
    dec al
    je_f @@exitMainLoop
;---------------------------->


;---Check If ball has just moved--->
    cmp [byte ptr numOfBallMoves_breakout], 0
    jne @@didntMove
    inc dx


;---Print Ball--->
    push offset ball
    push [word ptr ballX_breakout]
    push [word ptr ballY_breakout]
    push ball_height_breakout
    push ball_width_breakout
    call PrintShape_breakout
;---------------->

;---Check if ball encounters a block--->
    call CheckIfBallNearBlock
;-------------------------------------->
	;Check If should change direction
    call ChangeDir

;---Print arena--->
    push offset arena
    call PrintArena
;----------------->

;---Check Game--->
    call CheckGame
    cmp al, 1
    jne @@didntLose;in case player_breakout lost
    dec [byte ptr numOfLives]
    cmp [byte ptr numOfLives], 0
    je @@exitMainLoop
    call ClearScreen_breakout
    jmp @@startOfGame
@@didntLose:
    cmp al, 2
    jne @@didntLevelUp
;in case the level was completed
    inc [byte ptr level]
	cmp [byte ptr numOfLives], 5
	jae @@skipIncLives
	inc [byte ptr numOfLives]
@@skipIncLives:
    call LoadArena
    call ClearScreen_breakout
    jmp @@startOfGame
@@didntLevelUp:

@@didntMove:
;---------------------------------->
    jmp @@mainLoop
@@exitMainLoop:
    ret
endp Breakout
;-------------------------------------------------------------------------------------------------------------->