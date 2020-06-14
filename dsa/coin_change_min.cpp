//Number of integer solutions to 3a+5b+10c = N
#include<bits/stdc++.h>
using namespace std;
int min(int arr[],int n,int sum){
    int table[n+1];
    table[0] = 0;
    for(int i = 1;i<n+1;i++){
        table[i] = INT_MAX;
    }
    for(int i = 1;i<=n;i++){
        for(int j= 0;j<m;j++){
            if(arr[j]<=i){
                int sub_res = arr[i-arr[j]];
                if(sub_res != INT_MAX && sub_res + 1< arr[i])
                    arr[i] = sub_res +1;
            }
        }
    }
    return arr[n];
}
int main(){
    int n;cin>>n;
    int arr[n];
    for(int i =0;i<n;i++){
        cin>>arr[i];
    }
    int sum;
    cin>>sum;
    cout<min(arr,n,sum);
}