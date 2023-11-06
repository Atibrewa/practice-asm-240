CC=gcc
CFLAGS= -Og  -std=c99 -msse3
COFLAGS = -O1 -Wall -std=c99 -msse3
CINC =
F64 =-m64


.SUFFIXES: .c .s .O1-s .64o .64d


.c.s:
	$(CC) $(CFLAGS) $(CINC) -S $(F64) $*.c -o $*.s

.c.O1-s:
	$(CC) $(COFLAGS) $(CINC) -S $(F64) $*.c -o $*.O1-s

.c.64d:
	$(CC) $(CFLAGS) $(CINC) $(F64) $*.c -o $*
	objdump -d $* > $*.64d
	rm -f $*


files: array_indexing array_indexing.s 2D_array 2D_array.s 

array_indexing: array_indexing.c
	$(CC) $(CFLAGS) $(CINC) -o array_indexing array_indexing.c
	
2D_array: 2D_array.c
	$(CC) $(CFLAGS) $(CINC) -o 2D_array 2D_array.c

	
clean:
	rm -f *.s array_indexing 2D_array
