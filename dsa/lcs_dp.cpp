#include <bits/stdc++.h>
using namespace std;
int lcs(int a, int b,string c, string d,vector<vector<int> >& arr){
    if(a >= c.size() || b >= d.size())
        return 0;
    if(arr[a][b] != -1)
        return arr[a][b];
    else if(c[a] == d[b])
        return arr[a][b] = 1 + lcs(a+1,b+1,c,d,arr);
    else{
        return arr[a][b] = max(lcs(a+1,b,c,d,arr), lcs(a,b+1,c,d,arr));
    }
}
int main(){
    string a,b;
    cin>>a>>b;
    vector<vector<int> > arr(a.size(),vector<int>(b.size(),-1));
    cout<<lcs(0,0,a,b,arr);
}
