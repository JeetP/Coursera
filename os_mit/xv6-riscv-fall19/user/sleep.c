#include "kernel/param.h"
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/syscall.h"
void main(int argc, char* argv[]){
    if(argc != 2)
        printf("Incorrect command: Ex. sleep 10\n");
    sleep(atoi(argv[1]));
    exit();
}
