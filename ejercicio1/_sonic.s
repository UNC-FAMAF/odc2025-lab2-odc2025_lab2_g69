    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGH,      480

.global draw_sonic


draw_sonic:
        mov x25, x11 //guardo el x inicial
        mov x26, x12 //guardo el y inicial
        mov x27, x13 //guardo el frame buffer
        //---------------------------------------------------------
		// Dibujar sonic
		//---------------------------------------------------------
		//mov     x11, #230          // x inicial
		//mov     x12, #300          // y inicial
		//mov     x13, x20           // framebuffer base

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

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #13
                mov      x12, x26
                add      x12, x12, #26
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      draw_circle

            //      pico 2
                mov      x11, x25
                add      x11, x11, #31
                mov      x12, x26
                add      x12, x12, #34
                mov      x13, #27
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #14
                mov      x12, x26
                add      x12, x12, #47
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      draw_circle
                
            //      pico 3
                mov      x11, x25
                add      x11, x11, #37
                mov      x12, x26
                add      x12, x12, #54
                mov      x13, #26
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #22
                mov      x12, x26
                add      x12, x12, #66
                mov      x13, #24
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)

                bl      draw_circle


            //      pico 4
                mov      x11, x25
                add      x11, x11, #41
                mov      x12, x26
                add      x12, x12, #70
                mov      x13, #22
                mov      x14, x27
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #26
                mov      x12, x26
                add      x12, x12, #82
                mov      x13, #21
                mov      x14, x27
                movz    w15, 0x9900, lsl 0 // verde fondo: (0x00009900)


                bl      draw_circle

                mov     x11, x25           // x inicial
                add     x11, x11, #46
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

                bl      draw_circle
                mov      x11, x25
                add      x11, x11, #49
                mov      x12, x26
                add      x12, x12, #57
                mov      x13, #17             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  
            //     piel
                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #52
                mov      x12, x26
                add      x12, x12, #55
                mov     x13, #11             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      draw_circle
                
                mov      x11, x25
                add      x11, x11, #52
                mov      x12, x26
                add      x12, x12, #57
                mov     x13, #11             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      draw_circle
        //      Cabeza

            mov      x11, x25
            add      x11, x11, #48
            mov      x12, x26
            add      x12, x12, #17        
            mov     x13, #25             // radio
            mov     x14, x27             // framebuffer base
            movz    w15, 0x03B5, lsl 0
            movk    w15, 0x0003, lsl 16  

            bl      draw_circle
            //      ojos
                // ----rectangulo union----
                    mov     x11, x25           // x inicial
                    add     x11, x11, #47
                    mov     x12, x26           // y inicial
                    add     x12, x12, #20
                    mov     x13, #17           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    mov     x15, x27           // framebuffer base
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

                    bl      draw_circle

                    mov      x11, x25
                    add      x11, x11, #46
                    mov      x12, x26
                    add      x12, x12, #16        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      draw_circle

                    mov      x11, x25
                    add      x11, x11, #47
                    mov      x12, x26
                    add      x12, x12, #18        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      draw_circle
                    
                    mov      x11, x25
                    add      x11, x11, #47
                    mov      x12, x26
                    add      x12, x12, #20        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      draw_circle

                    mov      x11, x25
                    add      x11, x11, #49
                    mov      x12, x26
                    add      x12, x12, #21        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0x0000, lsl 0
                    movk    w15, 0x0000, lsl 16  

                    bl      draw_circle

                //  ---ojo der
                    mov      x11, x25
                    add      x11, x11, #63
                    mov      x12, x26
                    add      x12, x12, #12        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      draw_circle

                    mov      x11, x25
                    add      x11, x11, #63
                    mov      x12, x26
                    add      x12, x12, #16        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16  

                    bl      draw_circle

                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #18        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      draw_circle
                    
                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #20        
                    mov     x13, #7             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0xFFFF, lsl 0
                    movk    w15, 0x00FF, lsl 16

                    bl      draw_circle

                    mov      x11, x25
                    add      x11, x11, #62
                    mov      x12, x26
                    add      x12, x12, #21        
                    mov     x13, #4             // radio
                    mov     x14, x27             // framebuffer base
                    movz    w15, 0x0000, lsl 0
                    movk    w15, 0x0000, lsl 16  

                    bl      draw_circle
                
            // boca
                mov     x11, x25           // x inicial
                add     x11, x11, #48
                mov     x12, x26           // y inicial
                add     x12, x12, #26
                mov     x13, #15           // ancho (horizontal)
                mov     x14, #7           // alto (vertical)
                mov     x15, x27           // framebuffer base
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

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #63
                mov      x12, x26
                add      x12, x12, #28
                mov     x13, #3             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #56
                mov      x12, x26
                add      x12, x12, #26       
                mov     x13, #2              // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x0000, lsl 0  

                bl      draw_circle

                mov     x11, x25           // x inicial
                add     x11, x11, #48
                mov     x12, x26           // y inicial
                add     x12, x12, #28
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                mov     x15, x27           // framebuffer base
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle
                mov     x11, x25           // x inicial
                add     x11, x11, #50
                mov     x12, x26           // y inicial
                add     x12, x12, #29
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                mov     x15, x27           // framebuffer base
                movz    w16, 0x0, lsl 0  

                bl      draw_rectangle

                mov     x11, x25           // x inicial
                add     x11, x11, #51
                mov     x12, x26           // y inicial
                add     x12, x12, #28
                mov     x13, #2           // ancho (horizontal)
                mov     x14, #2           // alto (vertical)
                mov     x15, x27           // framebuffer base
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
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #34
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #14           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #32
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #30
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #38
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #40
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #44
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #2
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                // ---piel
                    mov     x11, x25           // x inicial
                    add     x11, x11, #36
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #12           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  

                    bl      draw_rectangle
                    mov     x11, x25           // x inicial
                    add     x11, x11, #34
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  

                    bl      draw_rectangle
                    mov     x11, x25           // x inicial
                    add     x11, x11, #32
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #38
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16  
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #40
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #42
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #2
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    mov     x15, x27           // framebuffer base
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
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #62
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #6           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #10
                    mov     x13, #4           // ancho (horizontal)
                    mov     x14, #2           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #68
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #16           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #70
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0x0, lsl 0
                    bl      draw_rectangle
                // ---piel
                    mov     x11, x25           // x inicial
                    add     x11, x11, #62
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #4
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #4           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #64
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #10           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #66
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #8
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #14           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle

                    mov     x11, x25           // x inicial
                    add     x11, x11, #68
                    mov     x12, x26           // y inicial
                    sub     x12, x12, #6
                    mov     x13, #2           // ancho (horizontal)
                    mov     x14, #8           // alto (vertical)
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16
                    bl      draw_rectangle
        //      brazos
            // brazo izquierdo
                mov      x11, x25
                add      x11, x11, #37
                mov      x12, x26
                add      x12, x12, #50
                mov     x13, #3             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      draw_circle

                mov      x11, x25
                add      x11, x11, #34
                mov      x12, x26
                add      x12, x12, #70
                mov     x13, #5             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xFFFF, lsl 0
                movk    w15, 0x0099, lsl 16  

                bl      draw_circle

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
                    
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16    // 0x00FFFFFF

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line_y

                    cmp     x28, #4

                    b.ne    loop_arm1

            // brazo derecho
                mov      x11, x25
                add      x11, x11, #65
                mov      x12, x26
                add      x12, x12, #50
                mov     x13, #2             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

                bl      draw_circle
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
                    
                    mov     x15, x27           // framebuffer base
                    movz    w16, 0xA523, lsl 0
                    movk    w16, 0x00E6, lsl 16    // 0x00FFFFFF

                    add     x11, x11, x28
                    add     x13, x13, x28
                    add     x28, x28, #1

                    bl      draw_line_y

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
                bl      draw_circle
                
                

        ret


//-----------------------------------
//sub rutina trazar linea
//-----------------------------------

// Entradas:
// x11 = x1 inicial
// x12 = y1 inicial
// x13 = x2 final
// x14 = y2 final
// x15 = framebuffer base
// x16 = color
//---------------------------------------------------------

// draw_line :
    sub x17, x11, x13 // dx = x1 - x2 (distancia entre ambos x)
    sub x18, x12, x14 // dy = y1 - y2 (distancia entre ambos y)
    
    // D inicial
        add x19, x18, x18 // D = 2*dy
        sub x19, x19, x17 // D = 2*dy-dx
    
loop:
    mov     x24, x12           // y_actual
    mov     x23, SCREEN_WIDTH
    mul     x24, x24, x23      // y * SCREEN_WIDTH
    add     x24, x24, x21      // + x_actual
    lsl     x24, x24, 2        // * 4 (bytes por pixel)
    str     w16, [x15, x24]    // framebuffer[offset] = color


    ret
// Entradas: x1, y1, x2, y2 en X11, X12, X13, X14
//!draw_line:
draw_line_x:
    SUB X4, X13, X11        // dx = x2 - x1
    SUB X5, X14, X12        // dy = y2 - y1

    LSL X6, X5, #1        // 2*dy
    SUB X7, X6, X4        // D = 2*dy - dx

    MOV X8, X11            // x = x1
    MOV X9, X12            // y = y1

loop_start:
    MOV X10, X8
    MOV X11, X9

    mov     x24, x9           // y_actual
    mov     x23, SCREEN_WIDTH
    mul     x24, x24, x23      // y * SCREEN_WIDTH
    add     x24, x24, x8      // + x_actual
    lsl     x24, x24, 2        // * 4 (bytes por pixel)
    str     w16, [x15, x24]
    

    CMP X8, X13
    B.EQ loop_end

    ADD X8, X8, #1        // x++
    CMP X7, #0
    BLE skip_y_inc

    ADD X9, X9, #1        // y++
    lsl x4, x4, #1
    SUB X7, X7, X4  // D = D - 2*dx

skip_y_inc:
    ADD X7, X7, X6        // D = D + 2*dy
    B loop_start

loop_end:
    RET

draw_line_y:
        cmp     x13, x11
        b.le    start_11

start_00:
        SUB X4, X13, X11        // dx = x2 - x1
        SUB X5, X14, X12        // dy = y2 - y1

        LSL X6, X4, #1        // 2*dx
        SUB X7, X6, X5        // D = 2*dx - dy

        MOV X8, X11            // x = x1
        MOV X9, X12            // y = y1

    y_start_0:
            MOV X0, X8
            MOV X1, X9

            mov     x24, x9           // y_actual
            mov     x23, SCREEN_WIDTH
            mul     x24, x24, x23      // y * SCREEN_WIDTH
            add     x24, x24, x8      // + x_actual
            lsl     x24, x24, 2        // * 4 (bytes por pixel)
            str     w16, [x15, x24]

            CMP X9, X14
            B.EQ end_0

            ADD X9, X9, #1        // y++

            CMP X7, #0
            BLE skip_x0

            ADD X8, X8, #1        // x++
            SUB X7, X7, X5, LSL #1  // D -= 2*dy

        skip_x0:
            ADD X7, X7, X6        // D += 2*dx
            B y_start_0

        end_0:
            RET

start_11:
        SUB X4, X11, X13       // dx = x1 - x2
        SUB X5, X12, X14        // dy = y1 - y2

        LSL X6, X4, #1        // 2*dx
        sub X7, X6, X5        // D = 2*dx + dy

        MOV X8, X11            // x = x1
        MOV X9, X12            // y = y1


    y_start_1:
            MOV X0, X8
            MOV X1, X9

            mov     x24, x9           // y_actual
            mov     x23, SCREEN_WIDTH
            mul     x24, x24, x23      // y * SCREEN_WIDTH
            add     x24, x24, x8      // + x_actual
            lsl     x24, x24, 2        // * 4 (bytes por pixel)
            str     w16, [x15, x24]

            CMP X9, X14
            B.EQ end_1

            ADD X9, X9, #1        // y++

            CMP X7, #0
            BLE skip_x1

            // D > 0
            SUB X8, X8, #1            // x--
            LSL X5, X5, #1            // 2*dy
            LSL X6, X4, #1            // 2*dx
            SUB X7, X7, X5            // D -= 2*dy
            ADD X7, X7, X6            // D += 2*dx
            B y_start_1

            skip_x1:
            LSL X6, X4, #1            // 2*dx
            ADD X7, X7, X6            // D += 2*dx
            B y_start_1

        end_1:
            RET



    

