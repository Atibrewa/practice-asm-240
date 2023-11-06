CC = gcc
OFLAGS = -Og
CFLAGS = $(OFLAGS) -Wall -g

CINC =
F64 =-m64


.SUFFIXES: .c .s 


.c.s:
	$(CC) $(OFLAGS) $(CINC) -S $(F64) $*.c -o $*.s


files:	arith.s


clean:
	rm -f *~ *.s *.64d 
