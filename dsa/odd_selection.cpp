#include <iostream>
using namespace std;
int main(int argc, char* argv[]){
    int t;
    cin>>t;
    int n,x,odd = 0,num,even;
    while(t--){
        cin>>n>>x;
        odd = 0;
        for (int i = 0;i < n; ++i) {
            cin>>num;
            if(num % 2 != 0)
                odd++;
        }
        even = n - odd;
        if( (x - even)%2 == 0 && (odd > x-even && even > 0)){
            cout<<"Yes"<<endl;
        }
        else if( (x-even)%2 != 0 && odd >= 1){
            cout<<"Yes"<<endl;
        }
        else{
            cout<<"No"<<endl;
        }

    }
    return 0;
}
