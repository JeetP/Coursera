#include<iostream>
#include<bits/stdc++.h>
using namespace std;
int answer(int size){
    int arr[size];
    int ans = 0;
    for(int i= 0;i<size;i++){
        cin>>arr[i];
	}
	int left[size];
	int right[size];
	left[0] = arr[0];
	right[size-1] = arr[size-1];
	
	for(int i= 1;i<size;i++){
        left[i] = max(arr[i],left[i-1]);
	}
	for(int i= size-2;i>=0;i--){
        right[i] = max(arr[i],right[i+1]);
	}
	for(int i= 0;i<size;i++){
        ans+= min(left[i],right[i])-arr[i];
	}
	return ans;
}
int main()
 {
	//code
	int n;
	cin>>n;
	while(n--){
	    int size;
	    cin>>size;
	    cout<<answer(size)<<endl;
	}
	return 0;
}