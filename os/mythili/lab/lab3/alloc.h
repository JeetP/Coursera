#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdlib.h>

#define PAGESIZE 4096 //size of memory to allocate from OS
#define MINALLOC 8 //allocations will be 8 bytes or multiples of it

// You can declare any data structures required here
char * addr;
struct Memory {
    char * start_addr;
    int size;
}
struct Memory_Table{
    private:
        int size;
        int add(int size){
            
        }
        void remove(int start);
    public:
        MemoryTable(int size){
            this.size = size;
        }
}
// function declarations
int init();
int cleanup();
char *alloc(int);
void dealloc(char *);
