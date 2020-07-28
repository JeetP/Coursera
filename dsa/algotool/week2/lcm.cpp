#include <iostream>

long long lcm_naive(int a, int b) {
  for (long l = 1; l <= (long long) a * b; ++l)
    if (l % a == 0 && l % b == 0)
      return l;

  return (long long) a * b;
}
int gcd(int a, int b) {
    if (b == 0)
        return a;
    a = a % b;
    return gcd(b,a);
}

long long lcm(int a, int b) {
    int gcd_ = gcd(a, b); 
    long long product = (long long) a * b;
    return product/gcd_;
}
int main() {
  int a, b;
  std::cin >> a >> b;
  std::cout << lcm(a, b) << std::endl;
  return 0;
}
