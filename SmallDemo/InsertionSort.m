//
//  InsertionSort.m
//  SmallDemo
//
//  Created by Curry on 13-3-11.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort
-  (void)Insertsort1:(NSMutableArray *)array
{
    int length = array.count;
    int i,j,k;
    for (i = 0; i<length; i++) {
        //为a[i]在前面的a[0...i-1]有序区间中找一个合适的位置
        for (j = i - 1; j >= 0; j--)
            if ([array[j] intValue]< [array[i] intValue])
                break;
        //如找到了一个合适的位置
        if (j != i - 1)
        {
            //将比a[i]大的数据向后移
            int temp = [array[i] intValue];
            for (k = i - 1; k > j; k--)
                array[k + 1] = array[k];
            //将a[i]放到正确位置上
            array[k + 1] = [NSNumber numberWithInt:temp];
        }
    }
    for(i = 0; i<length;i++){
        NSLog(@"Insertsort1 = %@",array[i]);
    }
}

-  (void)Insertsort2:(NSMutableArray *)array
{
    int length = array.count;
    int i, j;
    for (i = 1; i < length; i++)
        if ([array[i] intValue] < [array[i - 1] intValue])
        {
            int temp = [array[i] intValue];
            for (j = i - 1; j >= 0 && [array[j] intValue] > temp; j--)
                array[j + 1] = array[j];
            array[j + 1] = [NSNumber numberWithInt:temp];
        }
    for(i = 0; i<length;i++){
        NSLog(@"Insertsort2 = %@",array[i]);
    }
}

-  (void)Insertsort3:(NSMutableArray *)array
{
    int length = array.count;
    int i, j,temp;
    for (i = 1; i < length; i++)
        for (j = i - 1; j >= 0 && [array[j] intValue]> [array[j + 1] intValue]; j--)
        {
            temp = [array[j] intValue];
            array[j] = array[j + 1];
            array[j + 1] = [NSNumber numberWithInt:temp];
        }
    for(i = 0; i<length;i++){
        NSLog(@"Insertsort3 = %@",array[i]);
    }
}
@end
