#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#define num 5
#define X 10
int counter = 0;
int shared_variable = 0;
int i = 0,j = 0;
void *reader(int *id); 
void *writer(int *id);

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t c_reader = PTHREAD_COND_INITIALIZER;
pthread_cond_t c_writer = PTHREAD_COND_INITIALIZER;

int main(int argc,char* argv[]) {
    pthread_t readers[num],writers[num];
    for(int i = 0; i < num; i++){
        if(pthread_create(&readers[i],NULL,reader,&i) != 0) {
            fprintf(stderr,"Unable to create reader[%d]\n",i);
            exit(1);
        }
        if(pthread_create(&writers[i],NULL,writer,&i) != 0) {
            fprintf(stderr,"Unable to create writer[%d]\n",i);
            exit(1);
        }
        pthread_join(readers[i],NULL);
        pthread_join(writers[i],NULL);
        }
        return 0;
}
void *reader(int* id) { 
    while(i<X){
        usleep(1000 * (random() % 5 + 7));
        pthread_mutex_lock(&m);
            while(counter == -1) 
                pthread_cond_wait(&c_reader,&m);
            counter++;
            i++;
        pthread_mutex_unlock(&m);

        printf("Reader%d: The shared variable value is %d\n",*id,shared_variable);
        printf("Reader%d: Number of readers present is %d\n",*id,counter);

        pthread_mutex_lock(&m);
            counter--;
            if(counter == 0)
               pthread_cond_signal(&c_writer); 
        pthread_mutex_unlock(&m);
    }
}
void *writer(int * id) {
    while(j < X) {
        usleep(1000 * (random() % 7 + 3));
            pthread_mutex_lock(&m);
            while(counter!= 0)
                pthread_cond_wait(&c_writer,&m);
            counter = -1;
            j++;
        pthread_mutex_unlock(&m);
    
        printf("Writer%d: The shared variable value is %d\n",*id,shared_variable++);
        printf("Writer%d: Number of readers present is %d\n",*id,counter + 1);

        pthread_mutex_lock(&m);
            counter = 0;
            pthread_cond_broadcast(&c_reader);
            pthread_cond_signal(&c_writer);
        pthread_mutex_unlock(&m);
    }
}

