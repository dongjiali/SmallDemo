//
//  AllArithment.m
//  SmallDemo
//
//  Created by Curry on 13-3-1.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "AllArithmentic.h"

@implementation AllArithmentic


- (void)AllRange:(NSMutableArray *)pszStr intK:(int)k intM:(int)m
{
    if (k == m)
    {
        static int s_i = 1;
        NSLog(@"  第%3d个排列\t%@\n", s_i++, pszStr);
    }
    else
    {
        for (int i = k; i <= m; i++) //第i个数分别与它后面的数字交换就能得到新的排列
        {
            if ([self IsSwap:pszStr intK:k intM:i])
            {
                
                [self Swap:pszStr intk:k intI:i];
                [self AllRange:pszStr intK:k +1 intM:m];
                [self Swap:pszStr intk:k intI:i];
            }
        }
    }
}

- (void)Swap:(NSMutableArray *)array intk:(int)k intI:(int)i
{
    NSString *t = array[k];
    array[k] = array[i];
    array[i] = t;
}

//在pszStr数组中，[nBegin,nEnd)中是否有数字与下标为nEnd的数字相等
- (BOOL)IsSwap:(NSMutableArray *)pszStr intK:(int)nBegin intM:(int)nEnd
{
    for (int i = nBegin; i < nEnd; i++)
        if ([pszStr[i] isEqual:pszStr[nEnd]])
            return NO;
    return YES;
}
@end
