#include <bits/stdc++.h>
using namespace std;
int lcs(int a, int b,string c, string d){
    if(a >= c.size() || b >= d.size())
        return 0;
    else if(c[a] == d[b])
        return 1 + lcs(a+1,b+1,c,d);
    else{
        return max(lcs(a+1,b,c,d), lcs(a,b+1,c,d));
    }
}
int main(){
    string a,b;
    cin>>a>>b;
    cout<<lcs(0,0,a,b);
}
