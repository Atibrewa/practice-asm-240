# Examining Assembly Language Code

In this activity, you will see your first example of compiling C source code into assembly. Create a new plain text file in this repository and take notes as you observe the different features discussed below.

Please also try changing and recompiling the C source code, to observe how the assembly changes in response!

Let’s start with the file called `swap.c`.  Look at the code for `swap.c` and determine what is new to you or that you only vaguely recall.  You may want to explore those new or vaguely familiar features of C, since they will show up in other examples. 

There are some files already made from the Makefile included in this directory. One is the assembly language file made from `swap.c`, which is called `swap.s`.

You can compile everything again as follows. The Makefile does quite a bit—we will review that below.

    make clean
	make files

(aside: **_files_** is a kind of unfortunate word choice for a target in this makefile; hope it isn’t too confusing. It is meant to indicate that we are making intermediate files as part of the entire C compiling process.)

## VS Code Users

There is an extension in the marketplace for viewing assembly files. Got to the marketplace by choosing it along the left side (below the bug icon), and search for **assembly**. Then pick the popular one for x86 and x86_64.

## Introduction to Reading Assembly

The assembly code for `swap.s` corresponds to `swap.c`. Look at the section of the file `swap.s` right after these lines:

    swap:

    .LFB0:

    and before the occurrence of this line:

    .LFE0:

This code is the set of 64-bit "assembly" version of the instructions corresponding to the function called swap in the `swap.c` code.

Note that `%rax` and other variables beginning with `%r` in x86-64 assembly refer to the registers on the machine.  We will see details of each of these later.

As a way to understand the code, you will add comments to a copy of `swap.s`.  You should **do this by making a duplicate** of the `swap.s` file called `commented_swap.txt`, copying the contents of `swap.s` into it, and editing that file. (You should use a copy so you don’t overwrite your work when using make.) Examine each line carefully and write comments to indicate what each line is doing. Concentrate on the consecutive move instructions, which are the ‘body’ of the code. You can refer to an example in your book in section 3.4.3, including the blue box about C pointers.

Be sure you have a reference and are familiar with what the names of the registers are in 64-bit assembly code (as produced by our compiler, gcc).  These are listed in Figure 3.2 of your textbook and are given in the slides for class. Figure 3.2 of your textbook also has a simpler example called exchange, will likely be helpful if you are confused about how this code works.

### Commenting Assembly Code

For the linux GNU assembler, comments in the assembly code can be written like old-style C comments like this:

    /* a comment */

### Parameters Go Into Registers

The parameters to a function such as swap automatically get placed in particular registers. By convention, register %rdi holds the first parameter, and register %rsi holds the second parameter. We'll learn the conventions for more parameters later.

In this case, `%rdi` has xp, a pointer, which means it is an **address in memory**. `%rsi` has yp, also a pointer, thus holds a memory address.

## Try `int` Values

Now copy `swap.c` to a new file, `swap_int.c`.  Edit the code to change ‘long’ to ‘int’. Add `swap_int.s` to the `files:` line of the Makefile and you should be able to make it.

Look at the difference between `swap.s` and `swap_int.s`.  Make sure that you understand and can explain these differences (talk it over with your table in class).

## Makefile: What's Going On?

Open up the Makefile and look at it. There are many new things to notice about it. Here are a few:

* makefiles can contain definitions, such as in line 2, where CC is defined to be the same as gcc.  Then later in the Makefile, the tag $(CC)  is replaced by gcc before the compilation begins for a target. This is true for every definition you see at the top of the file. By convention these are all capital letters.

* makefiles can contain specially coded targets for C code files. In this makefile, one of them looks like this on a line by itself:

    .c.s:
	
	This is indicating that the next tab-indented line in the makefile will be used to create a file ending in .s from and original file ending in .c. An additional feature is that it is implying that any file ending in .c is a prerequisite for creating a corresponding file ending in .s.

* the line containing .SUFFIXES: target works in conjunction with the .c.s: target

* The -Og flag denotes that the compiler should use the lowest level of optimization (for us this means the assembly code will be easier to read). This is a minus sign, capital Oh letter,  and a lower case g. 

* The -S flag creates assembly language code in files called [TARGET].s. (This is a minus and a capital S all by itself sent to gcc.) For this activity, the 'target' assembly code file we will examine is `swap.s`.

## References

The skill you will need to develop is to be able to interpret this assembly language code.  Here are a few references (besides your book) that tell you a bit more about x-86 assembly code:

[http://ref.x86asm.net/](http://ref.x86asm.net/)   (try the coder64 version)

[http://en.wikipedia.org/wiki/X86_assembly_language](http://en.wikipedia.org/wiki/X86_assembly_language)

[http://en.wikipedia.org/wiki/X86_instruction_listings](http://en.wikipedia.org/wiki/X86_instruction_listings)

[http://en.wikibooks.org/wiki/X86_Assembly/X86_Instructions](http://en.wikibooks.org/wiki/X86_Assembly/X86_Instructions)
