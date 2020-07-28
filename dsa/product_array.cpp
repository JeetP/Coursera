#include<bits/stdc++.h>
using namespace std;
int main()
 {
     int n;
     cin>>n;
     int n_temp = n;
     vector<vector<int>>question;
     while(n_temp--){
         int a;
         cin>>a;
         vector<int> q;
         while(a--){
             int b;cin>>b;
            q.push_back(b);
         }
         question.push_back(q);
     }
     int seq = 0;
     while(n--){
         vector<int> nums = question[seq++];
        vector<int> right;
        vector<int> ans;
        right.push_back(nums.size()+1);
        int left = 1;
        right[nums.size()] = 1;
        for(int i = nums.size()-1;i>=0;i--){
            right[i] = right[i+1]*nums[i];
        }
        for(int i = 0;i<nums.size();i++){
            ans.push_back(left*right[i+1]);
            left*=nums[i];
        }
        for(auto kk:ans)
            cout<<kk<<" ";
        cout<<endl;
     }
	//code
	return 0;
}