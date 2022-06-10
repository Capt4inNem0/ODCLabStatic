
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
// START
// X0 contiene la direccion base del framebuffer
mov x20, x0 // Save framebuffer base address to x20

// COLORES
movz x12, 0x0000, lsl 00 // NEGRO
movk x12, 0x0000, lsl 16

movz x11, 0x3366, lsl 00 // FONDO

movz x10, 0xffff, lsl 00 // BLANCO
movk x10, 0xffff, lsl 16

// Draw square from (0,0) to (12,12)
mov x3,0
mov x4,0
mov x5,12
mov x6,12
bl hacerCuadrado
bl drawSquare

b end

// enter in x3,x4 Both points
drawSquare:
mov x0,x20
mov x1,x3

mov x8,SCREEN_WIDTH // AUX
mul x9,x4,x8 // Y * 640
add x9,x9,x3 // Y * 640 + x
mov x8,4 // AUX
mul x9,x9,x8 // 4(640Y + X)
add x0,x0,x9 // Goto first point

dSLoop:
stur w11,[x0] // Paint


DrawSquareReturn:
br lr

hacerCuadrado:

    mov x2, x5 // Y size
drawgato0:
	mov x1, x6         // X Size
drawgato1:
    stur w11,[x0]	   // Set color of pixel N
    add x0,x0,4	   // Next pixel
    sub x1,x1,1	   // decrement X counter
    cbnz x1,drawgato1	   // If not end row jump
sub x3, SCREEN_WIDTH, x5 // 640 - ancho del cuadrado
    mov x4, 4
    mul x3, x3, x4 // (640 - (ancho del cuadrado)) * 4 (salto de linea)
    add x0,x0,x3 // llegamos al final del rectangulo por der y saltamos a la linea de abajo
    sub x2,x2,1	   // Decrement Y counter
    cbnz x2,drawgato0	   // if not last row, jump

br lr

end:

InfLoop: 
	b InfLoop
