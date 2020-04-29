#include  <stdio.h>
#include  <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

#define MAX_INPUT_SIZE 1024
#define MAX_TOKEN_SIZE 64
#define MAX_NUM_TOKENS 64

/* Splits the string by space and returns the array of tokens
*
*/
pid_t background[64],foreground[64];
int back,forward;

void killall(pid_t pid[],int number){
	printf("number is%d\n",number);
	for(int i = 0; i < number; i++){
		kill(pid[i],SIGKILL);
		//printf("killed %d\n",pid[i]);
	}
}

void execute(char** tokens,int flag){
	if(strcmp(tokens[0],"cd")==0){
		int n = chdir(tokens[1]);
		if(n<0)
			printf("Shell: Incorrect command\n");
	}
	else if(strcmp(tokens[0],"exit")==0){
		//printf("exit called\n");
		killpg(5,SIGKILL);
		//killall(background,back);
		exit(0);
	}
	else if(flag==0){
		if(fork() > 0){
			wait(0);
		}
		else{
			int n = execvp(tokens[0],tokens);
			if(n<0)
				printf("Shell: Incorrect command\n");
			exit(0);
		}
	}
	else{
		int n = execvp(tokens[0],tokens);
		if(n<0)
			printf("Shell: Incorrect command\n");
		exit(0);
	}

	// Freeing the allocated memory	
	for(int i=0;tokens[i]!=NULL;i++){
		free(tokens[i]);
	}
	free(tokens);
}
char **tokenize(char *line)
{
  char **tokens = (char **)malloc(MAX_NUM_TOKENS * sizeof(char *));
  char *token = (char *)malloc(MAX_TOKEN_SIZE * sizeof(char));
  int i, tokenIndex = 0, tokenNo = 0;

  for(i =0; i < strlen(line); i++){

    char readChar = line[i];

    if (readChar == ' ' || readChar == '\n' || readChar == '\t'){
      token[tokenIndex] = '\0';
      if (tokenIndex != 0){
	tokens[tokenNo] = (char*)malloc(MAX_TOKEN_SIZE*sizeof(char));
	strcpy(tokens[tokenNo++], token);
	tokenIndex = 0; 
      }
    } else {
      token[tokenIndex++] = readChar;
    }
  }
 
  free(token);
  tokens[tokenNo] = NULL ;
  return tokens;
}

void sighandler(){
	kill(6,SIGKILL);
	//killall(foreground,forward);
	//printf("\n");
	//exit(0);
}
int main(int argc, char* argv[]) {
	char  line[MAX_INPUT_SIZE];            
	char  **tokens;              
	int i;

	FILE* fp;
	if(argc == 2) {
		fp = fopen(argv[1],"r");
		if(fp < 0) {
			printf("File doesn't exists.");
			return -1;
		}
	}

	while(1) {			
		/* BEGIN: TAKING INPUT */
		signal(SIGINT, sighandler);
		int flag = 0;
		bzero(line, sizeof(line));
		if(argc == 2) { // batch mode
			if(fgets(line, sizeof(line), fp) == NULL) { // file reading finished
				break;	
			}
			line[strlen(line) - 1] = '\0';
		} else { // interactive mode
			printf("$ ");
			scanf("%[^\n]", line);
			getchar();
		}
		//printf("Command entered: %s (remove this debug output later)\n", line);
		/* END: TAKING INPUT */

		line[strlen(line)] = '\n'; //terminate with new line
		tokens = tokenize(line);
		for(i=0;tokens[i]!=NULL;i++){
			if(strcmp(tokens[i],"&")==0)
				flag = 1;
			if(strcmp(tokens[i],"&,")==0)
				flag = 1;
			else if(strcmp(tokens[i],"&&")==0)
				flag = 2;
			else if(strcmp(tokens[i],"&&&")==0)
				flag = 3;
		}

		if(flag == 1){
			int i = 0;
			char *token = strtok(line, "&,");
			while (token != NULL) 
			{
				pid_t parent = fork();
				if(parent==0){
					//printf("%s token is\n",token);
					execute(tokenize(token),1);
					exit(0);
				}
				else{
					//printf("%d\n", parent);
					background[back++] = parent;
					setpgid(parent,5);
					token = strtok(NULL, "&,");
				}
			}
			wait(0);
		}
		
		else if(flag == 2){//done
			int i = 0;
			char *token = strtok(line, "&&"); 
			while (token != NULL) 
			{
				execute(tokenize(token),0);
				token = strtok(NULL, "&&"); 
			}
		}
		
		else if(flag == 3){
			int i = 0;
			char *token = strtok(line, "&&&"); 
			pid_t parent;int status;

			while (token != NULL) 
			{
				pid_t parent = fork();
				if(parent==0){
					//printf("%s executing by pid %d my parent is %d\n",token,getpid(),getppid());
					execute(tokenize(token),1);
					exit(0);
				}
				else{
					printf("%d\n", parent);
					foreground[forward++] = parent;
					setpgid(parent,6);
					token = strtok(NULL, "&&&");
				}
			}
			for(int i = 0;i<forward;i++){
				waitpid(foreground[i],&status, 0);
			}
			wait(0);
		}
       //do whatever you want with the commands, here we just print them
		else{
			execute(tokens,0);
		}
		// for(i=0;tokens[i]!=NULL;i++){
		// 	printf("found token %s (remove this debug output later)\n", tokens[i]);
		// }

	}
	return 0;
}