# Casting in C and Assembly

In C code, we can explicitly cast expressions or variables of one type to a *wider* type, that is, a type that contains more bytes that the original. Let's examine this in assembly.

#### <img src="../img/emblem-important.svg" alt="Important" width="20" align="bottom"> Narrowing is bad, and so is most implicit casting

Note that we never want to convert an expression result or a variable to a type that has fewer bytes.

We also want to avoid the use of implicit casting as much as we possibly can. This is where the compiler is able to attempt the cast, or a function such as printf does the cast for us. These types of *implicit* casting make code hard to read and can cause bugs to creep in over time as code is changed.

## Task 1: Two's Complement

A Makefile is provided to generate `casting.s` from `casting.c`.

Let's start by looking at the function `addMult` in the file `casting.c`. In this case we are dealing with signed integers. Functions like this are not uncommon in typed languages, where you might get a value such as the parameter z that was returned from a library function, which then is used in another function with variables of type long, and overall the function returns a long.

Observe the assembly code for `addMult`. The 'movslq' operation is handling the widening of the variable z.

What does ‘movslq’ do? Why is the movslq operation being used on the input parameter named z to move it into a register? Compare this to the other possible mov operations. Write your answers in a text file.

## Task 2: Unsigned Values

Now let's examine an example using unsigned data variables, found in `arith_u`. This is a somewhat typical example of how we might widen with a cast to get the data types we need for certain arithmetic expressions.

What operations are performing the widenings in the assembly code for `arith_u`? Why is each of these used—what is the difference between them? Can you think of why the operations ending in l (eg movzbl) were sufficient and therefore chosen by the compiler? Write your answers in a text file.

### Solution

In answer to this question: What operations are performing the widenings in the assembly code for arith_u? Why is each of these used—what is the difference between them?

    movzbl widens a char, which is one byte, to a double-word. movzwl widens a short, which is 2 bytes (w) to a double-word.

In answer to this question: Can you think of why the operations ending in l (eg movzbl) were sufficient and therefore chosen by the compiler?

    This is a bit of a conundrum, really. It is because the movzxl (x = b or w) instructions in the Intel CPUs are documented to automatically zero out all of the 'upper', or most significant 32 bits of the register. This means that even though you would expect a movzbq to be used to widen to an unsigned long, instead the compiler writer knows that it could use movzbl with the source being a register name beginning with an e, such as %edi. Then subsequent instructions can use %rdi, which is guaranteed to have the upper 32 bits set to zero.

    This is only the case for the unsigned widenings to 64 bits, which use movzxl instructions instead of movzxq. When widening to less than 32 bits, say from 8 to 16, the zeroing out of the upper bits is not guaranteed. So in these cases the expected movzxx command would need to be used and the register names could not be substituted for longer ones in later instructions.
    
    The widening of signed values using the movsxx commands behave like you might expect.

## Task 3: Experiment

Try devising your own new functions that do arithmetic on variables of different types that need widening. Observe the assembly to see if you can understand what it is doing.
   

