#include <iostream>

long long get_fibonacci_huge_naive(long long n, long long m) {
    if (n <= 1)
        return n;

    long long previous = 0;
    long long current  = 1;

    for (long long i = 0; i < n - 1; ++i) {
        long long tmp_previous = previous;
        previous = current;
        current = (tmp_previous + current)%m;
    }

    return current % m;
}
long long get_seq(long long m){
    long long count = 1;
    long long current = 0;
    long long prev = 1;
    long long p_prev = 0;
    while(true) {
        current = (prev + p_prev)%m;
        count++;
        if( current == 1 && prev == 0)
            break;
        p_prev = prev;
        prev = current;
    }
    return count-1;
}
long long get_fib(long long n, long long m) {
    long long seq = get_seq(m);
    return get_fibonacci_huge_naive(n%seq,m);
}
int main() {
    long long n, m;
    std::cin >> n >> m;
    std::cout << get_fib(n,m) << '\n';
}

