#include<bits/stdc++.h>
using namespace std;
int main(){
    int n;
    cin >> n;
    vector<int> arr(n);
    for(int i = 0; i<n; i++)
        cin>>arr[i];
    int global_sum = arr[0];
    int current_sum = arr[0];
    for(int i = 1;i<n;i++){
        current_sum += arr[i];
        if(current_sum < arr[i])
            current_sum = arr[i];
        if(current_sum > global_sum)
            global_sum = current_sum;
    }
    cout<<global_sum;
}
    
