#include <stdio.h>
#include <pthread.h>
#define NUM_THREADS 4
void *hello(int i) {
    printf("Hello Thread %d\n",i);
    return 0;
}
void *threadFunc(void *pArg) {
    int *p = (int*) pArg;
    int myNum = *p;
    printf("Hello Thread %d\n",myNum);
    return 0;
}

int main(void){
    int i;
    pthread_t tid[NUM_THREADS];
    for(int i = 0;i<NUM_THREADS;i++){
        pthread_create(&tid[i],NULL,threadFunc,&i);
    }
    for(int i = 0; i < NUM_THREADS; i++){
        pthread_join(tid[i],NULL);
    }
    pthread_mutex_t aMutex;
    int pthread_mutex_init(pthread_mutex_t *mutex,const pthread_mutexattr_t *attr);
    int pthread_mutex_trylock(pthread_mutex_t *mutex);
    int pthread_mutex_lock(pthread_mutex_t *mutex);
    int pthread_mutex_unlock(pthread_mutex_t *mutex);
    pthread_cond_t aCond;
    int pthread_cond_wait(pthread_cond_t * cond,pthread_mutex_t *mutex);
    return 0;
}
