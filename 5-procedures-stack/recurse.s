	.file	"recurse.c"
	.text
	.globl	pcount_r
	.type	pcount_r, @function
pcount_r:
.LFB0:
	.cfi_startproc
	testq	%rdi, %rdi
	jne	.L8
	movl	$0, %eax
	ret
.L8:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	andl	$1, %ebx
	shrq	%rdi
	call	pcount_r
	addq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	pcount_r, .-pcount_r
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
