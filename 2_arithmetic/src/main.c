#include <stdio.h>

extern int square(int x);
extern int my_pow(int x, int y);

int main(int argc, char** argv) {
  // compute 5 * 5
  int a = 5;
  int b = square(a);
  // compute 2 ^ 6
  int c = 2;
  int d = 6;
  int e = my_pow(c, d);
  printf("%d squared is: %d\n", a, b);
  printf("%d to the power of %d is: %d\n", c, d, e);
  return 0;
}
