//include<bits/stdc++.h>
#include<iostream>
using namespace std;
int merge(int arr[],int start,int mid,int end){
	int ans = 0;
	int n1 = mid - start +1;
	int n2  = end - mid;
	int L[n1],R[n2];
	for(int i = 0;i<n1;i++){
		L[i] = arr[start+i];
	}
	for(int i = 0;i<n2;i++){
		R[i] = arr[mid+i+1];
	}
	int i=0,j = 0,k = start;
	while(i<n1 && j<n2){
		if(L[i]<R[j]){
			arr[k] = L[i];i++;
		}
		else{
			arr[k] = R[j];j++;
			ans+=mid-start-i+1;
			cout<<ans<<endl;
		}
		k++;
	}
	while(i<n1){
		arr[k++] = L[i++];	
	}
	while(j<n2){
		arr[k++] = R[j++];
	}
	return ans;
}
int mergesort(int arr[],int start,int end){
	int ans = 0;
	if(start<end){
		int mid = start+(end-start)/2;
		ans +=mergesort(arr,start,mid);
		ans +=mergesort(arr,mid+1,end);
		ans += merge(arr,start,mid,end);
	}
	return ans;
}
int main(){
	int N;
	cin>>N;
	while(N--){
	int n;
	cin>>n;
	int arr[n];
	for(int i =0;i<n;i++)
		cin>>arr[i];
	int ans=mergesort(arr,0,n-1);
	cout<<ans;cout<<endl;
	}
}
