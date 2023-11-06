CC=gcc
CFLAGS= -Og -Wall  -std=c99 -msse3
COFLAGS = -O1 -Wall -std=c99 -msse3
CINC =
F64 =-m64


.SUFFIXES: .c .s 


.c.s:
	$(CC) $(CFLAGS) $(CINC) -S $(F64) $*.c -o $*.s

files:  dynamic_alloc dynamic_alloc.s

dynamic_alloc: dynamic_alloc.c
	$(CC) $(CFLAGS) $(CINC) -o dynamic_alloc dynamic_alloc.c
	
clean:
	rm -f *.s dynamic_alloc
