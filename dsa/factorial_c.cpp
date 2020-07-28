#include<bits/stdc++.h>
#define size 500
using namespace std;

void factorial (int n){
    int res[size];
    res[0] = 1;
    int len = 1;
    for (int i = 1; i <= n;++i) {
        int carry = 0;
        for(int j = 0;j<len;++j) {
            int prod = res[j]*i+carry;
            res[j]= prod%10;
            carry = prod/10;
            if(j == len-1 && carry > 0){
                res[len-1] = carry;
                len++;
            }
        }
    }
    for(int i = len-1; i>=0;i--){
        cout<<res[i];
    }
    cout<<endl;
}
int main()
 {
	//code
	int t,n;
	cin>>t;
	while(t--) {
	    cin>>n;
	    factorial(n);
	}
	return 0;
}