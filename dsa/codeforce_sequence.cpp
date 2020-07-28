#include <iostream>
#include <string.h>
#include <cassert>
using namespace std;
int main(int argc, char* argv[]){
    int n;
    cin>>n;
    assert(n > 0);
    string s = "codeforces";
    while(n>1) {
        s = s + 's';
        n--;
    }
    cout<<s;
    return 0;
}
