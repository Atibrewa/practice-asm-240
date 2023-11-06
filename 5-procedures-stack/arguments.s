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
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	movq	$478, 8(%rsp)
	movl	$200, 4(%rsp)
	movw	$16, 2(%rsp)
	movb	$2, 1(%rsp)
	leaq	1(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 32
	pushq	$2
	.cfi_def_cfa_offset 40
	leaq	18(%rsp), %r9
	movl	$16, %r8d
	leaq	20(%rsp), %rcx
	movl	$200, %edx
	leaq	24(%rsp), %rsi
	movl	$478, %edi
	call	proc
	addq	$32, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	call_proc, .-call_proc
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
