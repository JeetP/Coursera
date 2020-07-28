#include <iostream>
#include <vector>
#include <list>
#include <iterator>
using namespace std;

class graph
{
    private:
        int v;
        list <int> *adj;
        void dfs(int , vector <bool> &);
    public:
        graph (int v)
        {
            this -> v  = v;
            adj = new list <int>[v];
        }
        void topologicalSort();
        void addEdge(int, int);
};
int main ()
{
    graph g(6); 
    g.addEdge(5, 2); 
    g.addEdge(5, 0); 
    g.addEdge(4, 0); 
    g.addEdge(4, 1); 
    g.addEdge(2, 3); 
    g.addEdge(3, 1); 

    cout << "Following is a Topological Sort of the given graph \n"; 
    g.topologicalSort(); 

    return 0; 
}
void graph :: topologicalSort()
{
    vector <bool> visited (v, false);
    for (int i= 0; i < v; ++i)
    {
        if (!visited[i])
            dfs (i,visited);
    }
}
void graph :: dfs (int a, vector <bool> &visited)
{
    visited[a] = true;
    for (auto itr = adj[a].begin(); itr != adj[a].end(); ++itr)
    {
        if (!visited[*itr])
        {
            dfs (*itr, visited);
        }
    }
    cout<<a<<" ";
}
void graph :: addEdge (int a, int b)
{
    adj[a].push_back(b);
}
