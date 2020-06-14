#include<bits/stdc++.h>
using namespace std;
#define max 100
void fact(int a){
    int res[max];
    for(int i = 0;i<max;i++){
        res[i] = a%10;
        a/=10;
    }
    int carry;
    for(int i = 1;i<a;i++){
        carry = 0;
        for(int i = 0;i<max;i++){
            res[i] = res[i] * 
        }    
    }
}
int main(){
    int n,a;
    cin>>n;
    while(n--){
        cin>>a;
        fact(a);
    }
}
