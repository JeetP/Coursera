#include<iostream>
#include<fstream>
#define N 100000
using namespace std;
void mergesort(int arr[],int low,int high,int n){
    if(low>high)
        return;
    int mid = low + (high-low)/2;
    mergesort(arr,low,mid,n/2);
    mergesort(arr,mid+1,high,n-n/2);
    merge(arr,low,mid,high);
}
int main(){
    int arr[N];
    ifstream input;
    input.open("IntegerArray.txt");
    int counter = 1;
    while(!input.eof){
        cin>>arr[counter++];
    }
    mergesort(arr,0,counter-1,counter);
}