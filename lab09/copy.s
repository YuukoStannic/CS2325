	.arch armv6
	.fpu vfp
        .text
	.align	2
	.global	main
	.type	main, %function
.equiv  EOF,-1
main:
        @ uses two system functions:  fgetc and ungetc
        @ fgetc(address of stream) ==> returns next character in stream
        @                              -1 for end of file/stream or error
        @ ungetc(character, address of stream) ==> pushes character back
        @                                          onto stream
        @ program demonstrates making use of stack pointer to manage
        @ local/automatic variables
         
	stmfd	sp!, {r4, fp, lr}
	@add	fp, sp, #4      @ set up space for local variable ch
        mov     fp, sp
        sub     sp, sp, #8      @ 
        ldr     r4, input
        ldr     r4, [r4]        @ r4 holds FILE * stdin

while:
	mov	r0, r4
	bl	fgetc           @ returns ch or EOLN or error
	str	r0, [fp, #-4]
	cmp	r0, #0
	beq	exitMain
        cmp     r0, #EOF
	beq	exitMain
        @loop body
	ldr	r0, [fp, #-4]
	mov	r1, r4
	bl	ungetc
	bl	copyLine
        bal     while

exitMain:
	mov	r0,#0   @ return code from main
        @set up for return
	@sub	sp, fp, #4
        mov     sp, fp
	ldmfd	sp!, {r4, fp, pc}
	.align	2
input:  .word	stdin
