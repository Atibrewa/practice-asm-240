	.file	"casting.c"
	.text
	.globl	addMult
	.type	addMult, @function
addMult:
.LFB0:
	.cfi_startproc
	addl	%esi, %edi
	movswl	%dx, %eax
	imull	%edi, %eax
	cltq
	ret
	.cfi_endproc
.LFE0:
	.size	addMult, .-addMult
	.globl	arith_u
	.type	arith_u, @function
arith_u:
.LFB1:
	.cfi_startproc
	movzbl	%dil, %edi
	salq	$6, %rdi
	movzwl	%si, %esi
	leaq	42(%rsi,%rdi), %rax
	ret
	.cfi_endproc
.LFE1:
	.size	arith_u, .-arith_u
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
