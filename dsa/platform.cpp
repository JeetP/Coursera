#include<bits/stdc++.h>
using namespace std;
int answer(int n){
    int arr[n],dep[n];
    for(int i =0;i<n;i++){
        cin>>arr[i];
    }
    for(int i =0;i<n;i++){
        cin>>dep[i];
    }
    sort(arr,arr+n);
    sort(dep,dep+n);
    int result  = 1,i=1,j=0,plat = 1;
    while(j!=n-1){
        if(arr[i]<=dep[j]){
            plat++;
            i++;
            if(plat>result)
                result = plat;
        }
        else{
            plat--;
            j++;
        }
    }
    return result;
}
int main()
 {
	//code
	int test;
	cin>>test;
	while(test--){
	    int n;
	    cin>>n;
	    cout<<answer(n)<<endl;
	}
	return 0;
}