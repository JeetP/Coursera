#include "kernel/param.h"
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/syscall.h"

void main(int argc, char* argv[]) {
    int parent_fd[2],child_fd[2];
    pipe(parent_fd);
    pipe(child_fd);
    if(fork() == 0) {//child
        char buf[10];
        read(parent_fd[0],buf,sizeof buf);
        fprintf(1,"%d : recieved ping\n",getpid());
        write(child_fd[1],"pong\n",5);
        exit();
    }
    else{
        char buf_[10];
        write(parent_fd[1],"ping\n",5);
        read(child_fd[0],buf_,sizeof buf_);
        fprintf(1,"%d : recieved pong\n",getpid());
        exit();
    }
}
