#include <bits/stdc++.h>
using namespace std;
void max_heapify(int arr[],int n,int a){ // subtree rooted at index a obeys max-heap property Works
	int left,right;
	left = 2*a+1;
	right = 2*a+2;
	int larger;
	if(left<=n && arr[left]>arr[a]){
		larger = left;
	}
	else larger = a;
	if(right<=n && arr[right]>arr[larger]){
		larger = right;
	}
	if(larger != a){
		int temp = arr[a];
		arr[a] = arr[larger];
		arr[larger] = temp;
		max_heapify(arr,n,larger);
	}
}
void min_heapify(int arr[],int n,int a){
	int left = 2*a+1;
	int right = 2*a+2;
	int smaller;
	if(left<=n && arr[left]<arr[a]){
		smaller = left;
	}
	else
		smaller = a;
	if(right<= n && arr[right]<arr[smaller]){
		smaller = right;
	}
	if(smaller != a){
		int temp = arr[a];
		arr[a] = arr[smaller];
		arr[smaller] = temp;
		min_heapify(arr,n,smaller);
	}
}
void max_heapify_iterative(int arr[],int n,int a){ // subtree rooted at index a obeys max-heap property
	int left,right;
	while(a<=n){
		left = 2*a+1;
		right = 2*a+2;
		int larger;
		if(left<=n && arr[left]>arr[a]){
			larger = left;
		}
		else larger = a;
		if(right<=n && arr[right]>arr[larger]){
			larger = right;
		}
		if(larger != a){
			int temp = arr[a];
			arr[a] = arr[larger];
			arr[larger] = temp;
			a = larger;
		}
		else{
			break;
		}
	}
}
void build_max_heap(int arr[],int n){
	for(int i = (n+1)/2;i>0;i--){
		max_heapify(arr,n,i-1);
	}
}
void build_min_heap(int arr[],int n){
	for(int i = (n+1)/2;i>0;i--){
		min_heapify(arr,n,i-1);
	}
}
void heapsort(int arr[],int n){
	build_max_heap(arr,n);
	for(int i = n;i>=1;i--){
		int temp = arr[0];
		arr[0]=arr[i];
		arr[i]= temp; 
		max_heapify(arr,i-1,0);
	}
}
using namespace std;
/*int main(){
	int n;	
	cin>>n;
	int arr[n];
	for(int i = 0;i<n;i++){
		cin>>arr[i];
	}
	heapsort(arr,n-1);
	for(int i = 0;i<n;i++){
		cout<<arr[i]<<" ";
	}
}*/
