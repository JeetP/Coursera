#include<iostream>
#include<stack>
using namespace std;
stack<int> tower[4];
void TowerofHanoi(int n)
{
	// Preprocessor for moveAndShow.
	 for (int d = n; d > 0; d--) //initialize
		 tower[1].push(d); //add disk d to tower 1
	 moveAndShow(n, 1, 2, 3); /*move n disks from tower 1 to tower 3 using
	// tower 2 as intermediate tower*/
 }
 void moveAndShow(int n, int a, int b, int c)
{
	// Move the top n disks from tower a to tower b showing states.
	// Use tower c for intermediate storage.
	 if(n > 0)
	 {
		 moveAndShow(n-1, a, c, b); //recursion
	 	int d = tower[x].top(); //move a disc from top of tower x to top of
	 	tower[x].pop(); //tower y
		 tower[y].push(d);
	 	showState(); //show state of 3 towers
	 	moveAndShow(n-1, c, b, a); //recursion
	 }
 }
	 
