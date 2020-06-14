#include<bits/stdc++.h>
using namespace std;
int ans(vector<int> &v, int k,int * dp){
    int sum = 0;
    for(int i=0;i<v.size();i++){
        sum+= ans(v,k-v[i],dp);
    }
}
int main(){
    int n,S;
    cin>>n>>S;
    vector<int> v[n];
    int dp[n];
    for(int i =0;i<n;i++){
        cin>>v[i];
        dp[i] = -1;
    }
    cout<<ans(v,S,dp);
}