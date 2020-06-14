#include<iostream>
using namespace std;  
void insertion_reverse(int arr[],int n){
	for(int j =1;j<n;j++){
		int key = arr[j];
		int i = j-1;
		while(i>=0 & key>arr[i]){
			arr[i+1] = arr[i];
			i--;
		}
		arr[i+1] = key;
	}
}
int main(){
	int n;
	cin>>n;
	int N = n;
	int arr[n];
	int i = 0;
	while(n--){
		cin>>arr[i++];
	}
	insertion_reverse(arr,N);
	for(i= 0;i<N;i++){
		cout<<arr[i];
	}
}
