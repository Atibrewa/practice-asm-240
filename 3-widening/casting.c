/*
 * Examples of casting and how it is manifested in the assembly code
 */

// A somewhat typical function, where data of different original types
// is being converted to the widest possible type, then added and returned.
// 
// Here we are widening two's complement numbers
// 
long addMult(int x, int y, short z) {
  int t1 = x + y;
  int t2 = t1 * (int) z;  //widening z
  return (long) t2;
}

unsigned long arith_u(unsigned char x, unsigned short y) {
	unsigned long t1 = (unsigned long) x * 64;
	unsigned long t2 = (unsigned long) y + 42;
	
	return t1 + t2;
}