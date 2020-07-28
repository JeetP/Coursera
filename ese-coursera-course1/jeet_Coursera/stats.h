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
 * @file stats.h
 * @brief This files contains all header files for the main code
 *
 * Code file
 * @author Jeet Pavani
 * @date 18th April, 2020
 *
 */

#ifndef __STATS_H__
#define __STATS_H__

/* Add Your Declarations and Function Comments here */ 

/**
 * @brief A function that prints the statistics of an array 
 * including minimum, maximum, mean, and median.
 *
 * This functions take input of array pointer. This will take the
 * array to find mean using print_mean; median using print_median;
 * maximum usign print_maximum and minimum using print_minimum.
 *
 * @param arr The unsigned char array pointer that needs to be processed
 * @param n The unsigned integer size of array i.e. number of elements in the array
 * @return void Statistics needs to be printed
 */

void print_statistics(unsigned char* arr,unsigned int n);

/**
 * @brief Given an array of data and a length, prints the array to the screen
 *
 * This funtion takes input of array pointer and prints the array
 *
 * @param arr The unsigned char array pointer
 * @param n unsigned int length of the array
 * @return void Prints the array to screen
 */

void print_array(unsigned char* arr, unsigned int n);

/**
 * @brief Given an array of data and a length, returns the median value
 *
 * This functions takes input of array and prints its median values
 *
 * @param arr The unsigned char array pointer
 * @param n unsigned int lenght of the array
 * @return unsigned char Value of median of values in the array
 */

unsigned char find_median(unsigned char* arr, unsigned int n);

/**
 * @bried Given an array of data and a length, returns the mean
 *
 * This function takes input of array and prints in mean value
 *
 * @param arr The unsigned char array pointer
 * @param n unsigned int length of the array
 * @return unsigned char Value of mean value of input in the array
 */

unsigned char find_mean(unsigned char* arr, unsigned int n);

/**
 * @brief Given an array of data and a length, returns the maximum
 *
 * This function takes input of array and prints it's maximum value
 *
 * @param arr The unsigned char array pointer
 * @param n unsigned int length of the array
 * @return unsigned char Value of the Maximum value in the array
 */

unsigned char find_maximum(unsigned char* arr, unsigned int n);

/**
 * @brief Given an array of data and a length, returns the minimum
 * 
 * This function takes input of the array and prints it's minimum value
 *
 * @param arr The unsigned char array pointer
 * @param n Unsigned int lenth of the array
 * @return unsigned char Valye of the Minimum value in the array
 */

unsigned char find_minimum(unsigned char* arr, unsigned int n);

/**
 * @brief Given an array of data and a length, sorts the array from largest to smallest
 *
 * This function sorts the values in array.
 * Note: The zeroth Element should be the largest value,
 * and the last element (n-1) should be the smallest value
 *
 * @param arr The unsigned char array pointer
 * @param n Unsigned int length of the array
 * @return void returns the array sorted
 */

void sort_array(unsigned char* arr, unsigned int n);

#endif /* __STATS_H__ */
