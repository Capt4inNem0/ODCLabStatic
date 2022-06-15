
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
// START
// X0 contiene la direccion base del framebuffer
mov x20, x0 // Save framebuffer base address to x20

movz x10, 0xffff, lsl 00 // Direccion de memoria que contiene el color con el que se pinta
movk x10, 0xffff, lsl 16

// FONDO
bl DrawFondo
// END FONDO

// ESTRELLAS
Estrellas:
movz x10, 0xffff, lsl 00 // color BLANCO
movk x10, 0xffff, lsl 16
mov x26, 6 // RADIO DEL CIRCULO
mov x24,320 // coordenada x del centro del circulo teniendo en cuenta un eje cartesiano con el (0,0) en la esquina inferior derecha
mov x25,440 // coordenada y  "" ..
bl DrawCircle

mov x26, 12 // RADIO DEL CIRCULO
mov x24,380 // (x,y)  centro desde esquina inferior derecha (0,0)
mov x25,70 //
bl DrawCircle

mov x26, 8 // RADIO DEL CIRCULO
mov x24,520// (x,y) centro desde esquina inferior derecha (0,0)
mov x25,35 //
bl DrawCircle

mov x26, 64 // RADIO DEL CIRCULO
mov x24,76 // (x,y) centro desde esquina inferior derecha (0,0)
mov x25,300 //
bl DrawCircle

mov x26, 32 // RADIO DEL CIRCULO
mov x24,580 // (x,y) centro desde esquina inferior derecha (0,0)
mov x25,128 //
bl DrawCircle

mov x26, 48 // RADIO DEL CIRCULO
mov x24,480 // (x,y) centro desde esquina inferior derecha (0,0)
mov x25,380 //
bl DrawCircle

mov x26, 50 // RADIO DEL CIRCULO
mov x24,59 // (x,y) centro desde esquina inferior derecha (0,0)
mov x25,460 //
bl DrawCircle

mov x26, 36 // RADIO DEL CIRCULO
mov x24,100// (x,y) centro desde esquina inferior derecha (0,0)
mov x25,16 //
bl DrawCircle

// END STARS

BODY: // Dado dos puntos (x3,x4) y (x5,x6) dibuja el cuerpo con ese pixel como esquina superior izquierda
// Bordes negros del cuerpo
mov w10,WZR
mov x3,264 // x
mov x4,96 // y
mov x5,478 // X
mov x6,324 // Y
bl DrawSquare

sub x3, x3, 12
add x4, x4, 12
add x5, x5, 12
sub x6, x6, 12
bl DrawSquare

sub x3, x3, 12
add x4, x4, 12
add x5, x5, 12
sub x6, x6, 12
bl DrawSquare
// END Bordes negros del cuerpo

// Pan
movz x10, 0xcb98, lsl 00 //Masa: 0xfecb98
movk x10, 0x00fe, lsl 16

add x3, x3, 24
sub x4, x4, 12
sub x5, x5, 24
add x6, x6, 12
bl DrawSquare

sub x3, x3, 12
add x4, x4, 12
add x5, x5, 12
sub x6, x6, 12
bl DrawSquare

// END Pan

// Dibuja la crema rosa del cuerpo del gato
movz x10, 0x99f7, lsl 00 //crema: 0xf399f7
movk x10, 0x00f3, lsl 16

add x3, x3, 12
add x4,x4,24
sub x5, x5,12
sub x6, x6, 24
bl DrawSquare

add x3, x3, 12
sub x4, x4, 12
sub x5, x5, 12
add x6, x6, 12
bl DrawSquare

add x3, x3, 12
sub x4, x4, 12
sub x5, x5, 12
add x6, x6, 12
bl DrawSquare
// END Crema rosa
// END BODY

Arcoiris: // Dado un punto (x22,x21) dibuja un arcoiris con ese punto como esquina superior derecha
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

//Patas
// 1st leg
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16
mov x21, 228
mov x22, 300
bl DrawPixel



sub x21, x21, 12 // BASE X21 216
add x22, x22, 12 // BASE X22 312
bl DrawPixel

mov x25, x21
mov x26, x22 // copia de seguridad del primer pixel de referencia

add x3, x21, 0 //mov x3, 216
add x4, x22, 12 //mov x4, 324
add x5, x21, 12 //mov x5, 228
add x6, x22, 36 //mov x6, 348   BASES
bl DrawSquare
//mov x3, 216
add x4, x4, 12 //mov x4, 336
add x5, x5, 36 //mov x5, 264
//add x6, x6, 00 // mov x6,348
bl DrawSquare
add x21, x21, 36//mov x21, 252
add x22, x22, 12//mov x22, 324 // x22 base parte gris
bl DrawPixel
add x21, x21, 12 // 264, x21 base parte gris
bl DrawPixel

movz x10, 0x9999, lsl 00 // Set color in grey
movk x10, 0x0099, lsl 16
sub x3, x21, 36 //mov x3, 228
sub x4, x22, 12 //mov x4, 312
sub x5, x21, 12//mov x5, 252
add x6, x22, 12//mov x6, 336
bl DrawSquare
sub x21, x21, 12//mov x21, 252
sub x22, x22, 12//mov x22, 312
bl DrawPixel

// me desvio del dibujo principal para dibujar unos pixeles extra
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

add x21, x25, 24
sub x22, x26, 12
bl DrawPixel

sub x22, x22, 12
bl DrawPixel

add x22, x22, 12
add x21, x21, 12
bl DrawPixel




//2nd leg
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16
mov x21, 300
mov x22, 324
bl DrawPixel
add x22, x22, 12
bl DrawPixel
add x21, x21, 12
bl DrawPixel
add x21, x21, 12
bl DrawPixel
add x21, x21, 12 // 336, x21 base parte gris
sub x22, x22, 12 // 324, x22 base parte gris
bl DrawPixel

movz x10, 0x9999, lsl 00 // Set color in grey
movk x10, 0x0099, lsl 16
sub x21, x21, 24 //mov x21, 312
//mov x22, 324
bl DrawPixel
add x21, x21, 12
bl DrawPixel

//3rd leg
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16
mov x21, 408
mov x22, 324
bl DrawPixel
add x3, x21, 12
add x4, x22, 12
add x5, x21, 48
add x6, x22, 24
bl DrawSquare
add x21, x21, 48
bl DrawPixel

movz x10, 0x9999, lsl 00 // Set color in grey
movk x10, 0x0099, lsl 16
sub x3, x21, 36
add x4, x22, 0
add x5, x21, 0
add x6, x22, 12
bl DrawSquare

//4th leg
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16
mov x21, 480
mov x22, 324
bl DrawPixel
add x21, x21, 12
add x22, x22, 12
bl DrawPixel
add x21, x21, 12
bl DrawPixel
add x21, x21, 12
sub x22, x22, 12
bl DrawPixel

movz x10, 0x9999, lsl 00 // Set color in grey
movk x10, 0x0099, lsl 16
sub x21, x21, 12
bl DrawPixel
sub x21, x21, 12
bl DrawPixel

// END PATAS


// Borde negro cola
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

mov x3, 168  //Comienzo de la cola
mov x4, 192
add x21,x3,12 // x21 y x22 se setean aca para la parte gris
add x22,x4,12
add x5, x3,48
add x6, x4,36
bl DrawSquare

add x3, x3, 12
add x4, x4, 12
add x5, x3,48
add x6, x4,36
bl DrawSquare

add x3, x3, 12
add x4, x4, 12
add x5, x3,48
add x6, x4,36
bl DrawSquare

add x3, x3, 12
add x4, x4, 12
add x5, x3,48
add x6, x4,36
bl DrawSquare

add x3,x3, 12
add x4,x4, 12
add x5, x3,36
add x6, x4,36
bl DrawSquare

//Parte gris
movz x10, 0x9999, lsl 00 // Set color in grey
movk x10, 0x0099, lsl 16

bl DrawPixel // Este draw pixel lo ejecuto asi sin setear argumentos porque en realidad estan en la linea anterior
add x21, x21, 12
bl DrawPixel
add x22, x22, 12
bl DrawPixel
add x21, x21, 12
bl DrawPixel
add x22, x22, 12
bl DrawPixel
add x21, x21, 12
bl DrawPixel
add x22, x22, 12
bl DrawPixel
add x21, x21, 12
bl DrawPixel
add x22, x22, 12
bl DrawPixel

Chispas: // Dibuja las chispas
mov x21, 300
mov x22, 156
movz x10, 0x268c, lsl 00
movk x10, 0x00fd, lsl 16
bl DrawPixel

add x21, x21, 12
add x22, x22, 60
bl DrawPixel
add x21, x21, 36
add x22, x22, 48
bl DrawPixel
sub x22,x22,72
bl DrawPixel
add x21, x21, 12
sub x22, x22, 48
bl DrawPixel
add x21, x21, 48
bl DrawPixel
add x21, x21, 48
add x22, x22, 24
bl DrawPixel
// END CHISPAS

Cabeza: // TODO: Terminar

movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

mov x3, 396
mov x4, 168
add x5, x3,24
add x6, x4,12
bl DrawSquare
mov x3, x5
mov x4, x6
add x5, x3,24
add x6, x4,12
bl DrawSquare
mov x3, x5
mov x4, x6
add x5, x3,24
add x6, x4,12
bl DrawSquare
add x3, x3, 12
add x4, x4, 12
add x5, x3, 48
add x6, x4, 12
bl DrawSquare
mov x21, x5
sub x22, x6, 24
bl DrawPixel
add x21, x21, 12
sub x22, x22, 12
bl DrawPixel
add x3, x21, 12
sub x4, x22, 12
add x5, x3, 24
add x6, x4, 12
bl DrawSquare
add x3, x3, 24
add x4, x4, 12
add x5, x3, 12
add x6, x4, 120
bl DrawSquare
add x3, x3, 12
add x4, x4, 48
add x5, x3, 12
add x6, x4, 60
bl DrawSquare
sub x21, x5, 36
add x22, x6, 12
bl DrawPixel
sub x3, x21, 132
add x4, x22, 12
add x5, x3, 132
add x6, x4, 12
bl DrawSquare
sub x21, x3, 12
sub x22, x4, 12
bl DrawPixel
sub x3, x21, 12
sub x4, x22, 120
add x5, x3, 12
add x6, x4, 120
bl DrawSquare
sub x3, x3, 12
add x4, x4, 48
add x5, x3, 12
add x6, x4, 60
bl DrawSquare
//Gris
movz x10, 0xD5D6, lsl 00 // Set color in grey
movk x10, 0x00D8, lsl 16
add x3 ,x3, 12
add x5 ,x3, 180
add x6, x4, 60
bl DrawSquare
add x3, x3, 12
sub x4, x4, 48
add x5, x3, 12
add x6, x4, 120
bl DrawSquare
add x3, x3, 12
add x5, x3, 12
add x6, x4, 132
bl DrawSquare
add x3, x3, 12
add x4, x4, 12
add x5, x3, 24
add x6, x4, 120
bl DrawSquare
add x3, x3, 12
add x4, x4, 12
add x5, x3, 24
add x6, x4, 108
bl DrawSquare
add x3, x3, 12
add x4, x4, 12
add x5, x3, 60
add x6, x4, 96
bl DrawSquare
add x3, x3, 60
sub x4, x4, 12
add x5, x3, 12
add x6, x4, 108
bl DrawSquare
add x3, x3, 12
sub x4, x4, 12
add x5, x3, 12
add x6, x4, 120
bl DrawSquare
add x3, x3, 12
sub x4, x4, 12
add x5, x3, 12
add x6, x4, 132
bl DrawSquare
add x3, x3, 12
add x5, x3, 12
add x6, x4, 120
bl DrawSquare

//Boca y ojos

movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

//Primer ojo
sub x21, x3, 108 //432
add x22, x4, 60 // 240 direccion base de referencia
bl DrawPixel

add x3, x21, 0 //mov x3, 432
add x4, x22, 0 //mov x4, 240
add x5, x21, 24 //mov x5, 456
add x6, x22, 24 //mov x6, 264
bl DrawSquare
movz x10, 0xFFFF, lsl 00 // Set color in white
movk x10, 0x00FF, lsl 16
bl DrawPixel

//Segundo ojo
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16
add x3, x21, 84 //mov x3, 516
add x4, x22, 0 //mov x4, 240
add x5, x21, 108 //mov x5, 540
add x6, x22, 24 //mov x6, 264
bl DrawSquare

movz x10, 0xFFFF, lsl 00 // Set color in white
movk x10, 0x00FF, lsl 16
add x21, x21, 84 //mov x21, 516
//mov x22, 240
bl DrawPixel


//Boca
movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16
sub x21, x21, 72 // mov x21, 444
add x22, x22, 36 //mov x22, 276
bl DrawPixel
add x21, x21, 36 //mov x21, 480
//mov x22, 276
bl DrawPixel
add x21, x21, 36 //mov x21, 516
//mov x22, 276
bl DrawPixel
sub x3, x21, 72 //mov x3, 444
add x4, x22, 12 //mov x4, 288
add x5, x21, 12 //mov x5, 528
add x6, x22, 24 //mov x6, 300
bl DrawSquare

movz x10, 0x0000, lsl 00 // Set color in black
movk x10, 0x0000, lsl 16

//movz x10, 0x3327, lsl 00 // Set color in red BA3327
//movk x10, 0x00BA, lsl 16

sub x21, x21, 24 //mov x21, 492   //Nariz TODO: CONVERTIR A TRIANGULO POR COMPLETITUD
sub x22, x22, 24 //mov x22, 252
bl DrawPixel


// TODO: FIN CABEZA

// MEJILLAS

movz x10, 0x9896, lsl 00 // color mejillas #FD9896
movk x10, 0x00fd, lsl 16
mov x26, 10 // RADIO DEL CIRCULO
add x24, x21, 58 //mov x24,90// coordenada x del centro del circulo teniendo en cuenta un eje cartesiano con el (0,0) en la esquina inferior derecha
mov x13, SCREEN_WIDTH
sub x24, x13, x24
add x25, x22, 182 //mov x25,206 // coordenada y  "" ..
sub x25, x13, x25
bl DrawCircle

mov x26, 10 // RADIO DEL CIRCULO
add x24, x24, 140 //mov x24,230 //
//mov x25,206 //
bl DrawCircle

// FIN MEJILLAS

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

// FUNCION DIBUJAR CIRCULO

DrawCircle:
mov x27,x30 // Guarda la direccion de retorno en x27
mov x0,x20 // LLEVA EL PUNTERO DEL PIXEL AL AL INICIO
mov x2, 480 // GUARDA EN X2 LA CANTIDAD DE FILAS QUE VAMOS A RECORRER
dcLoop:
mov x1,640 // GUARDA EN X2 LA CANTIDAD DE COLUMNAS QUE " ...
dcLoopb:

// funcion si (x-h)² + (y-k)² <= r² ==> pintar , donde x = [640..0], y = [480..0], h = x24 (centro), k = x25 (centro), r = x26 (radio)
sub x11, x1, x24 // x - h
mul x11, x11, x11 // (x - h)²
sub x12, x2, x25 // y - k
mul x12, x12, x12 // (y - k)²
add x12, x11, x12 // (x-h)² + (y-k)²
mul x7, x26, x26 // r²
cmp x12,x7  // si (x-h)² + (y-k)² < r²  ---> pintamos
b.gt dcNoPinta
stur w10,[x0] // Pinta del color de w10

dcNoPinta:
sub x1,x1,1 // x1 - 1
add x0,x0,4 // Next Pixel
cbnz x1,dcLoopb // return

sub x2,x2,1 // Y - 1
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
movz w10,0x3366, lsl 00 // Setea color del fondo

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

mov x22, 9
cmp x21,x22 // COMPARA CONTADOR NUEVE
b.ne skipResetBlue // SI NO TERMINO EL CONTADOR, NO LO RESETEA
movz x21, 0x0001, lsl 00 // Aca usamos x21 porque de todos modos le vamos a borrar el contenido mas adelante
movk x21, 0x0003, lsl 16 // Setea un color para que vaya aumentando el rojo y el azul
add w10,w10,w21 // Suma uno al color AZUL y ROJO
mov x21,0   // RESETEA EL CONTADOR (Aca es donde reseteamos x21 por eso no importa usarlo como color)
skipResetBlue: // Continua el ciclo de 9
add x21,x21,1 // Suma 1 al contador
sub x2,x2,1 // Resta el contador del alto del rectangulo
cbnz x2,dfLoop

DrawFondoReturn:
br lr

end:

InfLoop:
b InfLoop
