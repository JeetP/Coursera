#include<bits/stdc++.h>
using namespace std;
void bubblesort(int arr[],int N){
	for(int i = 0;i<N;i++){
		for(int j = N-1;j>i;j--){
			if(arr[j]<arr[j-1]){
				int temp = arr[j];
				arr[j] = arr[j-1];
				arr[j-1] = temp;
			}
		}
	}
}
int main(){
	int n;
	cin>>n;
	int N = n;
	int arr[n];
	while(n--)
		cin>>arr[N-n-1];
	bubblesort(arr,N);
	int i = 0;
	while(N--)
		cout<<arr[i++]<<" ";
}
