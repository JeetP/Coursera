#include <iostream>
#include <cstring>
using namespace std;

class QuickFind
{
    private:
        int* parent;
        int find (int p)
        {
            return parent[p];
        }
    public:
        QuickFind (int n)
        {
            parent = new int [5];
            for (int i = 0; i < n; ++i)
            {
                parent[i] = -1;
            }
        }
        bool find (int p, int q)
        {
            return find(p) == find(q);
        }
        void union_ (int p, int q)
        {
            if (parent[p] != parent[q]) 
            {
                int parent_p = find(p);
                for (int i = 0;i < parent.length; ++i)
                {
                    if (parent[i] == parent_p)
                        parent[i] = parent[q];
                }
            }
        }
};

class QuickUnion
{
    private:
        int * parent;
        int find (int p)
        {
            if (parent[p] != -1)
                return find(parent[p]);
            return p;
        }
    public:
        QuickUnion (int n)
        {
            parent = new int [n];
            for (int i = 0; i < n; ++i)
            {
                parent[i] = -1;
            }
        }
        bool find (int p, int q)
        {
            return find(p) == find(q);
        }
        void union (int p, int q)
        {
            int a = find(p);
            int b = find(q);
            if (a != b)
                parent[a] = b;
        }
};

class union_find
{
    private:
        int *parent;
        int * size;
        int find (int p)
        {
            if (parent[p] != -1)
            {
                parent[p] = parent[ parent[p] ];
                find(parent[p]);
            }
            return p;
        }
    public:
        union_find (int n)
        {
            parent = new int[n];
            size = new int[n];
            memset(parent, 0, n * sizeof(int));
            memset(size, 1, n * sizeof(int));
        }
        bool find (int p, int q)
        {
            return find(p) == find(q);
        }
        void union (int p, int q)
        {
            int i = find(p);
            int j = find(q);
            if (size(i) < size(j)) 
            {
                parent[i] = j;
                size[j] += size[i];
            }
            else
            {
                parent[j] = i;
                size[i] += size[j];
            }
        }
};
