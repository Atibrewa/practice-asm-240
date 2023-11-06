	.file	"dynamic_alloc.c"
	.text
	.globl	sum_p
	.type	sum_p, @function
sum_p:
.LFB7:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
.L2:
	cmpl	%esi, %edx
	jge	.L4
	movslq	%edx, %rcx
	addl	(%rdi,%rcx,4), %eax
	addl	$1, %edx
	jmp	.L2
.L4:
	ret
	.cfi_endproc
.LFE7:
	.size	sum_p, .-sum_p
	.globl	sum_index
	.type	sum_index, @function
sum_index:
.LFB8:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
.L6:
	cmpl	%esi, %edx
	jge	.L8
	movslq	%edx, %rcx
	addl	(%rdi,%rcx,4), %eax
	addl	$1, %edx
	jmp	.L6
.L8:
	ret
	.cfi_endproc
.LFE8:
	.size	sum_index, .-sum_index
	.globl	scan_sum
	.type	scan_sum, @function
scan_sum:
.LFB9:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
.L10:
	cmpl	%edi, %edx
	jge	.L12
	addl	%edx, %eax
	addl	$1, %edx
	jmp	.L10
.L12:
	ret
	.cfi_endproc
.LFE9:
	.size	scan_sum, .-scan_sum
	.globl	get_pgh_digit
	.type	get_pgh_digit, @function
get_pgh_digit:
.LFB10:
	.cfi_startproc
	movslq	%esi, %rax
	movslq	%edi, %rdi
	leaq	(%rdi,%rdi,4), %rsi
	addq	%rax, %rsi
	movl	pgh(,%rsi,4), %eax
	ret
	.cfi_endproc
.LFE10:
	.size	get_pgh_digit, .-get_pgh_digit
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"For program %s, array length is set to %d\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"sum of elements in A is: %d\n"
.LC2:
	.string	"dynamic_alloc.c"
.LC3:
	.string	"arraySum == test_sum"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbp
	cmpl	$1, %edi
	jg	.L22
	movl	$10, %ebx
.L15:
	movl	%ebx, %edx
	movq	0(%rbp), %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movslq	%ebx, %rdi
	salq	$2, %rdi
	call	malloc
	movq	%rax, %rbp
	movl	$0, %edx
.L16:
	cmpl	%edx, %ebx
	jle	.L23
	movslq	%edx, %rcx
	movl	%edx, 0(%rbp,%rcx,4)
	addl	$1, %edx
	jmp	.L16
.L22:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, %ebx
	jmp	.L15
.L23:
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	sum_p
	movl	%eax, %r13d
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	%ebx, %edi
	call	scan_sum
	movl	%eax, %r12d
	cmpl	%eax, %r13d
	jne	.L24
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	sum_index
	cmpl	%eax, %r12d
	jne	.L25
	movq	%rbp, %rdi
	call	free
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.2329, %ecx
	movl	$98, %edx
	movl	$.LC2, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L25:
	movl	$__PRETTY_FUNCTION__.2329, %ecx
	movl	$101, %edx
	movl	$.LC2, %esi
	movl	$.LC3, %edi
	call	__assert_fail
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2329, @object
	.size	__PRETTY_FUNCTION__.2329, 5
__PRETTY_FUNCTION__.2329:
	.string	"main"
	.comm	pgh,80,32
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
