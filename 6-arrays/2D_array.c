/*
    ASM Activity
    Libby Shoop

*/
#include <stdio.h>

// type definitions and constant declarations
#define M 5     // rows
#define N 6     // columns


typedef int Marray_t[M][N];

/*
 *  [][] version
 */
void set_diag(Marray_t A) {
    int i, j;
    j=0;
    for (i = 0; i < M; i++) {
      A[i][j] = 2;
      j++;
    }
	// set the last element for illustration
    A[M-1][N-1] = 99;
}

/**
 * set_diag:
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
*/


/*
 * pointer version
 */
void set_diag_p(Marray_t A) {
    int i;
    int * Arow = &A[0][0];    //pointer declaration for start of row 0
    int * last = Arow + (M-1)*N + (N-1);   // final element in 2D array
                                          // for illustration
    *last = 99;

    int * nextElement = Arow;
    for (i = 0; i < M; i++) {   // complete this part: i is each row
		// find pointer to next diagonal element using i and N
        // update the value pointed to by that element
      int * Element = Arow + (N)*i + (i);
      *Element = 2;
 
    }
    // debug
	  printf ("set_diag_p: last element at M, N is: %d\n", *last);
}

/**
 * set_diag_p:
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
*/


void print_array(Marray_t A){
    int i, j;
    for (i = 0; i < M; i++) {
      for (j = 0; j < N; j++) {
        printf("[%d][%d]  %d    ", i, j, A[i][j]);
      }
      printf("\n");
    }
}

void init_array(Marray_t A){
    int i, j;
    for (i = 0; i < M; i++) {
      for (j = 0; j < N; j++) {
        A[i][j] = 0;
      }
    }
}

int main() {

  Marray_t matrix;
  init_array(matrix);
  printf("Zeroed elements of matrix:\n");
  print_array(matrix);
  printf("after setting diagonal elements  with set_diag():\n");
  set_diag(matrix);
  print_array(matrix);

  init_array(matrix);
  printf("Zeroed elements of matrix:\n");
  print_array(matrix);
  printf("after setting diagonal elements  with set_diag_p():\n");
  set_diag_p(matrix);
  print_array(matrix);


  return 0;
}