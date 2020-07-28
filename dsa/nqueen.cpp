#include<bits/stdc++.h>
using namespace std;
vector<vector<vector<int>>> ans;
bool isSafe(vector<vector<int>> &board,int row,int col){
	for(int i =0;i<col;i++){
		if(board[row][i])
			return false;
	}
	for(int i =row,j = col;i>=0&&j>=0;i--,j--){
		if(board[i][j])
			return false;
	}
	for(int i =row, j = col;i<board.size()&&j>=0;i++,j--){
		if(board[i][j])
			return false;
	}
	return true;
}
void print(vector<vector<int>> &board){
	cout<<'[';
	for(int i =0;i<board.size();i++){
		for(int j =0;j<board.size();j++){
			if(board[i][j])
				cout<<j+1<<" ";
		}
	}
	cout<<']';
}
bool solve(vector<vector<int>> &board,int row){
	if(row>=board.size()){
		print(board);
		return true;
	}
	bool res = false;
	for(int i = 0;i<board.size();i++){
		if(isSafe(board,row,i)){
			board[row][i] = 1;
			res = solve(board, row + 1) || res;
			board[row][i] = 0;
		}
	}
	return res;
}
void solvenq(int n){
	vector<vector<int>> board(n,vector<int>(n,0));
	solve(board,0);
}
int main()
 {
	//code
	int t;
	cin>>t;
	for(int i = 0;i<t;i++){
		int n;
		cin>>n;
		solvenq(n);
		cout<<endl;
	}
	return 0;
}