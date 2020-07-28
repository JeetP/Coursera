#include<bits/stdc++.h>
using namespace std;
int rev(int a){
    while(a % 10 == 0)
        a /= 10;
    int ans = 0;
    while(a){
        ans = ans*10+a%10;
        a = a/10;
    }
    return ans;
}
int main(){
    int n;
    cin >> n;
    while(n--){
        int a,b;
        cin>>a>>b;
        cout<<rev(rev(a)+rev(b))<<endl;
    }
}
