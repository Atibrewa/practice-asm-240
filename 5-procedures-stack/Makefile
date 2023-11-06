CC=gcc
CFLAGS= -Og -Wall
COFLAGS = -O1 -Wall
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

files:	incr.s mstore-exe.64d recurse.s arguments.s

mstore-exe.64d: mstore.c main.c
	$(CC) $(CFLAGS) $(CINC) $(F64) mstore.c main.c -o mstore
	objdump -d mstore > mstore-exe.64d
	rm -f mstore

clean:
	rm -f *~
	rm -f *.s *.64o *.64d
	rm -f incr mstore

