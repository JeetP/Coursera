#include <iostream>

int get_change(int m) {
    int coin = 0;
    if(m/10 != 0){
        coin += m/10;
        m = m % 10;
    }
    if(m/5 !=0){
        coin += m/5;
        m = m % 5;
    }
    if(m/1!=0){
        coin += m/1;
        m = m % 1;
    }
    return coin;
}
int main() {
    int m;
    std::cin >> m;
    std::cout << get_change(m) << '\n';
}        
