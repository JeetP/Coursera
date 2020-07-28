#include <iostream>

long long get_fibonacci_huge_naive(long long n, long long m) {
    if (n <= 1)
        return n;

    long long previous = 0;
    long long current  = 1;

    for (long long i = 0; i < n - 1; ++i) {
        long long tmp_previous = previous;
        previous = current;
        current = tmp_previous + current;
    }

    return current % m;
}
long long get_repeat(long long m) {
    if (m <=1)
        return m;
    long long previous = 0;
    long long current = 1;

   for (long long i = 2; ; ++i){
       long long tmp  = previous;
       previous = current;
       current = tmp + current;
       if(previous%m == 0 && current%m == 1)
           return i-1;
   }

}
long long get_fibonacci(long long n, long long m) {
    long long repeat = get_repeat(m);
   // printf("Repaet %lld\n",repeat);
   if(n > m)
       return get_fibonacci_huge_naive(n%repeat,m);
   else
       return get_fibonacci_huge_naive(n,m);
}
int main() {
    long long n, m;
    std::cin >> n >> m;
    //for (int i = 1;i<=10;++i){
      //  printf("Repeat %d : %lld\n",i,get_repeat(i));
    //}
    std::cout << get_fibonacci(n, m) << '\n';
}
