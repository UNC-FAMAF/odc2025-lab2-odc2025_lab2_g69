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
		movz    w16, 0x3300, lsl 0     // 0x0000FF00 
		movk    w16, 0xFF66, lsl 16    // 0xFF00FF00 

		

		bl      draw_rectangle


//---------------------------------------------------------
// Dibujar triangulo verde
//---------------------------------------------------------
        
        mov     x11, #150         // x inicial
		mov     x12, #200          // y inicial
        mov     x13, #200           // altura
		movz    w15, 0x0000, lsl 0     // 0x0000FF00 
		movk    w15, 0x00CC, lsl 16    // 0xFF00FF00 

        bl draw_triangle

        //---------------------------------------------------------
		// Dibujar arbol de frente
		//---------------------------------------------------------
		mov     x11, #50         // x inicial
		mov     x12, #350        // y inicial
        mov     x13, #100        // tamaño

        bl draw_tree

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
    mov     x11, #400        // centro x
    mov     x12, #30        // centro y
    mov     x13, #50         // radio
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
// Pisa: 16, 17, 18, 19, 21, 22
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
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
    str     w15, [x20, x22]     // framebuffer[offset] = color

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
// Pisa: 17, 18, 19, 21, 23, 24
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño x
// x14 = tamaño y
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
    str     w16, [x20, x24]    // framebuffer[offset] = color

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
// Pisa: 16, 17, 18, 21 ,22 , 23, 24
//---------------------------------------------------------
// Entradas:
// x11 = centro_x
// x12 = centro_y
// x13 = radio
// x15 = color
//---------------------------------------------------------

draw_circle:
    // Guardar registros
    stp x19, x20, [sp, #-16]!

    // r**2 = x13 * x13
    mul x16, x13, x13        // x16 = radio**2

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

    str w15, [x20, x24]

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
// Pisa: 16, 17, 18, 19, 21, 22, 23, 24
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
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
    str     w15, [x20, x24]    // framebuffer[offset] = color
    mov     x24, x19           // y_actual
    add     x24, x24, 1
    mov     x23, SCREEN_WIDTH
    mul     x24, x24, x23      // y * SCREEN_WIDTH
    add     x24, x24, x22      // + x_actual
    lsl     x24, x24, 2        // * 4 (bytes por pixel)

    // Escribir pixel
    str     w15, [x20, x24]    // framebuffer[offset] = color

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

//---------------------------------------------------------
// Subrutina: draw_tree
// Pisa: 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
//---------------------------------------------------------

draw_tree :
    //guardo direccion para poder saltar a cualquier forma
    mov x29, x30
    //guardo datos del arbol para reestablecer luego
    mov x28, x11
    mov x27, x12
    //Primer triangulo
	movz    w15, 0x0000, lsl 0     // verde
	movk    w15, 0x8F39, lsl 16    // verde
    bl draw_triangle
    lsr x14, x13, #1 //mitad del tamaño del triangulo
    add x12, x12, x14 //proximo triangulo se crea en el medio del triangulo anterior
    bl draw_triangle
    add x12, x12, x14 //proximo triangulo se crea en el medio del triangulo anterior
    bl draw_triangle
    //Tronco
    add x12, x12, x13 //el rectangulo comienza en la base del ultimo triangulo
    mov x14, x14 //tamaño del tronco
    lsr x13, x14, #1 //un cuarto del tamaño, para un tronco fino
    lsr x14, x14, #1 // un octavo del tronco, me servira para centrarlo luego
    sub x11, x11, x14 // con esto el tronco quedará centrado
    movz    w16, 0x004B, lsl 0     // marron
	movk    w16, 0x3621, lsl 16    // marron
    bl draw_rectangle
    //Reestablezco las variables anteriores
    mov x30, x29
    mov x11, x28
    mov x12, x27

    ret
    
//---------------------------------------------------------
// Subrutina: pixel_triangle {-PRE: altura multiplo de 10-}
// Pisa: 14, 22, 24, 25, 26, 27
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
// x16 = color
//---------------------------------------------------------

pixel_triangle :
    mov x24, x11  //guardo para no perderlo
    mov x25, x12  //guardo para no perderlo
    mov x26, x13 //guardo para no perderlo
    mov x22, x18 //decrementare esto para saber cuanto falta
    mov x13, 0x5 //final del triangulo en x
    mov x14, 0x10 //altura de cada parte del triangulo
    mov x27, x30 //voy a usar rectangulo, asi que tengo que guardar direccion

loop_y_pixtri :
    //dibuja una parte del triangulo
    b draw_rectangle

    //bajar a la fila de abajo
    sub x11, x11, 0x5  //inicio del proximo rectangulo mas a la izquierda que el anterior
    add x12, x12, x14  //proximo rectangulo justo debajo del anterior
    add x13, x13, x14 // final del proximo rectangulo mas a la derecha que el anterior
    sub x22, x22, x14 //decremento el contador
    bcnz x22 loop_y_pixtri //me fijo si el contador llego a 0
    //reestablezco los valores iniciales
    mov x11, x24
    mov x12, x25
    mov x13, x26
    mov x30, x27
    
    ret

//---------------------------------------------------------
// Subrutina: pixel_tree
// Pisa 1, 2, 3, 4, 14, 15, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 29
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
// x16 = color
//---------------------------------------------------------

pixel_tree :
    //guardo direccion para poder saltar a cualquier forma
    mov x29, x30
    //guardo datos del arbol para reestablecer luego
    mov x1, x11
    mov x2, x12
    mov x3, x13
    mov x4, x16
    //Primer triangulo
    bl pixel_triangle
    lsr x15, x13, #1 //mitad del tamaño del triangulo
    add x12, x12, x15 //proximo triangulo se crea en el medio del triangulo anterior
    bl pixel_triangle
    add x12, x12, x15 //proximo triangulo se crea en el medio del triangulo anterior
    bl pixel_triangle
    //Tronco
    add x12, x12, x13 //el rectangulo comienza en la base del ultimo triangulo
    mov x14, x15 //tamaño del tronco
    lsr x13, x15, #1 //un cuarto del tamaño, para un tronco fino
    lsr x15, x15, #1 // un octavo del tronco, me servira para centrarlo luego
    sub x11, x11, x15 // con esto el tronco quedará centrado
    movz    w16, 0x004B, lsl 0     // marron
	movk    w16, 0x3621, lsl 16    // marron
    bl draw_rectangle
    //Reestablezco las variables anteriores
    mov x30, x29
    mov x11, x1
    mov x12, x2
    mov x13, x3
    mov x16, x4

    ret

