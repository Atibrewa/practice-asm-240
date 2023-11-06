# ASM Control Flows

The Makefile for this example is a bit more complicated than you have used recently. It will make a single version of assembly for the original `gt.c` file, but two versions of assembly for the `control.c` file, which we will observe later.

Run this to see the assembly files get created:

    make clean
    make

## Part 1: Relational Operators

The file called `gt.c` contains 2 small functions that illustrate how the relational operators get translated into assembly code. In particular, it contains the > operator and the == operator in two separate functions.

### Explain the code for `gt()`

Look carefully at the assembly code for the function `gt()` in the file `gt.s`. Explain how the 3 lines of assembly work together to do what the function was coded to do, either as comments on a copy of the assembly or in a separate text file. Recall what cmpq does and how it is used in conjunction with setg. Refer to your book or the class slides.

### Explain the code for `zero()`

Look carefully at the assembly code for the function `zero()`. How are registers rsi and rdi being compared using the testq instruction? When this is done, why can we then use sete to tell if x was == zero? Explain in comments on a copy of the assembly file or in a separate text file. Recall what testq does and how it is used in conjunction with sete in this case. Refer to your book or class slides.

### Now try some other operators

Add more functions of your own design to the file `gt.c`. Use other relational operators (>=  <  <=  ==  != ) and try different data types besides long. Re-make the assembly and observe what results.

## Part 2: Conditionals

Let's turn to an example in the file called `control.c`. It contains three versions of C code that accomplish the same thing. It is computing and returning what is called the absolute difference between the inputs x and y. Look at the first function, `absdiff()`, and study it to make sure you know what it is doing.

The next two functions in this file are equivalent to `absdiff`. The first one, `absdiff_j`, mimics how the compiler, when set to minimally optimize code, creates the assembly using a jump where you see goto in the C.

The third function `absdiff_cm`, mimics what the compiler does to turn the above versions into conditional move versions when using the -O1 optimization flag.

### Lowest Compiler Optimization

The file `control.no_cm_s` was compiled using gcc with the command line flag -Og (capital letter O with a g). This is the lowest level of optimization. Look at the control.c file and `control.no_cm_s`.

Try to explain to yourself and your neighbor what this assembly code is doing for each of the three functions. Which 2 functions are essentially the same assembly and which one differs slightly?

### More Optimization: Conditional Moves

The file `control.O1_cm_s` (capital letter O in its name) was compiled using the gcc command line flag -O1 (capital letter O with a one), which is a higher level of compiler optimization than -Og. Note how it contains conditional move operations (cmovle). Try to explain to yourself and your neighbor what this assembly code is doing. Is there any difference between the assembly for the 3 functions?

What have we learned in class about why this optimization is useful for running the code faster?
