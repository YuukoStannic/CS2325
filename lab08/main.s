        .extern printf


fmt1:   .asciz  "The number is: %d/n"   @ format string for reading an int
        .align  2

fmt2    .asciz  "The number div10U yields quotient and remainder %d" 
        .align  2

while:  cmp     r1,#0
        bgt     main
        @printf ("The number is %d % number")
        ldr     r0,fmt1
        bl      printf
        bl      div10U
        ldr     r0,fmt2
        bl      printf
        b       while





main:
        ldr     r1,#1
        lsl     r1,#31
        sub     r1,r1,#1
        bl      while
