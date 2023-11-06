	.file	"array_indexing.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The pointer values (memory addresses) \nfor each element of array are:"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%p "
	.text
	.globl	sum_p
	.type	sum_p, @function
sum_p:
.LFB7:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	$.LC0, %edi
	call	puts
	movl	$0, %ebp
	movl	$0, %r12d
.L2:
	cmpl	$9, %ebp
	jg	.L5
	addl	(%rbx), %r12d
	addq	$4, %rbx
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	addl	$1, %ebp
	jmp	.L2
.L5:
	movl	$10, %edi
	call	putchar
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
	.size	sum_p, .-sum_p
	.globl	sum_p_no_printf
	.type	sum_p_no_printf, @function
sum_p_no_printf:
.LFB8:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
.L7:
	cmpl	$9, %edx
	jg	.L9
	addl	(%rdi), %eax
	addq	$4, %rdi
	addl	$1, %edx
	jmp	.L7
.L9:
	ret
	.cfi_endproc
.LFE8:
	.size	sum_p_no_printf, .-sum_p_no_printf
	.globl	sum_index
	.type	sum_index, @function
sum_index:
.LFB9:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
.L11:
	cmpl	$9, %edx
	jg	.L13
	movslq	%edx, %rcx
	addl	(%rdi,%rcx,4), %eax
	addl	$1, %edx
	jmp	.L11
.L13:
	ret
	.cfi_endproc
.LFE9:
	.size	sum_index, .-sum_index
	.section	.rodata.str1.1
.LC2:
	.string	"sum of elements in A is: %d\n"
.LC3:
	.string	"array_indexing.c"
.LC4:
	.string	"arraySum == 45"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$40, %edi
	call	malloc
	movq	%rax, %rbx
	movl	$0, %eax
.L15:
	cmpl	$9, %eax
	jg	.L20
	movslq	%eax, %rdx
	movl	%eax, (%rbx,%rdx,4)
	addl	$1, %eax
	jmp	.L15
.L20:
	movq	%rbx, %rdi
	call	sum_p
	movl	%eax, %ebp
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	cmpl	$45, %ebp
	jne	.L21
	movq	%rbx, %rdi
	call	sum_index
	cmpl	$45, %eax
	jne	.L22
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.2319, %ecx
	movl	$82, %edx
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	call	__assert_fail
.L22:
	movl	$__PRETTY_FUNCTION__.2319, %ecx
	movl	$85, %edx
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	call	__assert_fail
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2319, @object
	.size	__PRETTY_FUNCTION__.2319, 5
__PRETTY_FUNCTION__.2319:
	.string	"main"
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
