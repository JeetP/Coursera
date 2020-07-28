#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
int main(int agrc, char* argv[]){
    int fd = open("foo",O_CREAT|O_WRONLY|O_TRUNC|S_IRUSR|S_IWUSR);
    return 0;
}
