
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
// START
// X0 contiene la direccion base del framebuffer
mov x20, x0 // Save framebuffer base address to x20

// COLORES
movz x15, 0x99f7, lsl 00 //crema: 0xf399f7
movk x15, 0x00f3, lsl 16

movz x14, 0xcb98, lsl 00 //Masa: 0xfecb98
movk x14, 0x00fe, lsl 16

movz x13, 0xffff, lsl 00 // BLANCO
movk x13, 0xffff, lsl 16

movz x12, 0x0000, lsl 00 // NEGRO
movk x12, 0x0000, lsl 16

movz x11, 0x3366, lsl 00 // FONDO

movz x10, 0xffff, lsl 00 // GENERAL
movk x10, 0xffff, lsl 16

mov x3,0
mov x4,0
mov x5,640
mov x6,480
mov w10,w11
bl DrawSquare

mov w10,w12
// Draw square from (x,y) to (X,Y)
mov x3,240 // x
mov x4,96 // y
mov x5,502 // X
mov x6,324 // Y
bl DrawSquare

// PAN
mov w10,w14
add x3,x3,12
add x4,x4,12
sub x5,x5,12
sub x6,x6,12
bl DrawSquare

// CREMA
mov w10,w15
add x3,x3,12
add x4,x4,12
sub x5,x5,12
sub x6,x6,12
bl DrawSquare


// BANDERA
mov x22,192
mov x21,132
bl Bandera

sub x22,x22,48 // -48
add x21,x21,12 // +12
bl Bandera

sub x22,x22,48 // -48
sub x21,x21,12 // +12
bl Bandera

sub x22,x22,48 // -48
add x21,x21,12 // +12
bl Bandera

sub x22,x22,48 // -48
sub x21,x21,12 // +12
bl Bandera

//Chispas
mov x21, 300
mov x22, 156
movz x10, 0xF725, lsl 00
movk x10, 0x0097, lsl 16
bl DrawPixel


b end

// FUNCIONES
// enter in x3,x4 Both points
DrawSquare:
mov x0,x20 // VA AL INICIO
sub x2,x6,x4 // Calcula el alto

mov x8,SCREEN_WIDTH // AUX
mul x9,x4,x8 // Y * 640
add x9,x9,x3 // Y * 640 + x
mov x8,4 // AUX
mul x9,x9,x8 // 4(640Y + X)
add x0,x0,x9 // Goto first point

dsLoop:
sub x1,x5,x3 // Guarda en x1 el ancho
dsLoopb:
stur w10,[x0] // Pinta del color de w10
sub x1,x1,1 // x1 - 1
add x0,x0,4 // Next Pixel
cbnz x1,dsLoopb // return
mov x8,SCREEN_WIDTH // AUX
sub x8,x8,x5 // 640 - X
add x8,x8,x3 // 640 + x
mov x9,4 // AUX
mul x8,x8,x9
add x0,x0,x8
sub x2,x2,1
cbnz x2,dsLoop

DrawSquareReturn:
br lr

// x22 X; x21 Y
Bandera:
mov x27,x30 // BACKUP DE RETORNO

movz x10,0x0a00, lsl 00 // Rojo: fd0a00
movk x10, 0xfd, lsl 16 // SET COLOR ROJO
mov x3,x22 //
mov x4,x21 // (x,y)
add x5,x3,48 //
add x6,x4,24
bl DrawSquare

movz x10, 0x9502, lsl 00 // Naranja: fe9502
movk x10, 0x00fe, lsl 16 // SET COLOR NARANJA
add x4,x4,24
add x6,x6,24
bl DrawSquare

movz x10, 0xfe00, lsl 00 // Amarillo: fefe00
movk x10, 0x00fe, lsl 16 // SET COLOR AMARILLO
add x4,x4,24
add x6,x6,24
bl DrawSquare

movz x10, 0xfd02, lsl 00 // Verde: 32fd02
movk x10, 0x0032, lsl 16 // SET COLOR VERDE
add x4,x4,24
add x6,x6,24
bl DrawSquare

movz x10, 0x98fd // Celeste: 0098fd  SET COLOR CELESTE
add x4,x4,24
add x6,x6,24
bl DrawSquare

movz x10, 0x33fc, lsl 00 // Morado: 6633fc
movk x10, 0x0066, lsl 16 // SET COLOR VIOLETA
add x4,x4,24
add x6,x6,24
bl DrawSquare

BanderaReturn:
mov x30,x27
br lr

// (x21,x22)
DrawPixel:
mov x27,x30
mov x3,x21
mov x4,x22
add x5,x3,12
add x6,x4,12
bl DrawSquare

ReturnDrawPixel:
mov x30,x27
br lr


end:

InfLoop: 
b InfLoop
