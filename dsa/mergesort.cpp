#include<iostream>
using namespace std;
void merge(int arr[],int start,int mid, int end){
	int n1 = mid-start+1;
	int n2 = end-mid;
	int L[n1],R[n2];
	for(int i = 0;i<n1;i++)
		L[i] = arr[start+i];
	for(int i = 0;i<n2;i++)
		R[i] = arr[mid+1+i];
	int i = 0,j = 0,k = start;
	while(i<n1 && j < n2){
		if(L[i]<R[j]){
			arr[k] = L[i];i++;k++;
		}
		else{
			arr[k] = R[j];j++;k++;
		}
	}
	while(i<n1){
			arr[k] = L[i];
			i++;k++;
		}
	while(j<n2){
			arr[k] = R[j];
			j++;k++;
	}
}
void mergesort(int arr[],int start,int end){
	if(start<end){
		int mid = start + (end-start)/2;
		mergesort(arr,start,mid);
		mergesort(arr,mid+1,end);
		merge(arr,start,mid,end);
	}
}
int main(){
	int n;
	cin>>n;
	int arr[n];
	for(int i=0;i<n;i++){
		cin>>arr[i];
	}
	mergesort(arr,0,n-1);
	for(int i=0;i<n;i++){
		cout<<arr[i];
	}
	
}
