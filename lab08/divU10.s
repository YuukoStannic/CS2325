        .arch   armv6
        .fpu    vfp
        .data
        .text
        .align 
        .global divU10
        .type   divU10, %function

/*
    The program will assume that the argument passed in 
    will be positive. 

    r0 will have the passed in parameter
    r8 will store the quotient to be passed into r0  at finish
    r9 will store the remainder to be passed into r1 at finish
    r0-r5 will be pushed onto the stack and restored at
    the end.
*/

divU10: 
        push    {fp}
        push    {lr}
        stmfd   sp!, {r4-r11}
        mov     r3, r0
        mov     r4, r0
        mov     r1, r0
        lsr     r0, #1     @ q >> 1
        lsr     r1, #2     @ q >> 2
        add     r0, r0, r1  
        mov     r1, r0     
        lsr     r1, #4          
        add     r0, r0, r1 @ q = q + ( q >> 4 ) 
        mov     r1, r0
        lsr     r4, #8
        add     r0, r0, r1
        mov     r1, r0
        lsr     r1, #16
        add     r0, r0, r4
        lsr     r0, #3
        mov     r8, r0
        /* remainder starts here */
        lsl     r0, #2
        add     r0, r0, r8
        lsl     r0, #1
        sub     r9, r4, r0

        cmp     r2, #9
        ble     return
fixIt:  
        add     R8, R8, #1        @ q = q + 1
        sub     R9, R9, #10

return: 
        mov     r0,r8
        mov     r1,r9
        ldmfd   sp!, {r4-r11,sp0}
        pop     {lr}
        pop     {fp}
        mov     pc,lr
        .end

