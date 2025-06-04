
.global draw_sonic


draw_sonic:
        mov x21, x11 //guardo el x inicial
        mov x22, x12 //guardo el y inicial
        mov x23, x13 //guardo el frame buffer
        //---------------------------------------------------------
		// Dibujar sonic
		//---------------------------------------------------------
		//mov     x11, #230          // x inicial
		//mov     x12, #300          // y inicial
		//mov     x13, x20           // framebuffer base
        add     x11,x11,#50           
        add     x12,x12,#20          
        mov     x13, #30             // radio
        mov     x14, x23             // framebuffer base
        movz    w15, 0xFF00, lsl 0
        movk    w15, 0x00FF, lsl 16  // rojo: 0x00FF0000

        bl      draw_circle

        mov      x11, x21
        mov      x12, x22
        add      x12, x12, #10
        mov      x13, #20
        mov      x14, x23
        movz     w15, 0xFF00, lsl 0
        movk     w15, 0x00FF, lsl 16  // rojo: 0x00FF0000

        bl      draw_circle

        ret

