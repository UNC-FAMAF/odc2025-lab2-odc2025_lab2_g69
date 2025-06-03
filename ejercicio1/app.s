    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGH,      480
    .equ BITS_PER_PIXEL,    32

    .equ GPIO_BASE,         0x3f200000
    .equ GPIO_GPFSEL0,      0x00
    .equ GPIO_GPLEV0,       0x34

    .globl main
    .global draw_square
	.global draw_rectangle

main:
    // x0 contiene la dirección base del framebuffer
    mov     x20, x0           // Guardar copia en x20

    //---------------------------------------------------------
    // Pintar fondo de color verde (0x00C71585)
    //---------------------------------------------------------
		
		movz    w10, 0x9900, lsl 00  // 0xFF00FF00 
    

    mov     x2, SCREEN_HEIGH     // contador de filas
	loop1:
		mov     x1, SCREEN_WIDTH     // contador de columnas
	loop0:
		str     w10, [x0]            // pintar píxel
		add     x0, x0, 4
		sub     x1, x1, 1
		cbnz    x1, loop0
		sub     x2, x2, 1
		cbnz    x2, loop1

		//---------------------------------------------------------
		// Dibujar cuadrado amarillo
		//---------------------------------------------------------
		mov     x11, #100           // x inicial
		mov     x12, #50            // y inicial
		mov     x13, #32            // tamaño del cuadrado
		mov     x14, x20            // framebuffer base
		movz    w15, 0xFF00, lsl 0
		movk    w15, 0x00FF, lsl 16 // amarillo 0x00FFFF00

		bl      draw_square

		//---------------------------------------------------------
		// Dibujar rectangulo azul
		//---------------------------------------------------------
		mov     x11, #0          // x inicial
		mov     x12, #0        // y inicial
		mov     x13, #640         // ancho (vertical)
		mov     x14, #240        // alto (horizontal)
		mov     x15, x20           // framebuffer base
		movz    w16, 0x0099, lsl 0     // 0x0000FF00 
		movk    w16, 0xFF00, lsl 16    // 0xFF00FF00 

		

		bl      draw_rectangle

//---------------------------------------------------------
		// Dibujar rectangulo marron (tronco)
		//---------------------------------------------------------
		mov     x11, #50         // x inicial
		mov     x12, #350      // y inicial
		mov     x13, #20   // ancho (vertical)
		mov     x14, #90       // alto (horizontal)
		mov     x15, x20           // framebuffer base
		movz    w16, 0x3300, lsl 0     // 0x0000FF00 
		movk    w16, 0xFF66, lsl 16    // 0xFF00FF00 

		

		bl      draw_rectangle


		//---------------------------------------------------------
		// Dibujar triangulo verde
		//---------------------------------------------------------
        
        mov     x11, #150         // x inicial
		mov     x12, #200          // y inicial
        mov     x13, #200           // altura
        mov     x14, x20           // framebuffer base
		movz    w15, 0x0000, lsl 0     // 0x0000FF00 
		movk    w15, 0x00CC, lsl 16    // 0xFF00FF00 

        bl draw_triangle
    //---------------------------------------------------------
    // Leer GPIO (opcional)
    //---------------------------------------------------------
    mov     x9, GPIO_BASE
    str     wzr, [x9, GPIO_GPFSEL0] // configurar entrada
    ldr     w10, [x9, GPIO_GPLEV0]
    and     w11, w10, 0b10
    lsr     w11, w11, 1


    //---------------------------------------------------------
    // Dibujar círculo amarillo
    //---------------------------------------------------------
    mov     x11, #320        // centro x
    mov     x12, #240        // centro y
    mov     x13, #50         // radio
    mov     x14, x20         // framebuffer base
    movz    w15, 0xFF00, lsl 0
    movk    w15, 0x00FF, lsl 16   // rojo: 0x00FF0000

    bl      draw_circle

InfLoop:
    b       InfLoop



//
//						   _                _   _                 
//				 ___ _   _| |__  _ __ _   _| |_(_)_ __   __ _ ___ 
//				/ __| | | | '_ \| '__| | | | __| | '_ \ / _` / __|
//				\__ \ |_| | |_) | |  | |_| | |_| | | | | (_| \__ \
//				|___/\__,_|_.__/|_|   \__,_|\__|_|_| |_|\__,_|___/
//				/ / _|_   _ _ __   ___(_) ___  _ __   ___  __\ \ 
//				| | |_| | | | '_ \ / __| |/ _ \| '_ \ / _ \/ __| |
//				| |  _| |_| | | | | (__| | (_) | | | |  __/\__ \ |
//				| |_|  \__,_|_| |_|\___|_|\___/|_| |_|\___||___/ |
//				\_\                                          /_/ 
//

//---------------------------------------------------------
// Subrutina: draw_square
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
// x14 = framebuffer base
// x15 = color
//---------------------------------------------------------
draw_square:
    // Guardamos la altura restante en x16 (contador vertical)
    mov     x16, x13            // x16 = altura del cuadrado (filas restantes)

    // y_actual = y inicial -> usamos x17 como y_actual
    mov     x17, x12            // x17 = fila actual

.loop_y_sq:
    // Ancho restante en x18 (contador horizontal)
    mov     x18, x13            // x18 = ancho del cuadrado (columnas restantes)

    // x_actual = x inicial -> usamos x19 como x_actual
    mov     x19, x11            // x19 = columna actual

.loop_x_sq:
    // Calcular offset en memoria: offset = (y_actual * SCREEN_WIDTH + x_actual) * 4
    mov     x22, x17            // x22 = y_actual
    mov     x21, SCREEN_WIDTH   // x21 = SCREEN_WIDTH
    mul     x22, x22, x21       // x22 = y_actual * SCREEN_WIDTH
    add     x22, x22, x19       // x22 = y_actual * SCREEN_WIDTH + x_actual
    lsl     x22, x22, 2         // x22 = offset en bytes (4 bytes por píxel)

    // Escribir color en framebuffer[offset]
    str     w15, [x14, x22]     // framebuffer[offset] = color

    // Incrementar columna actual y decrementar contador horizontal
    add     x19, x19, 1         // x_actual++
    subs    x18, x18, 1         // columnas restantes--
    b.ne    .loop_x_sq             // si columnas restantes ≠ 0, repetir loop_x_sq

    // Incrementar fila actual y decrementar contador vertical
    add     x17, x17, 1         // y_actual++
    subs    x16, x16, 1         // filas restantes--
    b.ne    .loop_y_sq          // si filas restantes ≠ 0, repetir loop_y_sq

    ret                         // retornar al programa que llamó

//---------------------------------------------------------
// Subrutina: draw_rectangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño x
// x14 = tamaño y
// x15 = framebuffer base
// x16 = color
//---------------------------------------------------------

draw_rectangle :

	// inicializamos el contador de Y
	mov x17, x14
	// guardamos la posicion de y en x18
	mov x18,x12

loop_y_rec:
	// inicializamos el contador de x con el valor inicial 
	mov x19, x13
	//guardamos la posicion incial de x
	mov x21, x11

loop_x_rec: 
    // Calcular offset
    mov     x24, x18           // y_actual
    mov     x23, SCREEN_WIDTH
    mul     x24, x24, x23      // y * SCREEN_WIDTH
    add     x24, x24, x21      // + x_actual
    lsl     x24, x24, 2        // * 4 (bytes por pixel)

    // Escribir pixel
    str     w16, [x15, x24]    // framebuffer[offset] = color

    // Incrementar x_actual y continuar
    add     x21, x21, 1
    subs    x19, x19, 1
    b.ne    loop_x_rec


    // Incrementar y_actual y decrementar contador vertical
    add     x18, x18, 1
    subs    x17, x17, 1
    b.ne    loop_y_rec

    ret

//---------------------------------------------------------
// Subrutina: draw_circle
//---------------------------------------------------------
// Entradas:
// x11 = centro_x
// x12 = centro_y
// x13 = radio
// x14 = framebuffer base
// x15 = color
//---------------------------------------------------------

draw_circle:
    // Guardar registros
    stp x19, x20, [sp, #-16]!

    // r² = x13 * x13
    mul x16, x13, x13        // x16 = radio²

    mov x17, #0              // y = 0
.loop_y_circle:
    cmp x17, SCREEN_HEIGH
    bge .end_circle

    mov x18, #0              // x = 0
.loop_x_circle:
    cmp x18, SCREEN_WIDTH
    bge .next_row_circle

    // dx = x - centro_x
    sub x19, x18, x11
    // dy = y - centro_y
    sub x20, x17, x12
    // dx² + dy²
    mul x21, x19, x19
    mul x22, x20, x20
    add x23, x21, x22
    cmp x23, x16
    bgt .skip_pixel_circle

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x24, x17
    mov x20, SCREEN_WIDTH
    mul x24, x24, x20
    add x24, x24, x18
    lsl x24, x24, 2

    str w15, [x14, x24]

.skip_pixel_circle:
    add x18, x18, #1
    b .loop_x_circle

.next_row_circle:
    add x17, x17, #1
    b .loop_y_circle

.end_circle:
    ldp x19, x20, [sp], #16
    ret

//---------------------------------------------------------
// Subrutina: draw_triangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
// x14 = framebuffer base
// x15 = color
//---------------------------------------------------------

draw_triangle :

    mov x16, x12  //variable que recorre de arriba hacia abajo y
    mov x17, x11  //inicio del triangulo en x
    mov x18, x11 //final del triangulo en x
    

loop_y_tri :
    //inicia con la parte superior del triangulo
    mov x19, x16 //variable que va a pintar los pixeles, coordenada y
    mov x22, x17 //variable que ca a pintar los pixeles, coordenada x

loop_x_tri :
    //inicia el recorrido de inzquierda a derecha
    // Calcular offset
    mov     x24, x19           // y_actual
    mov     x23, SCREEN_WIDTH
    mul     x24, x24, x23      // y * SCREEN_WIDTH
    add     x24, x24, x22      // + x_actual
    lsl     x24, x24, 2        // * 4 (bytes por pixel)

    // Calculo el offset
    str     w15, [x14, x24]    // framebuffer[offset] = color
    mov     x24, x19           // y_actual
    add     x24, x24, 1
    mov     x23, SCREEN_WIDTH
    mul     x24, x24, x23      // y * SCREEN_WIDTH
    add     x24, x24, x22      // + x_actual
    lsl     x24, x24, 2        // * 4 (bytes por pixel)

    // Escribir pixel
    str     w15, [x14, x24]    // framebuffer[offset] = color

    // Incrementar x_actual y continuar
    
    cmp x22, x18 //ver si ya llegue al final del triangulo en x
    add     x22, x22, 1
    b.ne    loop_x_tri

    //bajar a la fila de abajo
    add x16, x16, 2
    sub x17, x17, 1 //inicio triangulo un pixel menos
    add x18, x18, 1 //final triangulo un pixel mas
    sub x21, x16, x13
    cmp x21, x12
    b.ne loop_y_tri
    
    ret
