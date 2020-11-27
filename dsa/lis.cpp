#include <bits/stdc++.h>
using namespace std;

int lis(int* arr,int n){
    int list[n];
    list[0] = 1;
    for(int i = 1;i<n;i++){
        list[i] = 1;
        for(int j = i-1;j>=0;j--){
            if(arr[i] > arr[j] && list[i] < list[j] + 1){
                list[i] = list[j] + 1;
            }
        }
    }
    return *max_element(list,list+n);
}

int main(){
    int n;
    cin>>n;
    int arr[n];
    for (int i = 0;i < n;i++){
        cin>>arr[i];
    }
    cout<<lis(arr,n);
}
