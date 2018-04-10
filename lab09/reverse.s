	.arch armv6
	.fpu vfp
	.text
	.align	2
	.global	reverseLine
	.type   reverseLine, %function
.equiv  EOLN, 10        @ ASCII end of line
.equiv  EOF, -1
        @ uses two system functions:  fgetc and fputc
        @ fgetc(address of stream) ==> returns next character in stream
        @                             -1 for error or EOF
        @ fputc(a character, address of output stream)
reverseLine:
	stmfd	sp!, {r4, r5, fp, lr}
	@add	fp, sp, #4      @ set up for local/automatic variable
        mov     fp, sp
        sub     sp, sp, #8
        ldr     r5, output
        ldr     r5, [r5]        @ address of stream stdout
        
        bl      doReverse
    
        mov     r0, #EOLN
        mov     r1, r5
        bl      fputc
        mov     sp, fp
	ldmfd	sp!, {r4, r5, fp, pc}
        .align  2
input:  .word   stdin
output: .word   stdout
