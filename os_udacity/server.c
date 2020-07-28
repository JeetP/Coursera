#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/netinet/in.h>

void error(char *msg){
    perror(msg);
    exit(1);
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr,"Error, no port provided\n");
        exit(1);
    }
    int sockfd, newsockfd, portno, clilen,n;
    char buffer[256];
    struct sockaddr_in serv_addr,cli_addr;
    sockfd = socket(AF_INET,SOCK_STREAM,0);
    if(sockfd < 0)
        error("Error opeing socket");
    bzero((char*) &serv_addr, sizeof(serv_addr));
    portno = atoi(argv[1]);
    serv_addr.sin_family  = AD_INET;
    serv_addr.sin_port = htons(portno);
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    if(bind(sockfd,(struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        error("Error on binding");
    listem(sockfd,5);
    clilen = sizeof(cli_addr);
    newsockfd = accept(sockfd,(struct sockaddr *) &cli_addr,&clilen);
    if (newsockfd < 0)
        error("Error on accept");
    bzero(buffer,256);
    m = read(newsockfd,buffer,255);
    if (n<0) error("Error reading from socket");
    printf("Here is the message: %s\n",buffer);
    n = write(newsockfd,"I got your message",18);
    if (n<0) error("Error writing to socket");
    return 0;
}
