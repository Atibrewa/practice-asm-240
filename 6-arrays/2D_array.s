	.file	"2D_array.c"
	.text
	.globl	set_diag
	.type	set_diag, @function
set_diag:
.LFB3:
	.cfi_startproc
	movl	$0, %edx
.L2:
	cmpl	$4, %edx
	jg	.L4
	movslq	%edx, %rcx
	leaq	(%rcx,%rcx,2), %rsi
	leaq	0(,%rsi,8), %rax
	addq	%rdi, %rax
	movl	$2, (%rax,%rcx,4)
	addl	$1, %edx
	jmp	.L2
.L4:
	movl	$99, 116(%rdi)
	ret
	.cfi_endproc
.LFE3:
	.size	set_diag, .-set_diag
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"set_diag_p: last element at M, N is: %d\n"
	.text
	.globl	set_diag_p
	.type	set_diag_p, @function
set_diag_p:
.LFB4:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rsi
	movl	$99, 116(%rdi)
	movl	$0, %edx
.L6:
	cmpl	$4, %edx
	jg	.L9
	leal	(%rdx,%rdx,2), %ecx
	leal	(%rcx,%rcx), %eax
	cltq
	movslq	%edx, %rcx
	addq	%rcx, %rax
	movl	$2, (%rsi,%rax,4)
	addl	$1, %edx
	jmp	.L6
.L9:
	movl	116(%rdi), %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4:
	.size	set_diag_p, .-set_diag_p
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"[%d][%d]  %d    "
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB5:
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
	movq	%rdi, %r12
	movl	$0, %ebp
	jmp	.L11
.L17:
	movl	$10, %edi
	call	putchar
	addl	$1, %ebp
.L11:
	cmpl	$4, %ebp
	jg	.L16
	movl	$0, %ebx
.L13:
	cmpl	$5, %ebx
	jg	.L17
	movslq	%ebp, %rax
	leaq	(%rax,%rax,2), %rdx
	leaq	0(,%rdx,8), %rax
	addq	%r12, %rax
	movslq	%ebx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movl	%ebx, %edx
	movl	%ebp, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	addl	$1, %ebx
	jmp	.L13
.L16:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_array, .-print_array
	.globl	init_array
	.type	init_array, @function
init_array:
.LFB6:
	.cfi_startproc
	movl	$0, %esi
	jmp	.L19
.L24:
	addl	$1, %esi
.L19:
	cmpl	$4, %esi
	jg	.L23
	movl	$0, %edx
.L21:
	cmpl	$5, %edx
	jg	.L24
	movslq	%esi, %rax
	leaq	(%rax,%rax,2), %rcx
	leaq	0(,%rcx,8), %rax
	addq	%rdi, %rax
	movslq	%edx, %rcx
	movl	$0, (%rax,%rcx,4)
	addl	$1, %edx
	jmp	.L21
.L23:
	ret
	.cfi_endproc
.LFE6:
	.size	init_array, .-init_array
	.section	.rodata.str1.1
.LC2:
	.string	"Zeroed elements of matrix:"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"after setting diagonal elements  with set_diag():"
	.align 8
.LC4:
	.string	"after setting diagonal elements  with set_diag_p():"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	subq	$136, %rsp
	.cfi_def_cfa_offset 144
	movq	%rsp, %rdi
	call	init_array
	movl	$.LC2, %edi
	call	puts
	movq	%rsp, %rdi
	call	print_array
	movl	$.LC3, %edi
	call	puts
	movq	%rsp, %rdi
	call	set_diag
	movq	%rsp, %rdi
	call	print_array
	movq	%rsp, %rdi
	call	init_array
	movl	$.LC2, %edi
	call	puts
	movq	%rsp, %rdi
	call	print_array
	movl	$.LC4, %edi
	call	puts
	movq	%rsp, %rdi
	call	set_diag_p
	movq	%rsp, %rdi
	call	print_array
	movl	$0, %eax
	addq	$136, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
