#include <stdio.h>  // printf
#include <assert.h>
#include <stdlib.h>  // malloc, atoi

#define DEFAULT_N 10
#define ZLEN 5

/*
 * Computes and returns the sum of the elements in the array
 * pointed to by arr_ptr.
 *
 */
int sum_p(int *arr_ptr, int N) {
	
	int sum = 0;
	
	for (int i = 0; i < N; i++) {
		sum += *(arr_ptr + i);
	}
	return sum;

}

/*
 * Computes and returns the sum of the elements in the array A.
 *
 */
int sum_index(int *A, int N) {
    int sum = 0;
    int i;
    
	// for loop using indexing goes here
	for (i = 0; i < N; i++) {
		sum += A[i];
	}
    
    return sum;
}

/*
 * return sum from zero to number-1
 */
int scan_sum(int number) {
    int sum = 0;
    for (int i = 0; i < number; i++) {
        sum += i;
    }
    return sum;
}

typedef int zip_dig[ZLEN];
zip_dig pgh[4];

/*
 * return the [i][j] element
 */
int get_pgh_digit (int index, int dig) {
    return pgh[index][dig];
}

int main( int argc, char *argv[]) {
    int array_length = DEFAULT_N;   // default if nothing entered on command line
    // argc is the total number of arguments, including the invoking of the program
    // argv[] is an array of strings
    // argv[0] always has the name of the program
    // argv[1] has the first argument typed
    // 
    if (argc > 1) {  // if we have provided a length
        array_length = atoi(argv[1]);    // atoi converts a string to an int
    }
    printf("For program %s, array length is set to %d\n", argv[0], array_length);
    
    
    ///  We will dynamically allocate on heap instead of this:     
    //          int A[N];    // array of length N
    //
    int * A;    // set the pointer to the beginning (only a single pointer now)
	
    // creates contiguous array of ints in the heap
	A = (int *) malloc(array_length * sizeof(int));  
    
    // fill with dummy data values, using indexing
    for (int i = 0; i<array_length; i++) {
        A[i] = i;
    }
    
    ///// Using the functions
    
    //using A here as the argument to the function means that we are passing the
    // pointer to the zeroth element of the array
    int arraySum = sum_p(A, array_length);  
    
    printf("sum of elements in A is: %d\n", arraySum);
    
    //!! can't do this: int test_sum = scan_sum(A.length);   // no length operator in C
   
    int test_sum = scan_sum(array_length);    // know what we should get
    assert(arraySum == test_sum);
    
    arraySum = sum_index(A, array_length);
    assert(arraySum == test_sum);
	
    // be sure to get rid of the memory on our heap
	free(A);
    
    return 0;
}
