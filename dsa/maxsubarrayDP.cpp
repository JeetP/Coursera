#include<bits/stdc++.h>
using namespace std;
int maxsubarray(int arr[],int left, int right){
	int i = left;
	int actual_sum = INT_MIN;
	int sum = 0;
	for(i;i<=right;i++){
		sum += arr[i];
		if(sum>actual_sum){
			actual_sum = sum;
		}
		if(sum<0){
			sum = 0;
		}
	}
	return actual_sum;
}
int main(){
	int n;
	cin>>n;
	int arr[n];
	for(int i=0;i<n;i++)
		cin>>arr[i];
	cout<<maxsubarray(arr,0,n-1);
}
