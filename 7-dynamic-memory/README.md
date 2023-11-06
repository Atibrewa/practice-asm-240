# Dynamic Memory Allocation with `malloc`

Now let's examine the code in the file called `dynamic_alloc.c`. In this code we will allocate the array dynamically on the 'heap' portion of memory set aside for our program (see class slides).

Note that we will be using a function called `malloc` (short for memory allocation). For this we add an include at the top of our file:

    #include <stdlib.h>  // malloc, atoi

The only things that have changed in our code from the example in `array_indexing.c` are 

1. the way that we declare and create the memory for the array.
2. the fact that we need to free up that heap space ourselves at the end of our program.

Step 1 is done with these lines of code:

```
    int * A;    // set the pointer to the beginning (only a single pointer now)
	
    // creates contiguous array of ints in the heap
	A = (int *) malloc(array_length * sizeof(int));  
```
With `malloc`, it is up to we programmers to state how many **bytes** we want to allocate.

Also, `malloc` is defined to return a void \*, so we must **always cast to a pointer to whatever type the array is**.

Step 2 is done when we no longer need the array:

    free(A);

### <img src="./img/emblem-important.svg" alt="Important" width="20" align="bottom"> The dreaded memory 'leak'
Forgetting to free your dynamically allocated memory is the source of many problems with C code, as the heap just keeps getting larger and the memory footprint of your program keeps getting bigger. The common term for this is that your program has a **memory leak**.


## Build and Run the Code

Build with make and run the executable called `./dynamic_alloc`

Note that it results in the same output as the previous activity with static memory allocation.

## Provide Command Line Arguments

One way that we can truly make the size of our array dynamic is to provide its size on the command line each time we run it (changing it each time we run it).

This is done in our main by changing its function declaration to look like this:

    int main(int argc, char *argv[]) { ... }
    
When invoked on the terminal command line, `argc` will contain the number of items that were typed on the command line, separated by spaces, including the name of the program to be run (with the ./ in front if you typed it). The variable `argv`, which is an array of strings, contains each string that was typed on the command line. Thus, in our case `argv[0]` will be the string "./dynamic_alloc", and if we add a space followed by another number after that, that will signify the size of array that we want, and it will be in `argv[1]`.

Study the first several lines of `main()` where we have read and interpreted the `array_size` value in `argv[1]`, if it had been supplied.

Now try running the code this way:

    ./dynamic_alloc 20
    
Re-run it several times, changing the size of the array.

## Look at the Assembly

An interesting exercise is to take a quick look at the assembly for this code, in particular in main where the memory allocation is taking place. What does it look like?


