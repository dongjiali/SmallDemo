//
//  FindTwoNotRepeatNumberInArray.m
//  SmallDemo
//
//  Created by Curry on 13-3-5.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "FindTwoNotRepeatNumberInArray.h"

@implementation FindTwoNotRepeatNumberInArray

- (id)init
{
    if (self = [super init]) {
        NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:
        @"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4",@"6",@"5", nil];
        pN1 = 0;
        pN2 = 0;
        pN3 = 0;
        NSLog(@"数组数据为%@",array);
        [self FindTwoNotRepeatNumberInArray:array Pn1:&pN1 Pn2:&pN2];
        NSLog(@"出现过1次的数为:%d,%d",pN1,pN2);
        
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithObjects:
                                 @"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4",@"8", nil];
        NSLog(@"数组数据为%@",array1);
        [self findOneRepeaNumber:array1 Pn1:&pN3];
        NSLog(@"出现过1次的数为:%d",pN3);
    }
    return self;
}

- (void)findOneRepeaNumber:(NSMutableArray *)array Pn1:(NSInteger *)pn1
{
    int length = array.count;
    for (int i =0 ; i< length; i++) {
        *pn1 ^= [array[i] intValue];
    }
}

- (void)FindTwoNotRepeatNumberInArray:(NSMutableArray *)array Pn1:(NSInteger *)pn1
                                  Pn2:(NSInteger *)pn2;
{
    int length = array.count;
    int i , j, temp;
    //计算这两个数的异或结果
    temp = 0;
    for (i = 0; i< length; i++) {
        temp ^= [array[i] intValue];
    }
    // 找第一个为1的位
    for (j = 0; j < sizeof(int) * 8; j++) {
        if (((temp >> j) & 1) == 1) {
            break;
        }
    }
    
    // 第j位为1,说明这两个数字在第j位上是不相同的
    // 由此分组即可
    for (i = 0; i < length  ; i++)
        if((([array[i] intValue] >> j) & 1) == 0)
        {
            *pn1 ^= [array[i] intValue];
        }
        else{
            *pn2 ^= [array[i] intValue];
        }
}

@end
