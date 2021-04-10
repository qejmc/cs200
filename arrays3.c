#include <stdio.h>

int max(int array2[], int size);
int min(int array2[], int size);
float average(int array2[], int size);
float median(int array2[], int size);
void sortArray(int array2[], int size);


int main()
{
    int numbers[] = {1, 4, 7, 3, 2, 9, 12, 5};

    int size = sizeof(numbers)/sizeof(int);

    for(int index = 0; index < size; index++)
    {
        printf("%d ", numbers[index]);
    }

    printf("\n");

    int maximum = max(numbers, size);
    int minimum = min(numbers, size);
    float avg = average(numbers, size);
    float med = median(numbers, size);

    printf("Max value is: %d\n", maximum);
    printf("Min value is: %d\n", minimum);
    printf("Average value is: %f\n", avg);
    printf("Median value is: %f\n", med);

    return 0;
}


// Function: max
// Input: array of integers, array size
// Description: find the max value in an array of integers
// Output: returns the max value from array
int max(int array2[], int size)
{
    int max = array2[0];
    int index;

    for(index = 1; index < size; index++)
    {
        if(array2[index] > max)
        {
            max = array2[index];
        }
    }

    return max;
}


// Function: min
// Input: array of integers, array size
// Description: find the min value in an array of integers
// Output: returns the min value from array
int min(int array2[], int size)
{
    int min = array2[0];
    int index;

    for(index = 1; index < size; index++)
    {
        if(array2[index] < min)
        {
            min = array2[index];
        }
    }

    return min;
}


// Function: average
// Input: array of integers, array size
// Description: find the average of an array of integers
// Output: returns the average
float average(int array2[], int size)
{
    float avg;
    int index;

    for(index = 0; index < size; index++)
    {
        avg += array2[index];
    }

    return avg/size;
}


// Function: median
// Input: array of integers, array size
// Description: find the median in an array of integers
// Output: returns the median
float median(int array2[], int size)
{
    sortArray(array2, size);

    int lower, upper;

    lower = array2[size/2 - 1];
    upper = array2[size/2];

    return (float) (upper + lower) / 2;
}


// Function: sortArray
// Input: array of integers, array size
// Description: sorts the array using bubble sort
// Output: none
void sortArray(int array2[], int size)
{
    int outIndex, inIndex, hold;

    for(outIndex = 0; outIndex < size - 1; outIndex++)
    {
        for(inIndex = 0; inIndex < size - outIndex - 1; inIndex++)
        {
            if(array2[inIndex] > array2[inIndex + 1])
            {
                hold = array2[inIndex];
                array2[inIndex] = array2[inIndex + 1];
                array2[inIndex + 1] = hold;
            }
        }
    }
}