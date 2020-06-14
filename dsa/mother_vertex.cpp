#include <bits/stdc++.h>
using namespace std;

class graph {
    private:
        int v;
        list <int> *adj;
void dfs(int i, vector <bool> &visited);
    public:
        graph (int v) {
            this -> v = v;
            adj = new list <int> [v];
        }
        void addEdge (int j, int w) {
            adj[j].push_back(w);
        }
        int findMother();
};

void graph :: dfs (int i, vector <bool> &visited) {
    visited[i] = true;
    for (auto itr = adj[i].begin(); itr != adj[i].end(); ++itr) {
        if(!visited[*itr])
            dfs(*itr,visited);
    }
}
int graph::findMother() {
    vector <bool> visited(v,false);
    int last_vertex = 0;
    for (int i = 0; i < v; ++i) {
        if (!visited[i]) {
            dfs(i, visited);
            last_vertex = i;
        }
    }
    fill (visited.begin(), visited.end(), false);
    dfs (last_vertex, visited);
    for (int i = 0; i < v; ++i) {
        if (!visited[i])
            return -1;
    }
    return last_vertex;
}

int main () {
    graph g(7);
    g.addEdge(0, 1);
    g.addEdge(0, 2);
    g.addEdge(1, 3);
    g.addEdge(4, 1);
    g.addEdge(6, 4);
    g.addEdge(5, 6);
    g.addEdge(6,0 );
    cout<< "Mother_Vertex is " << g.findMother();
    return 0;
}
