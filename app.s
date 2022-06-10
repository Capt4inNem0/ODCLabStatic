
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
    mov x3,0
    mov x4,12
    lsl x4,x4,32
    add x4,x4,12
    bl drawSquare

b end

// enter in x3,x4 Both points
drawSquare:

DrawSquareReturn:

end:

InfLoop: 
	b InfLoop
