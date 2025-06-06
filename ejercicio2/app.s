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
		
		movz    w10, 0x6666, lsl 0  
  
        
    

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


   


    // inicializamos la variable que vamos usar para la animacion 

    mov     x28, 1
    mov     x27, 1
	


InfLoop:
/* 
		
       // modularizamos la posicion en x para que la nube nunca pare 

        
    cmp x28, SCREEN_WIDTH
    csel x28, xzr, x28, gt




        //---------------------------------------------------------
		// dibujamos otra vez el cielo y el sol  
		//---------------------------------------------------------
		//---------------------------------------------------------
		// Dibujar rectangulo azul
		//---------------------------------------------------------
		mov     x11, #0          // x inicial
		mov     x12, #0        // y inicial
		mov     x13, #640         // ancho (vertical)
		mov     x14, #160        // alto (horizontal)
		movz    w16, 0x80FF, lsl 0     // 0x0000FF00 
		

		

		bl      draw_rectangle






    //---------------------------------------------------------
    // Dibujar círculo amarillo
    //---------------------------------------------------------
    mov     x11, #400        // centro x
    mov     x12, #30        // centro y
    mov     x13, #50         // radio
    mov     x14, x20         // framebuffer base
    movz    w15, 0xFF66, lsl 0
    movk    w15, 0x00FF, lsl 16   // rojo: 0x00FF0000

    bl      draw_circle

 
        //---------------------------------------------------------
		// Dibujar rectangulo blanco (nube)
		//---------------------------------------------------------
		mov     x11, x28          // x inicial
		mov     x12, #40        // y inicial
		mov     x13, #20         // ancho (vertical)
		mov     x14, #40       // alto (horizontal)
		movz    w16, 0xE0E0, lsl 0     
        movk    w16, 0x00E0, lsl 16
		

		

		bl      draw_rectangle



        //---------------------------------------------------------
		// Dibujar rectangulo blanco (nube)
		//---------------------------------------------------------
		mov     x11, x28          // x inicial
		mov     x12, #50        // y inicial
		mov     x13, #60         // ancho (vertical)
		mov     x14, #10       // alto (horizontal)
		movz    w16, 0xE0E0, lsl 0     
        movk    w16, 0x00E0, lsl 16

        bl      draw_rectangle


        //---------------------------------------------------------
		// Dibujar rectangulo blanco (nube)
		//---------------------------------------------------------
		mov     x11, x27          // x inicial
		mov     x12, #50        // y inicial
		mov     x13, #60         // ancho (vertical)
		mov     x14, #10       // alto (horizontal)
		movz    w16, 0xE0E0, lsl 0     
        movk    w16, 0x00E0, lsl 16

        bl      draw_rectangle
		

        //---------------------------------------------------------
		// Dibujar rectangulo blanco (nube)
		//---------------------------------------------------------
		mov     x11, x26          // x inicial
		mov     x12, #30        // y inicial
		mov     x13, #60         // ancho (vertical)
		mov     x14, #20       // alto (horizontal)
		movz    w16, 0xE0E0, lsl 0     
        movk    w16, 0x00E0, lsl 16

        bl      draw_rectangle
		
		//---------------------------------------------------------
		// Dibujar rectangulo blanco (nube)
		//---------------------------------------------------------
		mov     x11, x27          // x inicial
		mov     x12, #80        // y inicial
		mov     x13, #30         // ancho (vertical)
		mov     x14, #20       // alto (horizontal)
		movz    w16, 0xE0E0, lsl 0     
        movk    w16, 0x00E0, lsl 16
        bl      draw_rectangle

		
		//---------------------------------------------------------
		// Dibujar rectangulo blanco (nube)
		//---------------------------------------------------------
		mov     x11, x26          // x inicial
		mov     x12, #50       // y inicial
		mov     x13, #15        // ancho (vertical)
		mov     x14, #5      // alto (horizontal)
		movz    w16, 0xE0E0, lsl 0     
        movk    w16, 0x00E0, lsl 16
        bl      draw_rectangle




        //---------------------------------------------------------
		// perdemos tiempo para la animacion 
		//---------------------------------------------------------

        mov x24, 10000
        bl waste_time_2

        mov x24, 10000
        bl waste_time_2


        mov x24, 10000
        bl waste_time_2

        mov x24, 10000
        bl waste_time_2


        mov x24, 10000
        bl waste_time_2

        mov x24, 10000
        bl waste_time_2


        mov x24, 10000
        bl waste_time_2

        mov x24, 10000
        bl waste_time_2


        mov x24, 10000
        bl waste_time_2

        mov x24, 10000
        bl waste_time_2


        mov x24, 10000
        bl waste_time_2

        mov x24, 10000
        bl waste_time_2




        

        



    add x28 , x28, 1
    add x27,  x27, 3 
    add x26, x26, 2
*/

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
    // Subrutina: waste_time
    // ----------------------------------------------------------
    // Entrada:
    //   x23 = número de iteraciones a perder
    // ----------------------------------------------------------


waste_time:
    sub sp, sp, 32
    str x0, [sp, 24]
    str x2, [sp, 16]
    str x1, [sp, 8]
    str lr, [sp]

    cbz x23, .end_waste         // Si x23 == 0, salir
    mov x1, x23                 // Copiar contador a x1
.loop_waste:
    subs x1, x1, #1            // x1 = x1 - 1 y actualizar flags
    b.ne .loop_waste           // Si x1 != 0, repetir
.end_waste:

    ldr lr, [sp]
    ldr x0, [sp, 24]
    ldr x2, [sp, 16]
    ldr x1, [sp, 8]
    add sp, sp, 32
    ret



waste_time_2:
    mov x29, x30                  // Guardar LR

    cbz x23, end_waste_2          // Si x24 == 0, salir

    mov x2, x23                   // Cantidad de repeticiones
loop_waste_2:
    mov x0, x2                    // x0 = índice actual
    lsl x0, x0, #10               // x0 *= 1024 (más ciclos cuanto más grande x24)
    bl waste_time                 // pierde x0 ciclos
    subs x2, x2, #1
    b.ne loop_waste_2

end_waste_2:
    mov x30, x29
    ret

draw_odc:
    sub sp, sp, 48
    str x29, [sp, 40]
    str x14, [sp, 32]
    str x13, [sp, 24]
    str x12, [sp, 16]
    str x11, [sp, 8]
    str lr, [sp]
    mov x29, x30
//----------------------------------------------------------------------------------
//-----  ODC 2025,
//  x5 para lugar en x
//  x6 para posicion y
//  x16 para color
//----------------------------------------------------------------------------------
    
    //---------------------------------------------------------
    // Dibujar letra O 
    //---------------------------------------------------------

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
