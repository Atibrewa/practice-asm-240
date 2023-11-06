# ASM Arithmetic

This activity corresponds to material in section 3.5 of your textbook. It may be useful to refer to the book as you work on this.

Let’s examine arithmetic operations. We have given you the file called `arith.c`, its corresponding `arith.s` x86-64 assembly code, and the Makefile that created them. There is also already a copy of `arith.s` called `commented_arith.txt`, in which you can make comments as you study the assembly code.

There are several functions in the file `arith.c`. Look at each of them and document the assembly code with comments. Be diligent and careful. Describe what each register is holding and which lines of assembly correspond to which lines of C code. The first comment you should make is to state which function parameter is in which register. Start your work by concentrating on the lea instructions.

Next, try going the opposite direction by trying Practice Problems 3.6 and 3.7 (on p. 192 - 193 of US version of textbook, p. 228 - 229 of global edition).

### About the Makefile

Look at line 12 of the Makefile:

	.c.s:

Combined with line 9, which indicates valid suffixes for any files in this directory, this nomenclature on line 12 is called an implicit suffix replacement rule. It is equivalent to writing this:

	%.s : %.c

This is stating that for every file ending in .c that has changed, use the next line to create a file ending in .s from the corresponding .c file. (The % sign is a wildcard for any file name prefix before .c and .s.) If you wish to verify this second form, and it makes more sense to you, try commenting out line 12 from the Makefile (using a #) and adding the alternative above in its place. Then ‘make clean’ and make.

In the compile line itself on line 13, each place that you see $* is where the filename prefix before the .c will be placed when the code is compiled. This enables us to have one set of lines in the Makefile for all targets that will be build in the same manner.
