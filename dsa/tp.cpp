#include <bits/stdc++.h>
using namespace std;

int main() {
	// your code goes here
	int t;
	cin>>t;
	while(t--){
	    int n;
	    cin>>n;
	    int arr[11];
	    memset(arr,0,sizeof(arr));
	    while(n--){
	        int a,b;
	        cin>>a>>b;
	        if(arr[a-1]<b)
	            arr[a-1] = b;
	    }
	    int sum = 0;
	    for(int i = 0;i<8;i++){
	        sum+=arr[i];
	    }
	    cout<<sum<<endl;
	}
	return 0;
}
