#include <iostream>
#include <list>
#include <iterator>
#include <stdio.h>
#include <string.h>
using namespace std;

class graph {
    private:
        int v;
        list <int> *adj;
        bool ** tc;
        void dfs (int a, int b)
        {
            tc[a][b] = true;
            for (auto itr = adj[a].begin(); itr != adj[a].end(); ++itr)
            {
                if (!tc[a][*itr])
                    dfs (a,*itr);
            }
        }
    public:
        graph (int v)
        {
            this -> v = v;
            adj = new list <int>[v];
            tc = new bool *[v];
            for (int i = 0; i < v; ++i)
            {
                tc[i] = new bool[v];
                memset(tc[i], false, v * sizeof(bool)); 
            }
        }
        void addEdge (int a, int b)
        {
            adj[a].push_back(b);
        }
        void transitiveClosure(); 
};
int main ()
{
    graph g(4); 
    g.addEdge(0, 1); 
    g.addEdge(0, 2); 
    g.addEdge(1, 2); 
    g.addEdge(2, 0); 
    g.addEdge(2, 3); 
    g.addEdge(3, 3); 

    cout << "Transitive closure matrix is \n"; 
    g.transitiveClosure(); 

    return 0;
}
void graph :: transitiveClosure()
{
    for (int i = 0; i < v; ++i)
    {
        dfs(i, i);
    }
    for (int i = 0; i < v; ++i)
    {
        for (int j = 0; j < v; ++j)
        {
            cout << tc[i][j] << " ";
        }
        cout<<endl;
    }
}

