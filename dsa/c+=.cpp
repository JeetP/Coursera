#include<iostream>
#include<cmath>
using namespace std;
int main(int argc, char* argv[]){
    int t;
    cin>>t;
    int a,b,c,ans;
    while(t--){
        cin>>a>>b>>c;
        //cout<<"a = "<<a<<" b = "<<b<<" c = "<<c<<endl; 
        ans = 0;
        while(c >= (a+b)){
            //cout<<"hi"<<c<<" "<< a+b<<endl;
            (a > b) ? (b = a+b) : (a = b + a);
            //cout<< a <<" "<< b <<endl;
            ans++;
        }
        cout<<ans+1<<endl;
    }
    return 0;
}
