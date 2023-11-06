
// returns 1 if x > y
int gt (long x, long y)
{
  return x > y;
}
// why is it just fine for this to return an int? - because result of a computation is 0 or 1

// returns 1 if x is equal to zero
int zero(long x) {
    return x == 0L;   // what does the L do? - makes it a long instead of the default int!
}

// TODo: 
// Now experiment below here with the rest of the relational operators
// in new functions:
// >=  <  <=  ==  !=
// 
// also try different data types

// returns 1 if x >= y
int geq(long x, long y) {
    return x >= y; 
}