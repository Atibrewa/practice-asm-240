	.file	"gt.c"
	.text
	.globl	gt
	.type	gt, @function
gt:
.LFB0:
	.cfi_startproc
	cmpq	%rsi, %rdi
	setg	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	gt, .-gt
	.globl	zero
	.type	zero, @function
zero:
.LFB1:
	.cfi_startproc
	testq	%rdi, %rdi
	sete	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	zero, .-zero
	.globl	geq
	.type	geq, @function
geq:
.LFB2:
	.cfi_startproc
	cmpq	%rsi, %rdi
	setge	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE2:
	.size	geq, .-geq
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
