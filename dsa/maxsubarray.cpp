#include<bits/stdc++.h>
using namespace std;
int max(int a,int b){
	return a>b ?a:b;
}
int max(int a,int b,int c){
	return max(a,max(b,c));
}
int cross(int arr[],int low,int mid,int high){
	int left_sum = INT_MIN;
	int sum = 0,max_left;
	for(int i = mid;i>=low;i--){
		sum = sum + arr[i];
		if(sum>left_sum){
			left_sum = sum;
		}
	}
	int right_sum = INT_MIN;
	sum =0;int max_right;
	for(int i = mid+1;i<=high;i++){
		sum = sum+arr[i];
		if(sum>right_sum){
			right_sum = sum;
		}
	}
	return right_sum+left_sum;
}
int maxsubarray(int arr[],int low,int high){
	if(low == high)
		return arr[low];
	else{
		int mid = low + (high-low)/2;
		int left_sum = maxsubarray(arr,low, mid);
		int right_sum = maxsubarray(arr,mid+1,high);
		int cross_sum = cross(arr,low,mid,high);
		return max(left_sum,right_sum,cross_sum);
	}
}
int main(){
	int n;
	cin>>n;
	int arr[n];
	for(int i(0);i<n;i++){
		cin>>arr[i];
	}
	cout<<maxsubarray(arr,0,n-1);
}
