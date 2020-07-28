/******************************************************************************
 * Copyright (C) 2017 by Alex Fosdick - University of Colorado
 *
 * Redistribution, modification or use of this software in source or binary
 * forms is permitted as long as the files maintain this copyright. Users are 
 * permitted to modify this and use it to learn about the field of embedded
 * software. Alex Fosdick and the University of Colorado are not liable for any
 * misuse of this material. 
 *
 *****************************************************************************/
/**
 * @file stats.c 
 * @brief Contains main function
 *
 * This is main code for processign the data
 *
 * @author Jeet Pavani
 * @date 18th April, 2020
 *
 */



#include <stdio.h>
#include "stats.h"

/* Size of the Data Set */
#define SIZE (40)

void main() {

  unsigned char test[SIZE] = { 34, 201, 190, 154,   8, 194,   2,   6,
                              114, 88,   45,  76, 123,  87,  25,  23,
                              200, 122, 150, 90,   92,  87, 177, 244,
                              201,   6,  12,  60,   8,   2,   5,  67,
                                7,  87, 250, 230,  99,   3, 100,  90};

  /* Other Variable Declarations Go Here */
  /* Statistics and Printing Functions Go Here */
  print_statistics(test,SIZE); 
}

/* Add other Implementation File Code Here */
void print_statistics(unsigned char* arr, unsigned int n){
    sort_array(arr,n);
    printf("1. Median value of the array is : %d \n", find_median(arr,n));
    printf("2. Mean value of the array is : %d \n", find_mean(arr,n));
    printf("3. Maximum value in the array is : %d \n", find_maximum(arr,n));
    printf("4. Minimum value in the array is : %d \n", find_minimum(arr,n));
    printf("5. The sorted array is \n");
    print_array(arr,n);
}
unsigned char find_median(unsigned char* arr,unsigned int n){
    if(n%2==1)
        return arr[n/2+1];
    else
        return (arr[n/2]+arr[n/2+1])/2;
}
unsigned char find_mean(unsigned char* arr,unsigned int n){
    unsigned int sum = 0;
    for(unsigned char i = 0;i<n;++i){
        sum = sum+arr[i];
    }
    return sum/n;
}
unsigned char find_maximum(unsigned char* arr, unsigned int n){
    return arr[n-1];
}
unsigned char find_minimum(unsigned char* arr, unsigned int n){
    return arr[0];
}
void sort_array(unsigned char* arr, unsigned int n){
    for(unsigned char j= 1;j<n;++j){
       for(unsigned char i = 0;i<n-j;++i){ 
           if(arr[i]<arr[i+1]){
               unsigned char temp = arr[i+1];
               arr[i+1]= arr[i];
               arr[i] = temp;
           }
        }
    }
}

void print_array(unsigned char* arr, unsigned int n){ 
    for(unsigned char i= 0;i<n;++i){
        printf("%d ",arr[i]);
    } 
}

