//
//  BubbleSort.m
//  SmallDemo
//
//  Created by Curry on 13-3-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

-  (void)BubbleSort1:(NSMutableArray *)array
{
    int length = array.count;
    int i , j ,temp;
    for (i = 0; i < length; i++) {
        for (j = i; j<length; j++) {
            if ([array[i] intValue] > [array[j] intValue]) {
                temp = [array [i]intValue];
                array[i] = array[j];
                array[j] = [NSNumber numberWithInt:temp];
            }
        }
    }
    for(i = 0; i<length;i++){
        NSLog(@"BubbleSort1 = %@",array[i]);
    }
}

-  (void)BubbleSort2:(NSMutableArray *)array
{
    int length = array.count;
    int i,temp,k;
    BOOL flag ;
    flag = YES;
    k = length;
    while (flag) {
        flag = NO;
        for (i = 1 ; i <k; i++) {
            if ([array[i-1] intValue] > [array[i] intValue]) {
                temp = [array [i-1]intValue];
                array[i-1] = array[i];
                array[i] = [NSNumber numberWithInt:temp];
                flag = YES;
            }
            length --;
        }
    }
    for(i = 0; i<length;i++){
        NSLog(@"BubbleSort2 = %@",array[i]);
    }
}

-  (void)BubbleSort3:(NSMutableArray *)array
{
     int length = array.count;
    int i, k,temp;
    int flag;
    flag = length;
    while (flag>0)
    {
        k = flag;
        flag = 0;
        for (i = 1; i < k; i++)
            if ([array[i-1] intValue] > [array[i] intValue]) {
                temp = [array [i-1]intValue];
                array[i-1] = array[i];
                array[i] = [NSNumber numberWithInt:temp];
                flag = i;
            }
    }
    for(i = 0; i<length;i++){
        NSLog(@"BubbleSort3 = %@",array[i]);
    }
}
@end
