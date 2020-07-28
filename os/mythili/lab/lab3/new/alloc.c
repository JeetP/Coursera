#include "alloc.h"

struct Memory memory_table;
int init_alloc() {
    addr = mmap(NULL,PAGESIZE,PROT_WRITE | PROT_READ,MAP_ANON | MAP_PRIVATE,-1,0);
    if(addr == MAP_FAILED)
        return -1;
    else {
        memory_table.head = (char *) addr;
        memory_table.size = PAGESIZE;
        memory_table.ptr_next = (char *)addr;
        return 0;
    }
}
int cleanup() {
    return munmap(addr,PAGESIZE);
}
char* alloc(int bufSize) {
    if(bufSize % MINALLOC != 0 || memory_table.size < bufSize)
        return NULL;
    //struct node_t node;
    //struct node.size = bufSize;
    //struct Mode.addr = head;
    //head = head +
}
void dealloc(char* memAddr) {
}

int main(){
    init_alloc();
    // *addr = 'k';
    printf("%p OK %c",addr,*addr);
    cleanup(addr);
    return 0;
}
