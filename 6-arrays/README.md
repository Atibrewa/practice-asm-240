# ASM: Arrays

For this part, we are primarily back to working with C code that will create an executable that we can run.

A file called `array_indexing.c` is started for you. It has a main that declares an array of ints called A of length N, where we use a #define statement to initially set N to 10 (look up C #define directive to learn how it works if this is still unfamiliar).

The Makefile will not build an executable that passes its assert tests until you complete the following tasks.

You can make it and execute it to see how the pointers are incrementing in the code you are given for task 1. However, the asserts will fail until you finish it.

## Task 1: use pointer arithmetic to sum elements

Here is our first task for this code:

1. Write a function `sum_p` that:
    a. Takes a pointer to an int called arr_ptr. This is assumed to be the initial, or zeroth element in the array.
    b. Uses a for loop that increases a pointer to access every element and add its value to a variable called sum.
    c. Returns the sum variable.

The initial code you are given looks like this:

```
int sum_p(int *arr_ptr) {
	int sum = 0;
    int i;
	int * next = arr_ptr;  // points to zeroth element
	
	printf("The pointer values (memory addresses) \nfor each element of array are:\n");
	// for loop using pointer addition goes here
	for (i = 0; i < N; i++) {
		//  you compute the sum by adding one line here
		
		
		next = next + 1;       // increment pointer goes to next element
		printf("%p ", next);
	}
	printf("\n"); 
    
    return sum;
}
```

### Key Point for the above task

The pointer called `next` above is incremented differently than you might imagine it should be after it is initialized to arr_ptr, which is a 64-bit pointer to the zeroth element of the array.  

See section 3.8.2 of Bryant and O’Halloran text:  **"C allows arithmetic on pointers, where the computed value is scaled according to the size of the data type referenced by the pointer."**

This is very commonly used when looping through elements in an array. We start by having a temporary pointer to an int, called next, pointing to the zeroth element of the array. Each time next is incremented by one in the for loop, its value is changed by the size of an int,  so that it now points to the next element in the array. You can see this by observing the printed pointer values, which increase by 4 bytes each time through the loop.

As another case, this expression:

    arr_ptr + N

Is actually adding `N*sizeof(int)` to arr_ptr, and gives us the address just after the last element in the array.

Pointer addition like this is the most common use of arithmetic on pointers in C code. It can be confusing until you get used to it, because of the implied multiplication of the size of the data type in the array.

### What the assembly will look like

There is a second version of the *sum_p* function called *sum_p_no_printf*. Add the necessary line to correctly compute the sum.

Next, let's examine the assembly, in the file called called `array_indexing.s`, that will be created from the Makefile once you complete this task successfully. It should look something like the following, with our added comments for clarity about the looping. You fill in what is not commented yet.

%rdi has the pointer to the zeroth element of the array.

```
sum_p_no_printf:
.LFB8:
        .cfi_startproc
        movl    $0, %edx   # index i is in edx; init to 0
        movl    $0, %eax   # sum is in eax; init to 0
.L7:
        cmpl    $9, %edx      # for loop comparison of %edx to 9
        jg      .L9           #  when edx is > 9, then jump past label .L9 
		                      #  causes return from function
        addl    (%rdi), %eax
        addq    $4, %rdi
        addl    $1, %edx
        jmp     .L7           # jump back to top of loop
.L9:
        ret
        .cfi_endproc
```

## Task 2: Sum elements using array indexing

2. Write a function sum_index that:

    a. uses a for loop that increases an index i to access each element, A[i], and add it to a variable called sum.
    b. returns the sum variable.

The code inside the function should look something like this:

```
int sum;
int i;
for (i=0; i <N; i++) {
   // …  you compute the sum using square bracket syntax
}
```

The main() function uses the sum_p function and the sum_index function on the initialized array called A. Compile a working binary to test whether your functions are working. This is already in the Makefile.

## Examine the differences in the assembly

The Makefile also compiles your code using  the -Og  and -S flags along with -o so that you have an assembly file of this code.  Observe the differences and similarities between the assembly code created for your sum_p_no_printf and sum_index functions.  Make sure you understand how this code matches your intended result in both cases. Add comments into the assembly for sum_index as we did above so you are certain about how it matches the C code.

As an alternative to copying the assembly file to make comments, you could copy the assembly into a commented region of the C code. This way you have the C code and its assembly right next to each other.

## Task 3: 2D array storage

The Makefile has a way to also build the file 2D_array.c. Open it and remove the # from the files directive line and save the Makefile. When you make, it will be able to compile this 2D array example.

Study the file `2D_array.c`. Your main task is to update the function called `set_diag_p`. As you examine this function, make sure you are very clear about what the values M and N represent. Make a comment at the beginning of this function to state what M and N are to help you keep track!

Notice that this line is to show you how the very last element of the array can be accessed using pointer arithmetic:

		int * last = Arow + (M-1)*N + (N-1);   // final element in 2D array

Make a comment here to describe just why last points to the last element in the 2D array.

To complete this function, you may also want to see how it was done with the square bracket notation method. Your goal is to set the diagonal elements to the integer 2.

### Why work out the pointer arithmetic method?

Struggling to get the correct method for working down to an element in an array, signified by how many integers across each row and how many columns over that you need to go in a desired row makes it easier to see how the compiler has to do a similar action, counting bytes, in a matrix stored in row-major order (this is how C does it; other languages could be different).

### Study the assembly

After you have the `set_diag_p` working, you can look at the assembly for both functions, `set_diag` and `set_diag_p`. It is useful for you to be able to understand clearly what the assembly for these functions is accomplishing. In this case, there is more than one way to complete `set_diag_p`, which might even change the assembly. Some of it may be perplexing. The assembly for `set_diag`, however, should be straightforward, if you can work out how the looping is working.

