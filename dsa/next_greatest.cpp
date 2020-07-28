#include<bits/stdc++.h>
using namespace std;
int main()
 {
	//code
	int n;
	cin>>n;
	while(n--){
	    int a;
	    int aa = a;
	    cin>>a;
	    int arr[a];
	    stack<int> stack;
	   while(a){
	       cin>>arr[aa-(a--)];
	   }
	   stack.push(arr[0]);
	   for(int i = 1;i<a;i++){
	       if(stack.empty()){
	           stack.push(arr[i]);
	           continue;
	       }
	       while(stack.empty() == false && stack.top()<arr[i]){
	           cout<<stack.top()<<" ";
	           stack.pop();
	       }
	       stack.push(arr[i]);
	   }
	   cout<<endl;
	}
	return 0;
}