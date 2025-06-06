<<<<<<< HEAD
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
    // Pintar fondo de color verde 
    //---------------------------------------------------------
		
		movz    w10, 0x9900, lsl 0  
  
        
    

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
		// Dibujar rectangulo azul
		//---------------------------------------------------------
		mov     x11, #0          // x inicial
		mov     x12, #0        // y inicial
		mov     x13, #640         // ancho (vertical)
		mov     x14, #240        // alto (horizontal)
		movz    w16, 0x80FF, lsl 0     // 0x0000FF00 
		

		

		bl      draw_rectangle

      
    //---------------------------------------------------------
    // Dibujar círculo amarillo
    //---------------------------------------------------------
    mov     x11, #400        // centro x
    mov     x12, #30        // centro y
    mov     x13, #50         // radio
    movz    w15, 0xFF66, lsl 0
    movk    w15, 0x00FF, lsl 16   // rojo: 0x00FF0000


    bl      draw_circle
    


    //---------------------------------------------------------
    // aca dibujamos arboles
    //---------------------------------------------------------
    //---------------------------------------------------------
    // ultima fila de arboles
    //---------------------------------------------------------
  
  
    //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 70   // posicion en x
    mov x12, 125    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 200   // posicion en x
    mov x12, 123    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 380   // posicion en x
    mov x12, 110    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 600   // posicion en x
    mov x12, 135    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
     //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------
    mov x11, 115   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 
    bl sombra_tree
    mov x11, 120   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x6600, lsl 0    
    movk    w16, 0x0066, lsl 16 

    bl draw_tree 

        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------


    mov x11, 315   // posicion en x
    mov x12, 130    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 
    bl sombra_tree

    mov x11, 320   // posicion en x
    mov x12, 130    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x6600, lsl 0    
    movk    w16, 0x0066, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------
    mov x11, 505   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 
    bl sombra_tree
    mov x11, 500   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x6600, lsl 0    
    movk    w16, 0x0066, lsl 16 

    bl draw_tree 

    //---------------------------------------------------------
    // Dibujar ODC2025
    //---------------------------------------------------------
    mov x5, 210
    mov x6, -145
    movz    w16, 0x3621, lsl 0
    movk    w16, 0x004B, lsl 16
    bl draw_odc
    mov x5, 215
    mov x6, -150
    movz    w16, 0xFD96, lsl 0
    movk    w16, 0x00FD, lsl 16
    bl draw_odc

    //---------------------------------------------------------
    // Dibujar Nube
    //---------------------------------------------------------

    mov x11, 70
    mov x12, 50
    movz    w15, 0xFFFF, lsl 0
    movk    w15, 0x00FF, lsl 16
    bl nube
   
    //---------------------------------------------------------
    // Dibujar Sonix, (no funciona la animacion con el Sonic, ignorenlo)
    //---------------------------------------------------------
/* 	mov     x11, #100          // x inicial
	mov     x12, #350          // y inicial
	mov     x13, x20           // framebuffer base
    bl draw_sonic
*/
InfLoop:
    mov x5, 500
    mov x11, 0
    mov x12, 50
// x11 = x inicial
// x12 = y inicial
// x15 = color
buclenube:
    add x11, x11, 2
    mov x1, x11
    //Tapo la nube anterior
	mov     x11, #0          // x inicial
	mov     x12, #0        // y inicial
	mov     x13, #640         // ancho (vertical)
	mov     x14, #100        // alto (horizontal)
	movz    w16, 0x80FF, lsl 0     // 0x0000FF00 
	bl      draw_rectangle
    //Dibujo el sol que se tapo
    mov     x11, #400        // centro x
    mov     x12, #30        // centro y
    mov     x13, #50         // radio
    movz    w15, 0xFF66, lsl 0
    movk    w15, 0x00FF, lsl 16   // rojo: 0x00FF0000
    bl      draw_circle   
    //Muevo la nube 
    mov x11, x1
    movz    w15, 0xFFFF, lsl 0
    movk    w15, 0x00FF, lsl 16
    bl nube
    bl delay
    sub x5, x5, 1
    cbnz x5, buclenube

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
// Subrutina: draw_rectangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño x
// x14 = tamaño y
// x16 = color
//---------------------------------------------------------

draw_rectangle :
    sub sp, sp, 56
    str x17, [sp, 48]
    str x19, [sp, 40]
    str x18, [sp, 32]
    str x21, [sp, 24]
    str x24, [sp, 16]
    str x23, [sp, 8]
    str lr, [sp]
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

    ldr lr, [sp]
    ldr x17, [sp, 48]
    ldr x19, [sp, 40]
    ldr x18, [sp, 32]
    ldr x21, [sp, 24]
    ldr x24, [sp, 16]
    ldr x23, [sp, 8]
    add sp, sp, 56
    ret

//---------------------------------------------------------
// Subrutina: draw_circle
//---------------------------------------------------------
// Entradas:
// x11 = centro_x
// x12 = centro_y
// x13 = radio
// x15 = color
//---------------------------------------------------------

draw_circle:
    sub sp, sp, 80
    str x24, [sp, 72]
    str x23, [sp, 64]
    str x22, [sp, 56]
    str x21, [sp, 48]
    str x14, [sp, 40]
    str x19, [sp, 32]
    str x18, [sp, 24]
    str x17, [sp, 16]
    str x16, [sp, 8]
    str lr, [sp]
    // Guardar registros
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
    sub x14, x17, x12
    // dx**2 + dy**2
    mul x21, x19, x19
    mul x22, x14, x14
    add x23, x21, x22
    cmp x23, x16
    bgt .skip_pixel_circle

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x24, x17
    mov x14, SCREEN_WIDTH
    mul x24, x24, x14
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

    ldr lr, [sp]
    ldr x24, [sp, 72]
    ldr x23, [sp, 64]
    ldr x22, [sp, 56]
    ldr x21, [sp, 48]
    ldr x14, [sp, 40]
    ldr x19, [sp, 32]
    ldr x18, [sp, 24]
    ldr x17, [sp, 16]
    ldr x16, [sp, 8]
    add sp, sp, 80
    
    ret
//---------------------------------------------------------
// Subrutina: draw_triangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
// x15 = color
//---------------------------------------------------------
    
draw_triangle :

    sub sp, sp, 64
    str x23, [sp, 56]
    str x24, [sp, 48]
    str x16, [sp, 40]
    str x17, [sp, 32]
    str x18, [sp, 24]
    str x19, [sp, 16]
    str x22, [sp, 8]
    str lr, [sp]

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
    
    ldr lr, [sp]
    ldr x23, [sp, 56]
    ldr x24, [sp, 48]
    ldr x16, [sp, 40]
    ldr x17, [sp, 32]
    ldr x18, [sp, 24]
    ldr x19, [sp, 16]
    ldr x22, [sp, 8]
    add sp, sp, 64
    
    ret

//---------------------------------------------------------
// Subrutina: draw_tree
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
// x16 = color
//---------------------------------------------------------

draw_tree :

    sub sp, sp, 52
    str x16, [sp, 48]
    str x14, [sp, 40]
    str x25, [sp, 32]
    str x27, [sp, 24]
    str x28, [sp, 16]
    str x29, [sp, 8]
    str lr, [sp]

    //guardo direccion para poder saltar a cualquier forma
    mov x29, x30
    //guardo datos del arbol para reestablecer luego
    mov x28, x11
    mov x27, x12
    //Primer triangulo

    bl pixel_triangle
    lsr x25, x13, #1 //mitad del tamaño del triangulo
    add x12, x12, x25 //proximo triangulo se crea en el medio del triangulo anterior
    add x13, x13, x25
    bl pixel_triangle
    //Tronco
    add x12, x12, x13 //el rectangulo comienza en la base del ultimo triangulo
    mov x14, x25 //tamaño del tronco
    lsr x13, x25, #1 //un cuarto del tamaño, para un tronco fino
    lsr x25, x25, #2 // un octavo del tronco, me servira para centrarlo luego
    sub x11, x11, x25 // con esto el tronco quedará centrado
    movz    w16, 0x3621, lsl 0     // marron
	movk    w16, 0x004B, lsl 16    // marron
    bl draw_rectangle
    //Reestablezco las variables anteriores
    mov x30, x29
    mov x11, x28
    mov x12, x27
    ldr lr, [sp]
    ldr x16, [sp, 48]
    ldr x14, [sp, 40]
    ldr x25, [sp, 32]
    ldr x27, [sp, 24]
    ldr x28, [sp, 16]
    ldr x29, [sp, 8]
    add sp, sp, 52
    ret
   
//---------------------------------------------------------
// Subrutina: sombra_tree
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
// x16 = color
//---------------------------------------------------------

sombra_tree :

    sub sp, sp, 52
    str x16, [sp, 48]
    str x14, [sp, 40]
    str x25, [sp, 32]
    str x27, [sp, 24]
    str x28, [sp, 16]
    str x29, [sp, 8]
    str lr, [sp]

    //guardo direccion para poder saltar a cualquier forma
    mov x29, x30
    //guardo datos del arbol para reestablecer luego
    mov x28, x11
    mov x27, x12
    //Primer triangulo

    bl pixel_triangle
    lsr x25, x13, #1 //mitad del tamaño del triangulo
    add x12, x12, x25 //proximo triangulo se crea en el medio del triangulo anterior
    add x13, x13, x25
    bl pixel_triangle
    //Tronco
    add x12, x12, x13 //el rectangulo comienza en la base del ultimo triangulo
    mov x14, x25 //tamaño del tronco
    lsr x13, x25, #1 //un cuarto del tamaño, para un tronco fino
    lsr x25, x25, #2 // un octavo del tronco, me servira para centrarlo luego
    sub x11, x11, x25 // con esto el tronco quedará centrado
    movz    w16, 0x0000, lsl 0     // marron
	movk    w16, 0x0000, lsl 16    // marron
    bl draw_rectangle
    //Reestablezco las variables anteriores
    mov x30, x29
    mov x11, x28
    mov x12, x27
    ldr lr, [sp]
    ldr x16, [sp, 48]
    ldr x14, [sp, 40]
    ldr x25, [sp, 32]
    ldr x27, [sp, 24]
    ldr x28, [sp, 16]
    ldr x29, [sp, 8]
    add sp, sp, 52
    ret
   
    // ----------------------------------------------------------
    // Subrutina: delay
    // ----------------------------------------------------------



delay:
    sub sp, sp, 24
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]


    mov x11, 0x1111 //Cambiar velocidad con esto
    loopdelay:
    mov x12, x11
    sub x11, x11, 1
    loopotro:
    sub x12, x12, 1
    cbnz x12, loopotro
    cbnz x11, loopdelay

    ldr lr, [sp]
    ldr x12, [sp, 16]
    ldr x11, [sp, 8]
    add sp, sp, 24
    ret



//----------------------------------------------------------------------------------
//-----  ODC 2025,
//  x5 para lugar en x
//  x6 para posicion y
//  x16 para color
//----------------------------------------------------------------------------------
    
    //---------------------------------------------------------
    // Dibujar letra O 
    //---------------------------------------------------------
    draw_odc:
    sub sp, sp, 48
    str x29, [sp, 40]
    str x14, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x29, x30
	// Dibuja la linea mas a la izquierda
	add     x11, x5, #30         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle
	
	// Dibuja la parte superior de la O
	add     x11, x5, #30         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x13, #45   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte mas a la derecha de la  O 
	add     x11, x5, #75         // x inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte inferior de la O
	add     x11, x5, #35         // x inicial
	add     x12, x6, #400      // y inicial
	mov     x13, #50   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

	//---------------------------------------------------------
    // Dibujar letra D
    //---------------------------------------------------------
	
	// Dibuja la parte mas a la izquieda de la D
	add     x11, x5, #95         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle
	
	// Dibuja los pixeles de la "panza" (arriba)
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10      // alto (vertical)

	bl      draw_rectangle
	
	// Dibuja los pixeles de la "panza" (abajo)
	add     x12, x6, #400      // y inicial

	bl      draw_rectangle

	//-----------------------------------------------------
	// OJO, ESTE PEDACITO DIBUJA UN PIXEL, PUEDE SERVIR!!
	//-----------------------------------------------------
	// Dibuja UN pixel de la "panza" (abajo)

	add     x11, x5, #125         // x inicial
	add     x12, x6, #390      // y inicial
	mov     x13, #10   // ancho (horizontal)

	bl      draw_rectangle


	// Dibuja UN pixel de la "panza" (arriba)
	
	add     x12, x6, #360      // y inicial

	bl      draw_rectangle


	// Cierra la "panza" de la D
	add     x12, x6, #370      // y inicial
	mov     x14, #20      // alto (vertical)

	bl      draw_rectangle



	//---------------------------------------------------------
    // Dibujar letra C
    //---------------------------------------------------------

    // Dibuja el palito vertical de la C

	add     x11, x5, #145         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x14, #60       // alto (vertical)

    bl draw_rectangle

    // Dibuja la linea de arriba
    add     x11, x5, #145         // x inicial
	mov     x13, #42   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle
    
    // Dibuja la linea de abajo
    add     x11, x5, #145         // x inicial
	add     x12, x6, #400      // y inicial

    bl draw_rectangle


    //---------------------------------------------------------
    // Dibujar número 2
    //---------------------------------------------------------


    //Primer pixel del 2

    add     x11, x5, #10         // x inicial
	add     x12, x6, #430      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Cabeza del 2

    add     x11, x5, #20         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Costado derecho de la cabeza

    add     x11, x5, #40         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #30       // alto (vertical)

    bl draw_rectangle

    // Parte media del 2
    add     x11, x5, #10         // x inicial
	add     x12, x6, #450      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Patita izquierda del 2 
   
    add     x11, x5, #10         // x inicial
	add     x12, x6, #460      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #20       // alto (vertical)

    bl draw_rectangle

    // Linea final (piso) 

    add     x11, x5, #20         // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    //---------------------------------------------------------
    // Dibujar número 0 
    //---------------------------------------------------------

    // Dibuja la linea mas a la izquierda
	add     x11, x5, #55         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)
    
    bl      draw_rectangle

    // Dibuja la parte superior del 0
	add     x11, x5, #55         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #45   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte mas a la derecha del 0 
	add     x11, x5, #90         // x inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte inferior del 0
	add     x11, x5, 55         // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #45   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    //---------------------------------------------------------
    // Dibujar número 2 
    //---------------------------------------------------------

    //Primer pixel del 2

    add     x11, x5, #110         // x inicial
	add     x12, x6, #430      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Cabeza del 2

    add     x11, x5, #120         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Costado derecho de la cabeza

    add     x11, x5, #140         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #30       // alto (vertical)

    bl draw_rectangle

    // Parte media del 2
    add     x11, x5, #110         // x inicial
	add     x12, x6, #450      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Patita izquierda del 2 
   
    add     x11, x5, #110         // x inicial
	add     x12, x6, #460      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #20       // alto (vertical)

    bl draw_rectangle

    // Linea final (piso) 

    add     x11, x5, #120         // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle


    //---------------------------------------------------------
    // Dibujar número 5 
    //---------------------------------------------------------


   

    // Dibujo la cabeza del 5

    add     x11, x5, #160        // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #40   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle
   
   // Dibujo la bajada de la cabeza del 5
    add     x11, x5, #160        // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #25       // alto (vertical)

	bl      draw_rectangle

    // Parte media del 5
    add     x11, x5, #170        // x inicial
	add     x12, x6, #445      // y inicial
	mov     x13, #20   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    // Bajada a la panza del 5

    add     x11, x5, #190        // x inicial
	add     x12, x6, #455      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #20       // alto (vertical)

	bl      draw_rectangle

    // Panza del 5

    add     x11, x5, #175        // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #20   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    // Piso del 5

    add     x11, x5, #165        // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    add     x12, x6, #470      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle
    mov x30,x29
    ldr lr, [sp]
    str x29, [sp, 40]
    str x14, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    add sp, sp, 48
ret 

//---------------------------------------------------------
// Subrutina: pixel_triangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
// x16 = color
//---------------------------------------------------------
    
pixel_triangle :

    sub sp, sp, 64
    str x29, [sp, 56]
    str x18, [sp, 48]
    str x13, [sp, 40]
    str x14, [sp, 32]
    str x17, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x29, x30
    mov x17, x13
    mov x14, 10
    mov x13, 5
    mov x18, 0
looppix:
    bl draw_rectangle
    sub x11, x11, 5
    add x12, x12, 10
    add x13, x13, 10
    add x18, x18, 10
    cmp x17, x18
    b.GT looppix


    mov x30, x29
    ldr lr, [sp]
    ldr x29, [sp, 56]
    ldr x18, [sp, 48]
    ldr x13, [sp, 40]
    ldr x14, [sp, 32]
    ldr x17, [sp, 24]
    ldr x12, [sp, 16]
    ldr x11, [sp, 8]
    add sp, sp, 64
    
    ret

//---------------------------------------------------------
// Subrutina: nube
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x15 = color
//---------------------------------------------------------

nube: 
    sub sp, sp, 40
    str x30, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x13, 25
    bl draw_circle
    mov x13, 40
    add x11, x11, 40
    bl draw_circle
    add x11, x11, 30
    mov  x13, 30
    add x12, x12, 10
    bl draw_circle

    ldr lr, [sp]
    ldr x30, [sp, 32]
    ldr x13, [sp, 24]
    ldr x12, [sp, 16]
    ldr x11, [sp, 8]
    add sp, sp, 40
    ret
 
    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGH,      480

    .global draw_sonic


draw_sonic:
        mov x25, x11 //guardo el x inicial
        mov x26, x12 //guardo el y inicial
        mov x27, x13 //guardo el frame buffer
        sub sp, sp, #8
        str x30, [sp, #0]
        //      picos
            //      pico 1
                mov      x11, x25
                add      x11, x11, #34
                mov      x12, x26
                add      x12, x12, #15
                mov      x13, #27
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #13
                mov      x12, x26
                add      x12, x12, #26
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      circuloparahernan

            //      pico 2
                mov      x11, x25
                add      x11, x11, #31
                mov      x12, x26
                add      x12, x12, #34
                mov      x13, #27
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #14
                mov      x12, x26
                add      x12, x12, #47
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      circuloparahernan
                
            //      pico 3
                mov      x11, x25
                add      x11, x11, #37
                mov      x12, x26
                add      x12, x12, #54
                mov      x13, #26
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #22
                mov      x12, x26
                add      x12, x12, #66
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      circuloparahernan


            //      pico 4
                mov      x11, x25
                add      x11, x11, #41
                mov      x12, x26
                add      x12, x12, #70
                mov      x13, #22
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #26
                mov      x12, x26
                add      x12, x12, #82
                mov      x13, #21
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)


                bl      circuloparahernan

                mov     x11, x25           // x inicial
                add     x11, x11, #45
                mov     x12, x26           // y inicial
                add     x12, x12, #34
                mov     x13, #50           // ancho (vertical)
                mov     x14, #60           // alto (horizontal)
                mov     x15, x27           // framebuffer base
                movz    w16, 0x9900, lsl 0     // 0x0000FF00 

                bl      draw_rectangle
        //      pecho
            //      cuerpito
                mov      x11, x25
                add      x11, x11, #49
                mov      x12, x26
                add      x12, x12, #55
                mov     x13, #17             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan
                mov      x11, x25
                add      x11, x11, #49
                mov      x12, x26
                add      x12, x12, #57
                mov      x13, #17             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  
                bl      circuloparahernan

        //      piernas
            //  pierna izq

                mov     x28, #0
                loop_leg1:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    add     x12, x12, #66
                    mov     x13, x25           // x final
                    add     x13, x13, #36
                    mov     x14, x26           // y final
                    add     x14, x14, #100
                    movz    w15, 0x3B5, lsl 0
                    movk    w15, 0x003, lsl 16 

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #6

                    b.ne    loop_leg1

                //    pie 1
                    mov     x28, #0
                loop_foot0:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #35
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #29
                    mov     x14, x26           // y final
                    add     x14, x14, #107
                    movz    w15, 0x00FF, lsl 16

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot0

                    mov     x28, #0
                loop_foot01:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #41
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #29
                    mov     x14, x26           // y final
                    add     x14, x14, #108
                    movz    w15, 0x00FF, lsl 16

                    add     x12, x12, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #8

                    b.ne    loop_foot01

                    mov     x28, #0
                loop_foot1:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #35
                    mov     x12, x26           // y inicial
                    add     x12, x12, #98
                    mov     x13, x25           // x final
                    add     x13, x13, #42
                    mov     x14, x26           // y final
                    add     x14, x14, #99
                    movz    w15, 0x00FF, lsl 16
                    movk    w15, 0xFFFF, lsl 0

                    add     x12, x12, x28
                    add     x14, x14, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot1
            //  pierna derecha
                    mov     x28, #0
                loop_leg2:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #52
                    mov     x12, x26           // y inicial
                    add     x12, x12, #66
                    mov     x13, x25           // x final
                    add     x13, x13, #58
                    mov     x14, x26           // y final
                    add     x14, x14, #100
                    movz    w15, 0x3B5, lsl 0
                    movk    w15, 0x003, lsl 16 

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #6

                    b.ne    loop_leg2

                //    pie 2
                    mov     x28, #0
                loop_foot2:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #60
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #64
                    mov     x14, x26           // y final
                    add     x14, x14, #107
                    movz    w15, 0x00FF, lsl 16

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot2

                    mov     x28, #0
                loop_foot21:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #58
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #71
                    mov     x14, x26           // y final
                    add     x14, x14, #108
                    movz    w15, 0x00FF, lsl 16

                    add     x12, x12, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #8

                    b.ne    loop_foot21

                    mov     x28, #0
                loop_foot3:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    add     x12, x12, #98
                    mov     x13, x25           // x final
                    add     x13, x13, #57
                    mov     x14, x26           // y final
                    add     x14, x14, #99
                    movz    w15, 0x00FF, lsl 16
                    movk    w15, 0xFFFF, lsl 0

                    add     x12, x12, x28
                    add     x14, x14, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot3

            //     piel

                mov      x11, x25
                add      x11, x11, #52
                mov      x12, x26
                add      x12, x12, #55
                mov     x13, #11             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan
                
                mov      x11, x25
                add      x11, x11, #52
                mov      x12, x26
                add      x12, x12, #57
                mov     x13, #11             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan
        //      Cabeza

            mov      x11, x25
            add      x11, x11, #48
            mov      x12, x26
            add      x12, x12, #17        
            mov     x13, #25             // radio
            mov     x14, x27             // framebuffer base
            movz    w15, 0x03B5, lsl 0
            movk    w15, 0x0003, lsl 16  

            bl      circuloparahernan
            //      ojos
                // ----rectangulo union----
                    mov     x11, x25           // x inicial
                    add     x11, x11, #47
                    mov     x12, x26           // y inicial
                    add     x12, x12, #20
                    mov     x13, #17           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    movz    w16, 0xFFFF, lsl 0
                    movk    w16, 0x00FF, lsl 16    // 0x00FFFFFF

                    bl      draw_rectangle
                //  ---ojo izq
                    mov      x11, x25
                    add      x11, x11, #45
                    mov      x12, x26
                    add      x12, x12, #12        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #46
                    mov      x12, x26
                    add      x12, x12, #16        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #47
                    mov      x12, x26
                    add      x12, x12, #18        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan
                    
                    mov      x11, x25
                    add      x11, x11, #47
                    mov      x12, x26
                    add      x12, x12, #20        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #49
                    mov      x12, x26
                    add      x12, x12, #21        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0x0000, lsl 0
                    movk    w15, 0x0000, lsl 16  

                    bl      circuloparahernan

                //  ---ojo der
                    mov      x11, x25
                    add      x11, x11, #63
                    mov      x12, x26
                    add      x12, x12, #12        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #63
                    mov      x12, x26
                    add      x12, x12, #16        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #18        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan
                    
                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #20        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #21        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0x0000, lsl 0
                    movk    w15, 0x0000, lsl 16  

                    bl      circuloparahernan
                
            // boca
                mov     x11, x25           // x inicial
                add     x11, x11, #48
                mov     x12, x26           // y inicial
                add     x12, x12, #26
                mov     x13, #15           // ancho (horizontal)
                mov     x14, #7           // alto (vertical)
                movz    w16, 0xA523, lsl 0
                movk    w16, 0x00E6, lsl 16  

                bl      draw_rectangle
                    
                mov      x11, x25
                add      x11, x11, #47
                mov      x12, x26
                add      x12, x12, #28
                mov     x13, #3             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #63
                mov      x12, x26
                add      x12, x12, #28
                mov     x13, #3             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #56
                mov      x12, x26
                add      x12, x12, #26       
                mov     x13, #2              // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x0000, lsl 0  

                bl      circuloparahernan

                mov     x11, x25           // x inicial
                add     x11, x11, #48
                mov     x12, x26           // y inicial
                add     x12, x12, #28
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle
                mov     x11, x25           // x inicial
                add     x11, x11, #50
                mov     x12, x26           // y inicial
                add     x12, x12, #29
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle

                mov     x11, x25           // x inicial
                add     x11, x11, #51
                mov     x12, x26           // y inicial
                add     x12, x12, #28
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle

            // oreja-izq
                // ---- contorno
                    mov     x11, x25           // x inicial
                    add     x11, x11, #36
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #16           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #34
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #14           // alto (vertical)
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #32
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #30
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #38
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #40
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #44
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #2
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                // ---piel
                    mov     x11, x25           // x inicial
                    add     x11, x11, #36
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #12           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  

                    bl      draw_rectangle
                    mov     x11, x25           // x inicial
                    add     x11, x11, #34
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  

                    bl      draw_rectangle
                    mov     x11, x25           // x inicial
                    add     x11, x11, #32
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #38
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #40
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #2
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle
            // oreja-der
                // ---contorno
                    mov     x11, x25           // x inicial
                    add     x11, x11, #60
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #62
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #6           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #10
                    mov     x13, #4           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #68
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #16           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #70
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle
                // ---piel
                    mov     x11, x25           // x inicial
                    add     x11, x11, #62
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #66
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #14           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #68
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle
        //      brazos
            // brazo izquierdo
                mov      x11, x25
                add      x11, x11, #37
                mov      x12, x26
                add      x12, x12, #50
                mov     x13, #2             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan


                //loop brazp
                    mov     x28, #0
                loop_arm1:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #35
                    mov     x12, x26           // y inicial
                    add     x12, x12, #48
                    mov     x13, x25           // x final
                    add     x13, x13, #32
                    mov     x14, x26           // y final
                    add     x14, x14, #68
                    movz    w15, 0xA523, lsl 0
                    movk    w15, 0x00E6, lsl 16    // 0x00FFFFFF

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #4

                    b.ne    loop_arm1

                mov      x11, x25
                add      x11, x11, #34
                mov      x12, x26
                add      x12, x12, #70
                mov     x13, #5             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xFFFF, lsl 0
                movk    w15, 0x00FF, lsl 16  

                bl      circuloparahernan

            // brazo derecho
                mov      x11, x25
                add      x11, x11, #65
                mov      x12, x26
                add      x12, x12, #50
                mov     x13, #2             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan
            //loop brazp
                    mov     x28, #0
                loop_arm:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #63
                    mov     x12, x26           // y inicial
                    add     x12, x12, #50
                    mov     x13, x25           // x final
                    add     x13, x13, #68
                    mov     x14, x26           // y final
                    add     x14, x14, #70
                    movz    w15, 0xA523, lsl 0
                    movk    w15, 0x00E6, lsl 16    // 0x00FFFFFF

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #4

                    b.ne    loop_arm
            // mano
                mov      x11, x25
                add      x11, x11, #70
                mov      x12, x26
                add      x12, x12, #70
                mov     x13, #5             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xFFFF, lsl 0
                movk    w15, 0x00FF, lsl 16  
                bl      circuloparahernan
                
    ldr x30, [sp, #0]
    add sp, sp, #8
    ret


// ------------------------
// subrutina draw_line
// ------------------------
// x11, xa \  punto a
// x12, ya /
// x13, xb \  punto b
// x14, yb /
// x15, color
// x27 framebuffer base


draw_line:

    stp x29, x30, [sp, #-16]!   // Guardar x29 (frame pointer) y x30 en la pila
    mov x29, sp                 // (opcional, si usás stack frames)

    SUB     x16, x13, x11    // dx = |xb - xa|
    mov     x0, x16
    bl      abs
    mov     x16, x0

    SUB     x17, x14, x12    // dy = |yb - ya|
    mov     x0, x17
    bl      abs
    mov     x17, x0

    mov x18, #1         // sx = xa < xb? 1 : -1
    CMP x11, x13
    b.lt finx
    mov x18, #-1
finx:    

    mov x19, #1         // sy = ya < yb ? 1 : -1
    CMP x12, x14
    b.lt finy
    mov x19, #-1
finy:    


    MOV x20, x11       // x = x1
    MOV x21, x12       // y = y1

    CMP x16, x17        // dx > dy?
    BGE pend_low     // pendiente <= 1
    B   pend_high   // pendiente > 1

// --- pendiente <= 1 ---
pend_low:
    LSL x1, x16, #1        // 2*dx
    LSL x22, x17, #1        // 2*dy
    SUB x23, x22, x16       // D = 2*dy - dx

pend_low_loop:
    mov     x24, x21           // y_actual
    mov     x0, SCREEN_WIDTH
    mul     x24, x24, x0      // y * SCREEN_WIDTH
    add     x24, x24, x20      // + x_actual
    lsl     x24, x24, #2        // * 4 (bytes por pixel)
    str     w15, [x27, x24]    // framebuffer[offset] = color


    CMP x20, x13
    cset x2, eq
    CMP x21, x14
    cset x3, eq
    and x2, x2, x3
    cbz x2, cont_low_loop
    B return             // if (x actual == xb && y actual == yb) {termina}

cont_low_loop:

    CMP x23, #0
    BLT skip_y
    ADD x21, x21, x19       // y += sy
    SUB x23, x23, x1   // D -= 2*dx
skip_y:
    ADD x23, x23, x22      // D += 2*dy
    ADD x20, x20, x18       // x += sx
    B pend_low_loop

// --- pendiente > 1 ---
pend_high:
    LSL x1, x17, #1        // 2*dy
    LSL x22, x16, #1        // 2*dx
    SUB x23, x22, x17       // D = 2*dx - dy

pend_high_loop:
    mov     x24, x21           // y_actual
    mov     x0, SCREEN_WIDTH
    mul     x24, x24, x0      // y * SCREEN_WIDTH
    add     x24, x24, x20      // + x_actual
    lsl     x24, x24, #2        // * 4 (bytes por pixel)
    str     w15, [x27, x24]    // framebuffer[offset] = color

    
    CMP x20, x13
    cset x2, eq
    CMP x21, x14
    cset x3, eq
    and x2, x2, x3
    cbz x2, cont_high_loop
    B return             // if (x actual == xb && y actual == yb) {termina}

cont_high_loop:

    CMP x23, #0
    BLT skip_x
    ADD x20, x20, x18       // x += sx
    SUB x23, x23, x1        // D -= 2*dy
skip_x:
    ADD x23, x23, x22       // D += 2*dx
    ADD x21, x21, x19       // y += sy
    B pend_high_loop

return:
    
    ldp x29, x30, [sp], #16     // Restaurar x29 y x30
    ret

// valor absoluto
    abs:
        cmp x0, #0
        bge  fin
        sub x0, xzr, x0
    fin:
        ret

//---------------------------------------------------------
// Subrutina: circuloparahernan
//---------------------------------------------------------
// Entradas:
// x11 = centro_x
// x12 = centro_y
// x13 = radio
// x15 = color
//---------------------------------------------------------

circuloparahernan:
    sub sp, sp, 88
    str x20, [sp, 80]
    str x24, [sp, 72]
    str x23, [sp, 64]
    str x22, [sp, 56]
    str x21, [sp, 48]
    str x14, [sp, 40]
    str x19, [sp, 32]
    str x18, [sp, 24]
    str x17, [sp, 16]
    str x16, [sp, 8]
    str lr, [sp]
    mov x20, x14
    // Guardar registros
    // r**2 = x13 * x13
    mul x16, x13, x13        // x16 = radio**2

    mov x17, #0              // y = 0
.loop_ycircle:
    cmp x17, SCREEN_HEIGH
    bge .endcircle

    mov x18, #0              // x = 0
.loop_xcircle:
    cmp x18, SCREEN_WIDTH
    bge .nextrow_circle

    // dx = x - centro_x
    sub x19, x18, x11
    // dy = y - centro_y
    sub x14, x17, x12
    // dx**2 + dy**2
    mul x21, x19, x19
    mul x22, x14, x14
    add x23, x21, x22
    cmp x23, x16
    bgt .skippixel_circle

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x24, x17
    mov x14, SCREEN_WIDTH
    mul x24, x24, x14
    add x24, x24, x18
    lsl x24, x24, 2

    str w15, [x20, x24]

.skippixel_circle:
    add x18, x18, #1
    b .loop_xcircle

.nextrow_circle:
    add x17, x17, #1
    b .loop_ycircle

.endcircle:

    ldr lr, [sp]
    ldr x20, [sp, 80]
    ldr x24, [sp, 72]
    ldr x23, [sp, 64]
    ldr x22, [sp, 56]
    ldr x21, [sp, 48]
    ldr x14, [sp, 40]
    ldr x19, [sp, 32]
    ldr x18, [sp, 24]
    ldr x17, [sp, 16]
    ldr x16, [sp, 8]
    add sp, sp, 88
    
    ret
=======
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
    // Pintar fondo de color verde 
    //---------------------------------------------------------
		
		movz    w10, 0x9900, lsl 0  
  
        
    

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
		// Dibujar rectangulo azul
		//---------------------------------------------------------
		mov     x11, #0          // x inicial
		mov     x12, #0        // y inicial
		mov     x13, #640         // ancho (vertical)
		mov     x14, #240        // alto (horizontal)
		movz    w16, 0x80FF, lsl 0     // 0x0000FF00 
		

		

		bl      draw_rectangle

      
    //---------------------------------------------------------
    // Dibujar círculo amarillo
    //---------------------------------------------------------
    mov     x11, #400        // centro x
    mov     x12, #30        // centro y
    mov     x13, #50         // radio
    movz    w15, 0xFF66, lsl 0
    movk    w15, 0x00FF, lsl 16   // rojo: 0x00FF0000


    bl      draw_circle
    


    //---------------------------------------------------------
    // aca dibujamos arboles
    //---------------------------------------------------------
    //---------------------------------------------------------
    // ultima fila de arboles
    //---------------------------------------------------------
  
  
    //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 70   // posicion en x
    mov x12, 125    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 200   // posicion en x
    mov x12, 123    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 380   // posicion en x
    mov x12, 110    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------

    mov x11, 600   // posicion en x
    mov x12, 135    // posicion en y 
    mov x13, 60     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 

    bl draw_tree 
     //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------
    mov x11, 115   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 
    bl sombra_tree
    mov x11, 120   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x6600, lsl 0    
    movk    w16, 0x0066, lsl 16 

    bl draw_tree 

        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------


    mov x11, 315   // posicion en x
    mov x12, 130    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 
    bl sombra_tree

    mov x11, 320   // posicion en x
    mov x12, 130    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x6600, lsl 0    
    movk    w16, 0x0066, lsl 16 

    bl draw_tree 
        //---------------------------------------------------------
    // dibujar arbol
    //---------------------------------------------------------
    mov x11, 505   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x2008, lsl 0    
    movk    w16, 0x0004, lsl 16 
    bl sombra_tree
    mov x11, 500   // posicion en x
    mov x12, 100    // posicion en y 
    mov x13, 100     // tamaño
    movz    w16, 0x6600, lsl 0    
    movk    w16, 0x0066, lsl 16 

    bl draw_tree 

    //---------------------------------------------------------
    // Dibujar ODC2025
    //---------------------------------------------------------
    mov x5, 210
    mov x6, -145
    movz    w16, 0x3621, lsl 0
    movk    w16, 0x004B, lsl 16
    bl draw_odc
    mov x5, 215
    mov x6, -150
    movz    w16, 0xFD96, lsl 0
    movk    w16, 0x00FD, lsl 16
    bl draw_odc

    //---------------------------------------------------------
    // Dibujar Nube
    //---------------------------------------------------------

    mov x11, 70
    mov x12, 50
    movz    w15, 0xFFFF, lsl 0
    movk    w15, 0x00FF, lsl 16
    bl nube
   
    //---------------------------------------------------------
    // Dibujar Sonix, (no funciona la animacion con el Sonic, ignorenlo)
    //---------------------------------------------------------
/* 	mov     x11, #100          // x inicial
	mov     x12, #350          // y inicial
	mov     x13, x20           // framebuffer base
    bl draw_sonic
*/
InfLoop:
    mov x5, 350
    mov x11, 0
    mov x12, 60
// x11 = x inicial
// x12 = y inicial
// x15 = color
buclenube:
    add x11, x11, 2
    mov x1, x11
    //Tapo la nube anterior
	mov     x11, #0          // x inicial
	mov     x12, #0        // y inicial
	mov     x13, #640         // ancho (vertical)
	mov     x14, #100        // alto (horizontal)
	movz    w16, 0x80FF, lsl 0     // 0x0000FF00 
	bl      draw_rectangle
    //Dibujo el sol que se tapo
    mov     x11, #400        // centro x
    mov     x12, #30        // centro y
    mov     x13, #50         // radio
    movz    w15, 0xFF66, lsl 0
    movk    w15, 0x00FF, lsl 16   // rojo: 0x00FF0000
    bl      draw_circle   
    //Muevo la nube 
    mov x11, x1
    movz    w15, 0xFFFF, lsl 0
    movk    w15, 0x00FF, lsl 16
    bl nube
    bl delay
    sub x5, x5, 1
    cbnz x5, buclenube

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
// Subrutina: draw_rectangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño x
// x14 = tamaño y
// x16 = color
//---------------------------------------------------------

draw_rectangle :
    sub sp, sp, 56
    str x17, [sp, 48]
    str x19, [sp, 40]
    str x18, [sp, 32]
    str x21, [sp, 24]
    str x24, [sp, 16]
    str x23, [sp, 8]
    str lr, [sp]
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

    ldr lr, [sp]
    ldr x17, [sp, 48]
    ldr x19, [sp, 40]
    ldr x18, [sp, 32]
    ldr x21, [sp, 24]
    ldr x24, [sp, 16]
    ldr x23, [sp, 8]
    add sp, sp, 56
    ret

//---------------------------------------------------------
// Subrutina: draw_circle
//---------------------------------------------------------
// Entradas:
// x11 = centro_x
// x12 = centro_y
// x13 = radio
// x15 = color
//---------------------------------------------------------

draw_circle:
    sub sp, sp, 80
    str x24, [sp, 72]
    str x23, [sp, 64]
    str x22, [sp, 56]
    str x21, [sp, 48]
    str x14, [sp, 40]
    str x19, [sp, 32]
    str x18, [sp, 24]
    str x17, [sp, 16]
    str x16, [sp, 8]
    str lr, [sp]
    // Guardar registros
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
    sub x14, x17, x12
    // dx**2 + dy**2
    mul x21, x19, x19
    mul x22, x14, x14
    add x23, x21, x22
    cmp x23, x16
    bgt .skip_pixel_circle

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x24, x17
    mov x14, SCREEN_WIDTH
    mul x24, x24, x14
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

    ldr lr, [sp]
    ldr x24, [sp, 72]
    ldr x23, [sp, 64]
    ldr x22, [sp, 56]
    ldr x21, [sp, 48]
    ldr x14, [sp, 40]
    ldr x19, [sp, 32]
    ldr x18, [sp, 24]
    ldr x17, [sp, 16]
    ldr x16, [sp, 8]
    add sp, sp, 80
    
    ret
//---------------------------------------------------------
// Subrutina: draw_triangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
// x15 = color
//---------------------------------------------------------
    
draw_triangle :

    sub sp, sp, 64
    str x23, [sp, 56]
    str x24, [sp, 48]
    str x16, [sp, 40]
    str x17, [sp, 32]
    str x18, [sp, 24]
    str x19, [sp, 16]
    str x22, [sp, 8]
    str lr, [sp]

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
    
    ldr lr, [sp]
    ldr x23, [sp, 56]
    ldr x24, [sp, 48]
    ldr x16, [sp, 40]
    ldr x17, [sp, 32]
    ldr x18, [sp, 24]
    ldr x19, [sp, 16]
    ldr x22, [sp, 8]
    add sp, sp, 64
    
    ret

//---------------------------------------------------------
// Subrutina: draw_tree
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
// x16 = color
//---------------------------------------------------------

draw_tree :

    sub sp, sp, 52
    str x16, [sp, 48]
    str x14, [sp, 40]
    str x25, [sp, 32]
    str x27, [sp, 24]
    str x28, [sp, 16]
    str x29, [sp, 8]
    str lr, [sp]

    //guardo direccion para poder saltar a cualquier forma
    mov x29, x30
    //guardo datos del arbol para reestablecer luego
    mov x28, x11
    mov x27, x12
    //Primer triangulo

    bl pixel_triangle
    lsr x25, x13, #1 //mitad del tamaño del triangulo
    add x12, x12, x25 //proximo triangulo se crea en el medio del triangulo anterior
    add x13, x13, x25
    bl pixel_triangle
    //Tronco
    add x12, x12, x13 //el rectangulo comienza en la base del ultimo triangulo
    mov x14, x25 //tamaño del tronco
    lsr x13, x25, #1 //un cuarto del tamaño, para un tronco fino
    lsr x25, x25, #2 // un octavo del tronco, me servira para centrarlo luego
    sub x11, x11, x25 // con esto el tronco quedará centrado
    movz    w16, 0x3621, lsl 0     // marron
	movk    w16, 0x004B, lsl 16    // marron
    bl draw_rectangle
    //Reestablezco las variables anteriores
    mov x30, x29
    mov x11, x28
    mov x12, x27
    ldr lr, [sp]
    ldr x16, [sp, 48]
    ldr x14, [sp, 40]
    ldr x25, [sp, 32]
    ldr x27, [sp, 24]
    ldr x28, [sp, 16]
    ldr x29, [sp, 8]
    add sp, sp, 52
    ret
   
//---------------------------------------------------------
// Subrutina: sombra_tree
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = tamaño
// x16 = color
//---------------------------------------------------------

sombra_tree :

    sub sp, sp, 52
    str x16, [sp, 48]
    str x14, [sp, 40]
    str x25, [sp, 32]
    str x27, [sp, 24]
    str x28, [sp, 16]
    str x29, [sp, 8]
    str lr, [sp]

    //guardo direccion para poder saltar a cualquier forma
    mov x29, x30
    //guardo datos del arbol para reestablecer luego
    mov x28, x11
    mov x27, x12
    //Primer triangulo

    bl pixel_triangle
    lsr x25, x13, #1 //mitad del tamaño del triangulo
    add x12, x12, x25 //proximo triangulo se crea en el medio del triangulo anterior
    add x13, x13, x25
    bl pixel_triangle
    //Tronco
    add x12, x12, x13 //el rectangulo comienza en la base del ultimo triangulo
    mov x14, x25 //tamaño del tronco
    lsr x13, x25, #1 //un cuarto del tamaño, para un tronco fino
    lsr x25, x25, #2 // un octavo del tronco, me servira para centrarlo luego
    sub x11, x11, x25 // con esto el tronco quedará centrado
    movz    w16, 0x0000, lsl 0     // marron
	movk    w16, 0x0000, lsl 16    // marron
    bl draw_rectangle
    //Reestablezco las variables anteriores
    mov x30, x29
    mov x11, x28
    mov x12, x27
    ldr lr, [sp]
    ldr x16, [sp, 48]
    ldr x14, [sp, 40]
    ldr x25, [sp, 32]
    ldr x27, [sp, 24]
    ldr x28, [sp, 16]
    ldr x29, [sp, 8]
    add sp, sp, 52
    ret
   
    // ----------------------------------------------------------
    // Subrutina: delay
    // ----------------------------------------------------------



delay:
    sub sp, sp, 24
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]


    mov x11, 0x1111 //Cambiar velocidad con esto
    loopdelay:
    mov x12, x11
    sub x11, x11, 1
    loopotro:
    sub x12, x12, 1
    cbnz x12, loopotro
    cbnz x11, loopdelay

    ldr lr, [sp]
    ldr x12, [sp, 16]
    ldr x11, [sp, 8]
    add sp, sp, 24
    ret



//----------------------------------------------------------------------------------
//-----  ODC 2025,
//  x5 para lugar en x
//  x6 para posicion y
//  x16 para color
//----------------------------------------------------------------------------------
    
    //---------------------------------------------------------
    // Dibujar letra O 
    //---------------------------------------------------------
    draw_odc:
    sub sp, sp, 48
    str x29, [sp, 40]
    str x14, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x29, x30
	// Dibuja la linea mas a la izquierda
	add     x11, x5, #30         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle
	
	// Dibuja la parte superior de la O
	add     x11, x5, #30         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x13, #45   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte mas a la derecha de la  O 
	add     x11, x5, #75         // x inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte inferior de la O
	add     x11, x5, #35         // x inicial
	add     x12, x6, #400      // y inicial
	mov     x13, #50   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

	//---------------------------------------------------------
    // Dibujar letra D
    //---------------------------------------------------------
	
	// Dibuja la parte mas a la izquieda de la D
	add     x11, x5, #95         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle
	
	// Dibuja los pixeles de la "panza" (arriba)
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10      // alto (vertical)

	bl      draw_rectangle
	
	// Dibuja los pixeles de la "panza" (abajo)
	add     x12, x6, #400      // y inicial

	bl      draw_rectangle

	//-----------------------------------------------------
	// OJO, ESTE PEDACITO DIBUJA UN PIXEL, PUEDE SERVIR!!
	//-----------------------------------------------------
	// Dibuja UN pixel de la "panza" (abajo)

	add     x11, x5, #125         // x inicial
	add     x12, x6, #390      // y inicial
	mov     x13, #10   // ancho (horizontal)

	bl      draw_rectangle


	// Dibuja UN pixel de la "panza" (arriba)
	
	add     x12, x6, #360      // y inicial

	bl      draw_rectangle


	// Cierra la "panza" de la D
	add     x12, x6, #370      // y inicial
	mov     x14, #20      // alto (vertical)

	bl      draw_rectangle



	//---------------------------------------------------------
    // Dibujar letra C
    //---------------------------------------------------------

    // Dibuja el palito vertical de la C

	add     x11, x5, #145         // x inicial
	add     x12, x6, #350      // y inicial
	mov     x14, #60       // alto (vertical)

    bl draw_rectangle

    // Dibuja la linea de arriba
    add     x11, x5, #145         // x inicial
	mov     x13, #42   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle
    
    // Dibuja la linea de abajo
    add     x11, x5, #145         // x inicial
	add     x12, x6, #400      // y inicial

    bl draw_rectangle


    //---------------------------------------------------------
    // Dibujar número 2
    //---------------------------------------------------------


    //Primer pixel del 2

    add     x11, x5, #10         // x inicial
	add     x12, x6, #430      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Cabeza del 2

    add     x11, x5, #20         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Costado derecho de la cabeza

    add     x11, x5, #40         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #30       // alto (vertical)

    bl draw_rectangle

    // Parte media del 2
    add     x11, x5, #10         // x inicial
	add     x12, x6, #450      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Patita izquierda del 2 
   
    add     x11, x5, #10         // x inicial
	add     x12, x6, #460      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #20       // alto (vertical)

    bl draw_rectangle

    // Linea final (piso) 

    add     x11, x5, #20         // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    //---------------------------------------------------------
    // Dibujar número 0 
    //---------------------------------------------------------

    // Dibuja la linea mas a la izquierda
	add     x11, x5, #55         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)
    
    bl      draw_rectangle

    // Dibuja la parte superior del 0
	add     x11, x5, #55         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #45   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte mas a la derecha del 0 
	add     x11, x5, #90         // x inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #60       // alto (vertical)

	bl      draw_rectangle

	// Dibuja la parte inferior del 0
	add     x11, x5, 55         // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #45   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    //---------------------------------------------------------
    // Dibujar número 2 
    //---------------------------------------------------------

    //Primer pixel del 2

    add     x11, x5, #110         // x inicial
	add     x12, x6, #430      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Cabeza del 2

    add     x11, x5, #120         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Costado derecho de la cabeza

    add     x11, x5, #140         // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #30       // alto (vertical)

    bl draw_rectangle

    // Parte media del 2
    add     x11, x5, #110         // x inicial
	add     x12, x6, #450      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle

    // Patita izquierda del 2 
   
    add     x11, x5, #110         // x inicial
	add     x12, x6, #460      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #20       // alto (vertical)

    bl draw_rectangle

    // Linea final (piso) 

    add     x11, x5, #120         // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #30   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

    bl draw_rectangle


    //---------------------------------------------------------
    // Dibujar número 5 
    //---------------------------------------------------------


   

    // Dibujo la cabeza del 5

    add     x11, x5, #160        // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #40   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle
   
   // Dibujo la bajada de la cabeza del 5
    add     x11, x5, #160        // x inicial
	add     x12, x6, #420      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #25       // alto (vertical)

	bl      draw_rectangle

    // Parte media del 5
    add     x11, x5, #170        // x inicial
	add     x12, x6, #445      // y inicial
	mov     x13, #20   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    // Bajada a la panza del 5

    add     x11, x5, #190        // x inicial
	add     x12, x6, #455      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #20       // alto (vertical)

	bl      draw_rectangle

    // Panza del 5

    add     x11, x5, #175        // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #20   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    // Piso del 5

    add     x11, x5, #165        // x inicial
	add     x12, x6, #470      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle

    add     x12, x6, #470      // y inicial
	mov     x13, #10   // ancho (horizontal)
	mov     x14, #10       // alto (vertical)

	bl      draw_rectangle
    mov x30,x29
    ldr lr, [sp]
    str x29, [sp, 40]
    str x14, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    add sp, sp, 48
ret 

//---------------------------------------------------------
// Subrutina: pixel_triangle
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x13 = altura
// x16 = color
//---------------------------------------------------------
    
pixel_triangle :

    sub sp, sp, 64
    str x29, [sp, 56]
    str x18, [sp, 48]
    str x13, [sp, 40]
    str x14, [sp, 32]
    str x17, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x29, x30
    mov x17, x13
    mov x14, 10
    mov x13, 5
    mov x18, 0
looppix:
    bl draw_rectangle
    sub x11, x11, 5
    add x12, x12, 10
    add x13, x13, 10
    add x18, x18, 10
    cmp x17, x18
    b.GT looppix


    mov x30, x29
    ldr lr, [sp]
    ldr x29, [sp, 56]
    ldr x18, [sp, 48]
    ldr x13, [sp, 40]
    ldr x14, [sp, 32]
    ldr x17, [sp, 24]
    ldr x12, [sp, 16]
    ldr x11, [sp, 8]
    add sp, sp, 64
    
    ret

//---------------------------------------------------------
// Subrutina: nube
//---------------------------------------------------------
// Entradas:
// x11 = x inicial
// x12 = y inicial
// x15 = color
//---------------------------------------------------------

nube: 
    sub sp, sp, 40
    str x30, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x13, 25
    bl draw_circle
    mov x13, 40
    add x11, x11, 40
    bl draw_circle
    add x11, x11, 30
    mov  x13, 30
    add x12, x12, 10
    bl draw_circle

    ldr lr, [sp]
    ldr x30, [sp, 32]
    ldr x13, [sp, 24]
    ldr x12, [sp, 16]
    ldr x11, [sp, 8]
    add sp, sp, 40
    ret
 
    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGH,      480

    .global draw_sonic


draw_sonic:
        mov x25, x11 //guardo el x inicial
        mov x26, x12 //guardo el y inicial
        mov x27, x13 //guardo el frame buffer
        sub sp, sp, #8
        str x30, [sp, #0]
        //      picos
            //      pico 1
                mov      x11, x25
                add      x11, x11, #34
                mov      x12, x26
                add      x12, x12, #15
                mov      x13, #27
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #13
                mov      x12, x26
                add      x12, x12, #26
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      circuloparahernan

            //      pico 2
                mov      x11, x25
                add      x11, x11, #31
                mov      x12, x26
                add      x12, x12, #34
                mov      x13, #27
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #14
                mov      x12, x26
                add      x12, x12, #47
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      circuloparahernan
                
            //      pico 3
                mov      x11, x25
                add      x11, x11, #37
                mov      x12, x26
                add      x12, x12, #54
                mov      x13, #26
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #22
                mov      x12, x26
                add      x12, x12, #66
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      circuloparahernan


            //      pico 4
                mov      x11, x25
                add      x11, x11, #41
                mov      x12, x26
                add      x12, x12, #70
                mov      x13, #22
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #26
                mov      x12, x26
                add      x12, x12, #82
                mov      x13, #21
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)


                bl      circuloparahernan

                mov     x11, x25           // x inicial
                add     x11, x11, #45
                mov     x12, x26           // y inicial
                add     x12, x12, #34
                mov     x13, #50           // ancho (vertical)
                mov     x14, #60           // alto (horizontal)
                mov     x15, x27           // framebuffer base
                movz    w16, 0x9900, lsl 0     // 0x0000FF00 

                bl      draw_rectangle
        //      pecho
            //      cuerpito
                mov      x11, x25
                add      x11, x11, #49
                mov      x12, x26
                add      x12, x12, #55
                mov     x13, #17             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      circuloparahernan
                mov      x11, x25
                add      x11, x11, #49
                mov      x12, x26
                add      x12, x12, #57
                mov      x13, #17             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  
                bl      circuloparahernan

        //      piernas
            //  pierna izq

                mov     x28, #0
                loop_leg1:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    add     x12, x12, #66
                    mov     x13, x25           // x final
                    add     x13, x13, #36
                    mov     x14, x26           // y final
                    add     x14, x14, #100
                    movz    w15, 0x3B5, lsl 0
                    movk    w15, 0x003, lsl 16 

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #6

                    b.ne    loop_leg1

                //    pie 1
                    mov     x28, #0
                loop_foot0:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #35
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #29
                    mov     x14, x26           // y final
                    add     x14, x14, #107
                    movz    w15, 0x00FF, lsl 16

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot0

                    mov     x28, #0
                loop_foot01:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #41
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #29
                    mov     x14, x26           // y final
                    add     x14, x14, #108
                    movz    w15, 0x00FF, lsl 16

                    add     x12, x12, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #8

                    b.ne    loop_foot01

                    mov     x28, #0
                loop_foot1:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #35
                    mov     x12, x26           // y inicial
                    add     x12, x12, #98
                    mov     x13, x25           // x final
                    add     x13, x13, #42
                    mov     x14, x26           // y final
                    add     x14, x14, #99
                    movz    w15, 0x00FF, lsl 16
                    movk    w15, 0xFFFF, lsl 0

                    add     x12, x12, x28
                    add     x14, x14, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot1
            //  pierna derecha
                    mov     x28, #0
                loop_leg2:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #52
                    mov     x12, x26           // y inicial
                    add     x12, x12, #66
                    mov     x13, x25           // x final
                    add     x13, x13, #58
                    mov     x14, x26           // y final
                    add     x14, x14, #100
                    movz    w15, 0x3B5, lsl 0
                    movk    w15, 0x003, lsl 16 

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #6

                    b.ne    loop_leg2

                //    pie 2
                    mov     x28, #0
                loop_foot2:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #60
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #64
                    mov     x14, x26           // y final
                    add     x14, x14, #107
                    movz    w15, 0x00FF, lsl 16

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot2

                    mov     x28, #0
                loop_foot21:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #58
                    mov     x12, x26           // y inicial
                    add     x12, x12, #100
                    mov     x13, x25           // x final
                    add     x13, x13, #71
                    mov     x14, x26           // y final
                    add     x14, x14, #108
                    movz    w15, 0x00FF, lsl 16

                    add     x12, x12, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #8

                    b.ne    loop_foot21

                    mov     x28, #0
                loop_foot3:
                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    add     x12, x12, #98
                    mov     x13, x25           // x final
                    add     x13, x13, #57
                    mov     x14, x26           // y final
                    add     x14, x14, #99
                    movz    w15, 0x00FF, lsl 16
                    movk    w15, 0xFFFF, lsl 0

                    add     x12, x12, x28
                    add     x14, x14, x28
                    add     x28, x28, #1

                    bl      draw_line
                    cmp     x28, #4

                    b.ne    loop_foot3

            //     piel

                mov      x11, x25
                add      x11, x11, #52
                mov      x12, x26
                add      x12, x12, #55
                mov     x13, #11             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan
                
                mov      x11, x25
                add      x11, x11, #52
                mov      x12, x26
                add      x12, x12, #57
                mov     x13, #11             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan
        //      Cabeza

            mov      x11, x25
            add      x11, x11, #48
            mov      x12, x26
            add      x12, x12, #17        
            mov     x13, #25             // radio
            mov     x14, x27             // framebuffer base
            movz    w15, 0x03B5, lsl 0
            movk    w15, 0x0003, lsl 16  

            bl      circuloparahernan
            //      ojos
                // ----rectangulo union----
                    mov     x11, x25           // x inicial
                    add     x11, x11, #47
                    mov     x12, x26           // y inicial
                    add     x12, x12, #20
                    mov     x13, #17           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    movz    w16, 0xFFFF, lsl 0
                    movk    w16, 0x00FF, lsl 16    // 0x00FFFFFF

                    bl      draw_rectangle
                //  ---ojo izq
                    mov      x11, x25
                    add      x11, x11, #45
                    mov      x12, x26
                    add      x12, x12, #12        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #46
                    mov      x12, x26
                    add      x12, x12, #16        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #47
                    mov      x12, x26
                    add      x12, x12, #18        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan
                    
                    mov      x11, x25
                    add      x11, x11, #47
                    mov      x12, x26
                    add      x12, x12, #20        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #49
                    mov      x12, x26
                    add      x12, x12, #21        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0x0000, lsl 0
                    movk    w15, 0x0000, lsl 16  

                    bl      circuloparahernan

                //  ---ojo der
                    mov      x11, x25
                    add      x11, x11, #63
                    mov      x12, x26
                    add      x12, x12, #12        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #63
                    mov      x12, x26
                    add      x12, x12, #16        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #18        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan
                    
                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #20        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      circuloparahernan

                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #21        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0x0000, lsl 0
                    movk    w15, 0x0000, lsl 16  

                    bl      circuloparahernan
                
            // boca
                mov     x11, x25           // x inicial
                add     x11, x11, #48
                mov     x12, x26           // y inicial
                add     x12, x12, #26
                mov     x13, #15           // ancho (horizontal)
                mov     x14, #7           // alto (vertical)
                movz    w16, 0xA523, lsl 0
                movk    w16, 0x00E6, lsl 16  

                bl      draw_rectangle
                    
                mov      x11, x25
                add      x11, x11, #47
                mov      x12, x26
                add      x12, x12, #28
                mov     x13, #3             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #63
                mov      x12, x26
                add      x12, x12, #28
                mov     x13, #3             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan

                mov      x11, x25
                add      x11, x11, #56
                mov      x12, x26
                add      x12, x12, #26       
                mov     x13, #2              // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x0000, lsl 0  

                bl      circuloparahernan

                mov     x11, x25           // x inicial
                add     x11, x11, #48
                mov     x12, x26           // y inicial
                add     x12, x12, #28
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle
                mov     x11, x25           // x inicial
                add     x11, x11, #50
                mov     x12, x26           // y inicial
                add     x12, x12, #29
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle

                mov     x11, x25           // x inicial
                add     x11, x11, #51
                mov     x12, x26           // y inicial
                add     x12, x12, #28
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle

            // oreja-izq
                // ---- contorno
                    mov     x11, x25           // x inicial
                    add     x11, x11, #36
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #16           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #34
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #14           // alto (vertical)
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #32
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #30
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #38
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #40
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #44
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #2
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                // ---piel
                    mov     x11, x25           // x inicial
                    add     x11, x11, #36
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #12           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  

                    bl      draw_rectangle
                    mov     x11, x25           // x inicial
                    add     x11, x11, #34
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  

                    bl      draw_rectangle
                    mov     x11, x25           // x inicial
                    add     x11, x11, #32
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #38
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #40
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #2
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle
            // oreja-der
                // ---contorno
                    mov     x11, x25           // x inicial
                    add     x11, x11, #60
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #62
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #6           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #10
                    mov     x13, #4           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #68
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #16           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #70
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle
                // ---piel
                    mov     x11, x25           // x inicial
                    add     x11, x11, #62
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #66
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #14           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #68
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle
        //      brazos
            // brazo izquierdo
                mov      x11, x25
                add      x11, x11, #37
                mov      x12, x26
                add      x12, x12, #50
                mov     x13, #2             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan


                //loop brazp
                    mov     x28, #0
                loop_arm1:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #35
                    mov     x12, x26           // y inicial
                    add     x12, x12, #48
                    mov     x13, x25           // x final
                    add     x13, x13, #32
                    mov     x14, x26           // y final
                    add     x14, x14, #68
                    movz    w15, 0xA523, lsl 0
                    movk    w15, 0x00E6, lsl 16    // 0x00FFFFFF

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #4

                    b.ne    loop_arm1

                mov      x11, x25
                add      x11, x11, #34
                mov      x12, x26
                add      x12, x12, #70
                mov     x13, #5             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xFFFF, lsl 0
                movk    w15, 0x00FF, lsl 16  

                bl      circuloparahernan

            // brazo derecho
                mov      x11, x25
                add      x11, x11, #65
                mov      x12, x26
                add      x12, x12, #50
                mov     x13, #2             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      circuloparahernan
            //loop brazp
                    mov     x28, #0
                loop_arm:  
                    mov     x11, x25           // x inicial
                    add     x11, x11, #63
                    mov     x12, x26           // y inicial
                    add     x12, x12, #50
                    mov     x13, x25           // x final
                    add     x13, x13, #68
                    mov     x14, x26           // y final
                    add     x14, x14, #70
                    movz    w15, 0xA523, lsl 0
                    movk    w15, 0x00E6, lsl 16    // 0x00FFFFFF

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line

                    cmp     x28, #4

                    b.ne    loop_arm
            // mano
                mov      x11, x25
                add      x11, x11, #70
                mov      x12, x26
                add      x12, x12, #70
                mov     x13, #5             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xFFFF, lsl 0
                movk    w15, 0x00FF, lsl 16  
                bl      circuloparahernan
                
    ldr x30, [sp, #0]
    add sp, sp, #8
    ret


// ------------------------
// subrutina draw_line
// ------------------------
// x11, xa \  punto a
// x12, ya /
// x13, xb \  punto b
// x14, yb /
// x15, color
// x27 framebuffer base


draw_line:

    stp x29, x30, [sp, #-16]!   // Guardar x29 (frame pointer) y x30 en la pila
    mov x29, sp                 // (opcional, si usás stack frames)

    SUB     x16, x13, x11    // dx = |xb - xa|
    mov     x0, x16
    bl      abs
    mov     x16, x0

    SUB     x17, x14, x12    // dy = |yb - ya|
    mov     x0, x17
    bl      abs
    mov     x17, x0

    mov x18, #1         // sx = xa < xb? 1 : -1
    CMP x11, x13
    b.lt finx
    mov x18, #-1
finx:    

    mov x19, #1         // sy = ya < yb ? 1 : -1
    CMP x12, x14
    b.lt finy
    mov x19, #-1
finy:    


    MOV x20, x11       // x = x1
    MOV x21, x12       // y = y1

    CMP x16, x17        // dx > dy?
    BGE pend_low     // pendiente <= 1
    B   pend_high   // pendiente > 1

// --- pendiente <= 1 ---
pend_low:
    LSL x1, x16, #1        // 2*dx
    LSL x22, x17, #1        // 2*dy
    SUB x23, x22, x16       // D = 2*dy - dx

pend_low_loop:
    mov     x24, x21           // y_actual
    mov     x0, SCREEN_WIDTH
    mul     x24, x24, x0      // y * SCREEN_WIDTH
    add     x24, x24, x20      // + x_actual
    lsl     x24, x24, #2        // * 4 (bytes por pixel)
    str     w15, [x27, x24]    // framebuffer[offset] = color


    CMP x20, x13
    cset x2, eq
    CMP x21, x14
    cset x3, eq
    and x2, x2, x3
    cbz x2, cont_low_loop
    B return             // if (x actual == xb && y actual == yb) {termina}

cont_low_loop:

    CMP x23, #0
    BLT skip_y
    ADD x21, x21, x19       // y += sy
    SUB x23, x23, x1   // D -= 2*dx
skip_y:
    ADD x23, x23, x22      // D += 2*dy
    ADD x20, x20, x18       // x += sx
    B pend_low_loop

// --- pendiente > 1 ---
pend_high:
    LSL x1, x17, #1        // 2*dy
    LSL x22, x16, #1        // 2*dx
    SUB x23, x22, x17       // D = 2*dx - dy

pend_high_loop:
    mov     x24, x21           // y_actual
    mov     x0, SCREEN_WIDTH
    mul     x24, x24, x0      // y * SCREEN_WIDTH
    add     x24, x24, x20      // + x_actual
    lsl     x24, x24, #2        // * 4 (bytes por pixel)
    str     w15, [x27, x24]    // framebuffer[offset] = color

    
    CMP x20, x13
    cset x2, eq
    CMP x21, x14
    cset x3, eq
    and x2, x2, x3
    cbz x2, cont_high_loop
    B return             // if (x actual == xb && y actual == yb) {termina}

cont_high_loop:

    CMP x23, #0
    BLT skip_x
    ADD x20, x20, x18       // x += sx
    SUB x23, x23, x1        // D -= 2*dy
skip_x:
    ADD x23, x23, x22       // D += 2*dx
    ADD x21, x21, x19       // y += sy
    B pend_high_loop

return:
    
    ldp x29, x30, [sp], #16     // Restaurar x29 y x30
    ret

// valor absoluto
    abs:
        cmp x0, #0
        bge  fin
        sub x0, xzr, x0
    fin:
        ret

//---------------------------------------------------------
// Subrutina: circuloparahernan
//---------------------------------------------------------
// Entradas:
// x11 = centro_x
// x12 = centro_y
// x13 = radio
// x15 = color
//---------------------------------------------------------

circuloparahernan:
    sub sp, sp, 88
    str x20, [sp, 80]
    str x24, [sp, 72]
    str x23, [sp, 64]
    str x22, [sp, 56]
    str x21, [sp, 48]
    str x14, [sp, 40]
    str x19, [sp, 32]
    str x18, [sp, 24]
    str x17, [sp, 16]
    str x16, [sp, 8]
    str lr, [sp]
    mov x20, x14
    // Guardar registros
    // r**2 = x13 * x13
    mul x16, x13, x13        // x16 = radio**2

    mov x17, #0              // y = 0
.loop_ycircle:
    cmp x17, SCREEN_HEIGH
    bge .endcircle

    mov x18, #0              // x = 0
.loop_xcircle:
    cmp x18, SCREEN_WIDTH
    bge .nextrow_circle

    // dx = x - centro_x
    sub x19, x18, x11
    // dy = y - centro_y
    sub x14, x17, x12
    // dx**2 + dy**2
    mul x21, x19, x19
    mul x22, x14, x14
    add x23, x21, x22
    cmp x23, x16
    bgt .skippixel_circle

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x24, x17
    mov x14, SCREEN_WIDTH
    mul x24, x24, x14
    add x24, x24, x18
    lsl x24, x24, 2

    str w15, [x20, x24]

.skippixel_circle:
    add x18, x18, #1
    b .loop_xcircle

.nextrow_circle:
    add x17, x17, #1
    b .loop_ycircle

.endcircle:

    ldr lr, [sp]
    ldr x20, [sp, 80]
    ldr x24, [sp, 72]
    ldr x23, [sp, 64]
    ldr x22, [sp, 56]
    ldr x21, [sp, 48]
    ldr x14, [sp, 40]
    ldr x19, [sp, 32]
    ldr x18, [sp, 24]
    ldr x17, [sp, 16]
    ldr x16, [sp, 8]
    add sp, sp, 88
    
    ret
>>>>>>> 477bf186c948d4aa9b841922f62dd16b3cd0a81e
