// A Dynamic Programming solution for subset sum problem 
#include <stdio.h> 

// Returns true if there is a subset of set[] with sun equal to given sum 
bool isSubsetSum(int set[], int n, int sum) 
{ 
	int subset[n+1][sum+1];
     
	
} 

// Driver program to test above function 
int main() 
{ 
int set[] = {3, 34, 4, 12, 5, 2}; 
int sum = 9; 
int n = sizeof(set)/sizeof(set[0]); 
if (isSubsetSum(set, n, sum) == true) 
	printf("Found a subset with given sum"); 
else
	printf("No subset with given sum"); 
return 0; 
} 
// This code is contributed by Arjun Tyagi. 
