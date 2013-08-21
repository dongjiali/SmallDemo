//
//  ShellSort.m
//  SmallDemo
//
//  Created by Curry on 13-3-12.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "ShellSort.h"

@implementation ShellSort
- (void)Shellsort1:(NSMutableArray *)array
{
    int length = array.count;
     int i, j, gap;
    
    for (gap = length / 2; gap > 0; gap /= 2) //步长
        for (i = 0; i < gap; i++)        //直接插入排序
        {
            for (j = i + gap; j < length; j += gap)
                if ([array[j] intValue] < [array[j - gap] intValue])
                {
                    int temp = [array[j] intValue];
                    int k = j - gap;
                    while (k >= 0 && [array[k] intValue]> temp)
                    {
                        array[k + gap] = array[k];
                        k -= gap;
                    }
                    array[k + gap] = [NSNumber numberWithInt:temp];
                }
        }
    for(i = 0; i<length;i++){
        NSLog(@"Shellsort1 = %@",array[i]);
    }
}

- (void)Shellsort2:(NSMutableArray *)array
{
    int length = array.count;
    int j, gap;
    
    for (gap = length / 2; gap > 0; gap /= 2)
        for (j = gap; j < length; j++)//从数组第gap个元素开始
            if ([array[j] intValue]< [array[j - gap] intValue])//每个元素与自己组内的数据进行直接插入排序
            {
                int temp = [array[j] intValue];
                int k = j - gap;
                while (k >= 0 && [array[k] intValue]> temp)
                {
                    array[k + gap] = array[k];
                    k -= gap;
                }
                array[k + gap] = [NSNumber numberWithInt:temp];
            }
    for(int i = 0; i<length;i++){
        NSLog(@"Shellsort2 = %@",array[i]);
    }
}

- (void)Shellsort3:(NSMutableArray *)array
{
    int length = array.count;
    int i, j, gap,temp;
    
    for (gap = length / 2; gap > 0; gap /= 2)
        for (i = gap; i < length; i++)
            for (j = i - gap; j >= 0 && [array[j] intValue]> [array[j + gap] intValue]; j -= gap)
            {
                temp = [array[j] intValue];
                array[j] = array[j + 1];
                array[j + 1] = [NSNumber numberWithInt:temp];
            }
    for(i = 0; i<length;i++){
        NSLog(@"Shellsort3 = %@",array[i]);
    }
}
@end
