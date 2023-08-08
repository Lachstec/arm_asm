#include <stdio.h>

extern int square(int x);
extern int my_pow(int x, int y);
extern int arithm_mean(long *x, size_t len);

int main(int argc, char** argv) {
  // compute 5 * 5
  int a = 5;
  int b = square(a);
  // compute 2 ^ 6
  int c = 2;
  int d = 6;
  int e = my_pow(c, d);

  long arr[] = {1, 2, 3, 4, 5};
  int mean = arithm_mean(arr, 5);
  printf("%d squared is: %d\n", a, b);
  printf("%d to the power of %d is: %d\n", c, d, e);
  printf("The arithmetic mean of the array is: %d\n", mean);
  return 0;
}
