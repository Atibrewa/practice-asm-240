#include <stdio.h>  // printf
#include <stdlib.h>  // malloc
#include <assert.h>

#define N 10

/*
 * Computes and returns the sum of the elements in the array
 * pointed to by arr_ptr.
 *
 */
int sum_p(int *arr_ptr) {
	int sum = 0;
    int i;
	int * next = arr_ptr;  // points to zeroth element
	
	printf("The pointer values (memory addresses) \nfor each element of array are:\n");
	// for loop using pointer addition goes here
	for (i = 0; i < N; i++) {
		//  you compute the sum by adding one line here
		sum = sum + *(next);
		
		next = next + 1;       // increment pointer goes to next element
		printf("%p ", next);
	}
	printf("\n"); 
    
    return sum;
}
int sum_p_no_printf(int *arr_ptr) {
	int sum = 0;
    int i;
	int * next = arr_ptr;  // points to zeroth element
	
	// for loop using pointer addition goes here
	for (i = 0; i < N; i++) {
		//  you compute the sum by adding one line here
		sum = sum + *(next);
		
		next = next + 1;       // increment pointer goes to next element
	}
    
    return sum;
}

/*
 * Computes and returns the sum of the elements in the array A.
 *
 */
int sum_index(int *A) {
    int sum = 0;
    int i;
    
	// for loop using indexing goes here
	for (i = 0; i < N; i++) {
        sum += A[i];
    }
    
    return sum;
}

/**
 * sum_index:
.LFB9:
	.cfi_startproc
	movl	$0, %edx            // sum = 0
	movl	$0, %eax            // i = 0
.L11:
	cmpl	$9, %edx            // compares i and 9, (9-i)
	jg	.L13                    // if i > 9, jump to l13, which is outside the loop
	movslq	%edx, %rcx          // moves i to rcx to be able to perform address computations
	addl	(%rdi,%rcx,4), %eax // gets i-th element and adds it to sum
	addl	$1, %edx            // increments i by 1
	jmp	.L11
.L13:
	ret
	.cfi_endproc
*/

int main() {
    ///  We will dynamically allocate on heap instead      int A[N];    // array of length N
    //
    int * A;    // set the pointer to the beginning (only a single pointer now)
	
	A = (int *) malloc(N * sizeof(int));  // creates contiguous array of ints in the heap
    
    // fill with dummy data values, using indexing
    for (int i = 0; i<N; i++) {
        A[i] = i;
    }
    
    ///// Using the functions
    
    //using A here as the argument to the function means that we are passing the
    // pointer to the zeroth element of the array
    int arraySum = sum_p(A);  
    
    printf("sum of elements in A is: %d\n", arraySum);
    // 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 = 45
    assert(arraySum == 45);
    
    arraySum = sum_index(A);
    assert(arraySum == 45);
    
    return 0;
}