/* file rpi-sl01.s 
   
   A program to input an integer and output same
   Program authors: Nicholas Henry, Petterson Pham
   Finished on: ??/??/????
*/

            .extern     printf
            .extern     scanf
            .data
fmt1:       .asciz      "%d"    @ format string for reading an int
                                @ with scanf
            .align      2

fmt2:       .asciz      "The sum is: %d\n"  @ format string for printf
            .align      2

fmt3:       .asciz      "Please input an integer: "
            .align      2

n:          .word       0       @ memory to store an integer
m:          .word       0

            .text
            .globl      main
main:       push        {lr}    /* save lr for return to caller */

            @printf("Please input an integer: ")
            ldr         r0, =fmt3
            bl          printf

            @ scanf("%d", &n)
            ldr         r0, =fmt1   /* load address of fmt1 string */
            ldr         r1, =n      /* load address of n */
            bl          scanf       /* call scanf("%d",&n) */

            @printf("Please input an integer: ")
            ldr         r0, =fmt3
            bl          printf

            /* add scanf to finish 4. */
            @scanf("%d", &n)
            ldr         r0, =fmt1
            ldr         r1, =m
            bl          scanf



            /* Deprecated/Unused as its an example. */
            /*@ printf("You entered %d\n", n)       */
            /*ldr         r0, =fmt2    load address of fmt2 string */
            /*ldr         r1, =n       load address of n */
            /*ldr         r1, [r1]     load r1 with what r1 points to */
            /*bl          printf       call printf("You entered %d\n", n) */

            ldr         r0, =fmt2
            ldr         r1, =m
            ldr         r1, [r1]
            ldr         r2, =n
            ldr         r2, [r2]
            add         r1,r1,r2
            bl          printf

            mov         r0, #0      /* load return value */
            pop         {lr}        /* retrieve return address */
            mov         pc, lr      /* return to caller */
            .end
