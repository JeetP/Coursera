#include<bits/stdc++.h>
#include<iostream>
using namespace std;
void seive(int n,bool is_prime[]){
    is_prime[0] = is_prime[1] = false;
    for(int i =2;i<=n;i++){
        is_prime[i] = true;
    for (int i=2; i*i<=n; i++) 
        if(is_prime[i] == true){
            for(int j = i*2;j<=n;j+=i)
                is_prime[j] = false;
        }
    }
}
int main(){
    int n;
    cin>>n;
    bool prime[n+1];
    seive(n,prime);
    for(int i = 0;i<=n;i++){
        if(prime[i])
            cout<<i<<endl;
    }
}