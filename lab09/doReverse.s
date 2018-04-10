	.arch armv6
	.fpu vfp
	.text
	.align	2
	.global	doReverse
	.type   doReverse, %function
.equiv  EOLN, 10        @ ASCII end of line
.equiv  EOF, -1
        @ uses two system functions:  fgetc and fputc
        @ fgetc(address of stream) ==> returns next character in stream
        @                             -1 for error or EOF
        @ fputc(a character, address of output stream)
doReverse:
	stmfd	sp!, {r4, r5, fp, lr}
	@add	fp, sp, #4      @ set up for local/automatic variable
        mov     fp, sp
	sub	sp, sp, #8
        ldr     r4, input
        ldr     r4, [r4]        @ address of stream stdin
        ldr     r5, output
        ldr     r5, [r5]        @ address of stream stdout
reverseLine:
        mov     r0, r4
        bl      fgetc
        str     r0, [fp, #-4]
        cmp     r0, #0
        beq     exitDoReverse
        cmp     r0, #EOLN
        beq     exitDoReverse
        bl      doReverse
        ldr     r0, [fp, #-4]
        mov     r1, r5
        bl      fputc

exitDoReverse:
        @ prepare for return
	@sub	sp, fp, #4
        mov     sp, fp
	ldmfd	sp!, {r4, r5, fp, pc}
        .align  2
input:  .word   stdin
output: .word   stdout
