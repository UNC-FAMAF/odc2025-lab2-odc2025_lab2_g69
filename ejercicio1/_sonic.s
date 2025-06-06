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

                bl      draw_circle
                mov      x11, x25
                add      x11, x11, #49
                mov      x12, x26
                add      x12, x12, #57
                mov      x13, #17             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0x3B5, lsl 0
                movk    w15, 0x003, lsl 16  
                bl      draw_circle

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
                mov     x13, #2             // radio
                mov     x14, x27             // framebuffer base
                movz    w15, 0xA523, lsl 0
                movk    w15, 0x00E6, lsl 16  

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

                bl      draw_circle

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
                bl      draw_circle
                
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

