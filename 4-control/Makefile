CC = gcc
OGFLAGS = -Og
O1FLAGS = -O1
CFLAGS = $(OFLAGS) -Wall

CINC =
F64 =-m64

#NCMOV = -fno-if-conversion  #obsolete


.SUFFIXES: .c .s .no_cm_s .O1_cm_s


.c.s:
	$(CC) $(OGFLAGS) $(CINC) -S $(F64) $*.c -o $*.s

.c.O1_cm_s:
	$(CC) $(O1FLAGS) $(CINC) -S $(F64) $*.c -o $*.O1_cm_s

.c.no_cm_s:
	$(CC) $(OGFLAGS) $(CINC) -S $(F64) $*.c -o $*.no_cm_s


all: files

files:	gt.s control.no_cm_s control.O1_cm_s

clean:
	rm -f gt.s control.no_cm_s control.O1_cm_s
