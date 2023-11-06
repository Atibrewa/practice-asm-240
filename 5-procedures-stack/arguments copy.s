	.file	"arguments.c"
	.text
	.globl	proc
	.type	proc, @function
proc:
.LFB0:
	.cfi_startproc
	movq	16(%rsp), %rax
	addq	%rdi, (%rsi)
	addl	%edx, (%rcx)
	addw	%r8w, (%r9)
	movl	8(%rsp), %edx
	addb	%dl, (%rax)
	ret
	.cfi_endproc
.LFE0:
	.size	proc, .-proc
	.globl	call_proc
	.type	call_proc, @function
call_proc:
.LFB1:
	.cfi_startproc
	subq	$16, %rsp		/* Allocates 16 bytes to stack */
	.cfi_def_cfa_offset 24
	movq	$478, 8(%rsp)	/* stores l in a memory address (&l) using 8 bytes*/
	movl	$200, 4(%rsp)	/* stores i in mem address (&i) using 4 bytes*/
	movw	$16, 2(%rsp)	/* stores s in mem address (&s) */
	movb	$2, 1(%rsp)		/* stores c in mem address (&c) */
	leaq	1(%rsp), %rax	/* puts the address of the top of the stack in rax */
	pushq	%rax			/* decerments the stack and pushes the 8-byte address into it! Now, stack is 16 + 8 bytes*/
	.cfi_def_cfa_offset 32
	pushq	$2				/* decrements and pushes another address into stack! Now stack is 16 + 8 + 8 = 32 bytes */
	.cfi_def_cfa_offset 40
	leaq	18(%rsp), %r9	/* puts &s as arg 6*/
	movl	$16, %r8d		/* s is arg 5 */
	leaq	20(%rsp), %rcx	/* &i is arg 4 */
	movl	$200, %edx		/* i is arg 3 */
	leaq	24(%rsp), %rsi	/* &l is arg 2 */
	movl	$478, %edi		/* l is arg 1 */
	call	proc			/* calls proc! */
	addq	$32, %rsp		/* needs to put rsp back in original place, which is 32 bits off */
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	call_proc, .-call_proc
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
