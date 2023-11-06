// traditional if statement
long absdiff(long x, long y)
{
    long result;
    if (x > y) {        // if x <= y, it jumps to else
        result = x-y;   // returns a positive value
    } else {            // performs this if x <= y
        result = y-x;   // returns a positive value
    }
    return result;
}

// jump version-
// mimics how the compiler, using the -Og optimization,
// creates the assembly code using a jump where you see goto
long absdiff_j(long x, long y)
{
    long result;
    int ntest = x <= y;     // if x <= y, it sets nstest = 1
    if (ntest) goto Else;   // if ntest is 1, then it jumps to the else statement
    result = x-y;           // if ntest is not 1, it computes x-y since x > y
    goto Done;              // jumps to the end
 Else:                      // performs if x <= y
    result = y-x;           // gives positive value since x <= y
 Done:                      
    return result;          // returns the result based on whichever chunk ran!
}

// illustrates conditional move way of coding-
// mimics what the compiler does to turn the above versions
// into conditional move versions when using -O1
long absdiff_cm(long x, long y)
{
    long result;
    result = x-y;           
    long eval = y-x;        // computes both x-y and y-x in last 2 lines
    if (x <= y) {           // checks if x <= y then result should be y-x, else it stays as x-y
	     result = eval;
    }
    return result;          // returns the result :)
}
