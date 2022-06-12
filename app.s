
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
// END COLORES

// FONDO
bl DrawFondo

mov w10,w12


BordesCuerpo: // TODO: Terminar
mov x3,240 // x
mov x4,96 // y
mov x5,502 // X
mov x6,324 // Y
bl DrawSquare

Pan: // TODO: Terminar
mov w10,w14
add x3,x3,12
add x4,x4,12
sub x5,x5,12
sub x6,x6,12
bl DrawSquare






Crema: // Dibuja la crema rosa del cuerpo del gato
mov w10,w15
add x3,x3,12
add x4,x4,12
sub x5,x5,12
sub x6,x6,12
bl DrawSquare
// END CREMA


Arcoiris:
mov x22,192
mov x21,132
bl Bandera

sub x22,x22,48 // -48
add x21,x21,12 // +12
bl Bandera

sub x22,x22,48 // -48
sub x21,x21,12 // -12
bl Bandera

sub x22,x22,48 // -48
add x21,x21,12 // +12
bl Bandera

sub x22,x22,48 // -48
sub x21,x21,12 // -12
bl Bandera
// END ARCOIRIS


Chispas: // Dibuja las chispas
mov x21, 300
mov x22, 156
movz x10, 0x268c, lsl 00
movk x10, 0x00fd, lsl 16
bl DrawPixel

mov x21, 312
mov x22, 216
bl DrawPixel

mov x21, 348
mov x22, 264
bl DrawPixel

mov x21, 348
mov x22, 192
bl DrawPixel

mov x21, 360
mov x22, 144
bl DrawPixel

mov x21, 396
mov x22, 144
bl DrawPixel

mov x21, 444
mov x22, 168
bl DrawPixel
// END CHISPAS


Estrellas: // TODO: Terminar
mov x3, 274
mov x4, 20
mov x26, 24
add x5, x3, x26
add x6, x4, x26
lsr x25,x26,1
add x24, x3, x25 // centro del circulo
add x25, x4, x25 //

bl DrawCircle

Cabeza: // TODO: Terminar

movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

mov x21, 396
mov x22, 168
bl DrawPixel

mov x21, 408
mov x22, 168
bl DrawPixel

mov x21, 420
mov x22, 180
bl DrawPixel

mov x21, 432
mov x22, 180
bl DrawPixel

mov x21, 444
mov x22, 192
bl DrawPixel

mov x21, 456
mov x22, 192
bl DrawPixel

mov x21, 456
mov x22, 204
bl DrawPixel

mov x21, 468
mov x22, 204
bl DrawPixel

mov x21, 480
mov x22, 204
bl DrawPixel

mov x21, 492
mov x22, 204
bl DrawPixel

mov x21, 504
mov x22, 192
bl DrawPixel

mov x21, 516
mov x22, 180
bl DrawPixel

mov x21, 528
mov x22, 168
bl DrawPixel

mov x21, 540
mov x22, 168
bl DrawPixel

mov x3, 384
mov x4, 180
mov x5, 396
mov x6, 228
bl DrawSquare

mov x3, 372
mov x4, 228
mov x5, 384
mov x6, 288
bl DrawSquare

mov x3, 552
mov x4, 180
mov x5, 564
mov x6, 228
bl DrawSquare

mov x3, 564
mov x4, 228
mov x5, 576
mov x6, 288
bl DrawSquare

mov x21, 384
mov x22, 288
bl DrawPixel

mov x21, 396
mov x22, 300
bl DrawPixel

mov x21, 552
mov x22, 288
bl DrawPixel

mov x21, 540
mov x22, 300
bl DrawPixel

mov x3, 492
mov x4, 300
mov x5, 528
mov x6, 312
bl DrawSquare

mov x3, 492
mov x4, 312
mov x5, 540
mov x6, 324
bl DrawSquare

//Gris
movz x10, 0xD5D6, lsl 00 // Set color in grey
movk x10, 0x00D8, lsl 16

mov x3, 384
mov x4, 228
mov x5, 564
mov x6, 288
bl DrawSquare

mov x3, 396
mov x4, 216
mov x5, 552
mov x6, 264
bl DrawSquare

mov x3, 396
mov x4, 288
mov x5, 552
mov x6, 300
bl DrawSquare

mov x3, 408
mov x4, 300
mov x5, 540
mov x6, 312
bl DrawSquare

mov x3, 396
mov x4, 204
mov x5, 456
mov x6, 216
bl DrawSquare

mov x3, 396
mov x4, 192
mov x5, 444
mov x6, 204
bl DrawSquare

mov x3, 396
mov x4, 180
mov x5, 420
mov x6, 192
bl DrawSquare

mov x3, 504
mov x4, 204
mov x5, 552
mov x6, 216
bl DrawSquare

mov x3, 516
mov x4, 192
mov x5, 552
mov x6, 204
bl DrawSquare

mov x3, 528
mov x4, 180
mov x5, 552
mov x6, 192
bl DrawSquare

//Boca y ojos
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

mov x21, 444
mov x22, 276
bl DrawPixel

mov x21, 480
mov x22, 276
bl DrawPixel

mov x21, 516
mov x22, 276
bl DrawPixel

mov x3, 444
mov x4, 288
mov x5, 528
mov x6, 300
bl DrawSquare

mov x3, 516
mov x4, 240
mov x5, 540
mov x6, 264
bl DrawSquare

mov x3, 432
mov x4, 240
mov x5, 456
mov x6, 264
bl DrawSquare

movz x10, 0xFFFF, lsl 00 // Set color in white
movk x10, 0x00FF, lsl 16

mov x21, 516
mov x22, 240
bl DrawPixel

mov x21, 432
mov x22, 240
bl DrawPixel

// TODO: FIN CABEZA



b end

// FUNCIONES

DrawSquare: // Dibuja un cuadrado
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

// f(x,y) x21 = x y x22 = y // Dibuja un pixel 12x12 en la coordenada como esquina superior izquierda
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

DrawCircle:
mov x27,x30

mov x0,x20 // VA AL INICIO
sub x2,x6,x4 // Calcula el alto X2

mov x8,SCREEN_WIDTH // AUX
mul x9,x4,x8 // Y * 640
add x9,x9,x3 // Y * 640 + x
mov x8,4 // AUX
mul x9,x9,x8 // 4(640Y + X)
add x0,x0,x9 // Goto first point

dcLoop:
sub x1,x5,x3 // Guarda en x1 el ancho
dcLoopb:


sub x24, x1, 6 // TODO reemplazar 6 por variable de entrada
mul x9, x24, x24
sub x25, x2, 6 // TODO reemplazar 6 por variable de entrada
mul x23, x25, x25
add x23, x9, x23
//mul x26,x26,x26
cmp x23,x26  // TODO reemplazar 12 por variable de entrada
b.ge dcNoPinta
stur w10,[x0] // Pinta del color de w10

dcNoPinta:
sub x1,x1,1 // x1 - 1
add x0,x0,4 // Next Pixel
cbnz x1,dcLoopb // return
mov x8,SCREEN_WIDTH // AUX
sub x8,x8,x5 // 640 - X
add x8,x8,x3 // 640 + x
mov x9,4 // AUX
mul x8,x8,x9
add x0,x0,x8
sub x2,x2,1
cbnz x2,dcLoop

ReturnDrawCircle:
mov x30,x27
br lr

DrawFondo:
mov x27,x30
mov x3,0
mov x4,0
mov x5,640
mov x6,480
mov w10,w11

mov x0,x20 // VA AL INICIO
sub x2,x6,x4 // Calcula el alto

mov x8,SCREEN_WIDTH // AUX
mul x9,x4,x8 // Y * 640
add x9,x9,x3 // Y * 640 + x
mov x8,4 // AUX
mul x9,x9,x8 // 4(640Y + X)
add x0,x0,x9 // Goto first point
mov x21, 0 //
dfLoop:
sub x1,x5,x3 // Guarda en x1 el ancho
dfLoopb:
sub x1,x1,1 // x1 - 1
stur w10,[x0] // Pinta del color de w10
add x0,x0,4 // Next Pixel
cbnz x1,dfLoopb // return
mov x8,SCREEN_WIDTH // AUX
sub x8,x8,x5 // 640 - X
add x8,x8,x3 // 640 + x
mov x9,4 // AUX
mul x8,x8,x9
add x0,x0,x8

// COMPARA AZUL
mov x22, 9
cmp x21,x22
b.ne skipBlue
add w10,w10,1 // Suma uno al color AZUL
// TODO Añadir 1 cada 9 tambien a ROJO
// TODO Ir de #003366 a #39109c

mov x21,0
skipBlue:
add x21,x21,1
sub x2,x2,1
cbnz x2,dfLoop

DrawFondoReturn:
br lr

degrade:




end:

InfLoop: 
b InfLoop
