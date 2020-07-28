#include <iostream>
#include <vector>
using std::vector;

long long get_fibonacci_partial_sum_naive(long long from, long long to) {
    if(from > to){
      int a = get_fibonacci_partial_sum_naive(0,from)-get_fibonacci_partial_sum_naive(0,to);
      return a > 0 ? a : 10 -a;
    }
    long long sum = 0;

    long long current = 0;
    long long next  = 1;
    for (long long i = 0; i <= to; ++i) {
        if (i >= from) {
            sum += current;
            sum = sum%10;
        }

        long long new_current = next;
        next = (next + current)%10;
        current = new_current%10;
    }

    return sum % 10;
}

int main() {
    long long from, to;
    std::cin >> from >> to;
    std::cout << get_fibonacci_partial_sum_naive(from%60, to%60) << '\n';
}

