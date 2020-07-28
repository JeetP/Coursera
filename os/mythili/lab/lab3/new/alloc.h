#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdlib.h>

#define PAGESIZE 4096 //size of memory to allocate from OS
#define MINALLOC 8 //allocations will be 8 bytes or multiples of it

struct __node_t {
    int size;
    char* addr;
} node_t_default ={0};
typedef struct __node_t node_t;
struct Memory {
    char* head;
    char* ptr_next;
    int size;
};
char * addr;

// function declarations
int init_alloc();
int cleanup();
char *alloc(int);
void dealloc(char *);
