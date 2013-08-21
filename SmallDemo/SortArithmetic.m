//
//  SortArithmetic.m
//  SmallDemo
//
//  Created by Curry on 13-2-26.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "SortArithmetic.h"
#import "BubbleSort.h"
#import "InsertionSort.h"
#import "ShellSort.h"
NSMutableArray *numArray;

//const SortFucntionInfo strMap[] = {
//    {@"123",insert_sort},
//    {@"123",insert_sort},
//    {@"123",insert_sort}
//};

@implementation SortArithmetic

- (id)init
{
    if (self = [super init]) {
        
        //冒泡法排序三种方法
        BubbleSort *bubble = [[BubbleSort alloc]init];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
   @"30",@"22",@"97",@"34",@"7",nil];
        [bubble BubbleSort1:numArray];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [bubble BubbleSort2:numArray];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [bubble BubbleSort3:numArray];
        [bubble release];
        //直接插入法排序三种方法
        InsertionSort *insertionsort = [[InsertionSort alloc]init];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [insertionsort Insertsort1:numArray];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [insertionsort Insertsort2:numArray];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [insertionsort Insertsort3:numArray];
        //希尔排序法
        ShellSort *shellsort = [[ShellSort alloc]init];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [shellsort Shellsort1:numArray];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [shellsort Shellsort2:numArray];
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [shellsort Shellsort3:numArray];
        
//        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
//        @"30",@"22",@"97",@"34",@"7",nil];
//    [self insert_sort:numArray block:^(NSMutableArray *array) {
//        for (int i = 0; i < array.count; i++) {
//            NSLog(@"new = %@",[array objectAtIndex:i]);
//        }
//    }];
        
//        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
//                    @"30",@"22",@"97",@"34",@"7",nil];
//    [self shell_sort:numArray block:^(NSMutableArray *array) {
//        for (int i = 0; i < array.count; i++) {
//            NSLog(@"new = %@",[array objectAtIndex:i]);
//        }
//    }];
        
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
//        //[dateFormatter setDateFormat:@"hh:mm:ss"]
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];      //毫秒
//        NSLog(@"Dateold%@", [dateFormatter stringFromDate:[NSDate date]]);
//        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
//                    @"30",@"22",@"97",@"34",@"7",nil];
//
//    [self bubble_sort:numArray block:^(NSMutableArray *array) {
//        for (int i = 0; i < array.count; i++) {
//            NSLog(@"new = %@",[array objectAtIndex:i]);
//        }
//        NSLog(@"Datenew%@", [dateFormatter stringFromDate:[NSDate date]]);
//    }];
        
        
//    [self quick_partition:numArray block:^(NSMutableArray *array) {
//        for (int i = 0; i < array.count; i++) {
//            NSLog(@"new = %@",[array objectAtIndex:i]);
//        }
//        NSLog(@"Datenew%@", [dateFormatter stringFromDate:[NSDate date]]);
//    }];
        
        numArray = [[NSMutableArray alloc]initWithObjects:@"10",@"12",@"32",@"2",
                    @"30",@"22",@"97",@"34",@"7",nil];
        [self select_sort:numArray block:^(NSMutableArray *array) {
            for (int i = 0; i < array.count; i++) {
                NSLog(@"new = %@",[array objectAtIndex:i]);
            }
        }];

    }
    return self;
}

- (void)insert_sort:(NSMutableArray *)array block:(Sort_Function)fun
{
    int length = [array count];
    assert(array && length >= 0);
    if (length <= 1) {
        return;
    }
    int i, j, temp;
    for (i = 1; i < length; ++i) {
        //        temp = [[array objectAtIndex:i] intValue];
        temp = [array[i] intValue];
        j = i - 1;
        
        while (j >= 0 && temp < [array[j] intValue]) {
            //            [array replaceObjectAtIndex:j+1 withObject:[array objectAtIndex:j]];
            array[j+1]=array[j];
            --j;
        }
        
        //        [array replaceObjectAtIndex:j+1 withObject:[NSNumber numberWithInt:temp]];
        array[j+1] = [NSNumber numberWithInt:temp];
    }
    fun(array);
}


- (void)shell_sort:(NSMutableArray *)array block:(Sort_Function)fun
{
    int length = array.count;
    assert(array && length>=0);
    {
        if (length<=1) {
            return;
        }
    }
    
    int i, j, temp;
    int increment = length;
    do {
        increment = increment / 3 +1;
        
        for (i = increment; i < length; i++) {
            temp = [array[i] intValue];
            j = i - increment;
            
            while (j>=0 && temp < [array[j] intValue]) {
                array[j + increment] = array[j];
                j -= increment;
            }
            array[j + increment] = [NSNumber numberWithInt:temp];
        }
        
    } while (increment >1);
    fun(array);
}

- (void)bubble_sort:(NSMutableArray *)array block:(Sort_Function)fun
{
    int length = array.count;
    assert(array && length >= 0);
    {
        if (length <=1) {
            return;
        }
    }
    int i ,j ,temp;
    bool exchange;
    for (i = 0; i<length; i++) {
        exchange = NO;
        for (j = i + 1; j< length ;j ++) {
            if ([array[i] intValue] > [array[j] intValue]) {
                temp = [array[i] intValue];
                array[i] = array[j];
                array[j] = [NSNumber numberWithInt:temp];
                exchange = YES;
            }
        }
        if (!exchange) {
            break;
        }
    }
    fun(array);
}



//- (void)quick_partition:(NSMutableArray *)array block:(Sort_Function)fun
//{
//    
//    int length = array.count;
//    assert(array && length >= 0);
//    {
//        if (length <=1) {
//            return;
//        }
//    }
//    [self quick_sort_impl:array intlow:0 inthigh:length-1 block:fun];
//}
//
//- (void)quick_sort_impl:(NSMutableArray *)array intlow:(int)low inthigh:(int)high
//block:(Sort_Function)fun
//{
//    if (low < high) {
//        int pivotPos = [self quick_partition:array intlow:low inthigh:high block:fun];
//        [self quick_sort_impl:array intlow:low inthigh:pivotPos - 1 block:fun];
//        [self quick_sort_impl:array intlow:low inthigh:pivotPos +1 block:fun];
//    }
//}
//
//-(int)quick_partition:(NSMutableArray *)array intlow:(int)low inthigh:(int)high
//block:(Sort_Function)fun
//{    
//    int pivot = [array[low] intValue]; // 用区间的第 1 个记录作为基准
//    
//    while (low < high) {
//        while (low < high && [array[high] intValue] >= pivot) {
//            --high;
//        }
//        if (low < high) {
//            array[low++] = array[high];
//        }
//        while (low < high && [array[low] intValue] <= pivot) {
//            ++low;
//        }
//        if (low < high) {
//            array[high--] = array[low];
//        }
//    }
//    array[low] = [NSNumber numberWithInt:pivot];
//    return low;
//}

- (void)select_sort:(NSMutableArray *)array block:(Sort_Function)fun
{
    int length = array.count;
    assert(array && length >= 0);
    {
        if (length <=1) {
            return;
        }
    }
    int i , j , k , temp;
    for (i = 0; i< length -1 ; i++) {
        k = i;
        for (j = i +1 ; j < length; j++) {
            if ([array[j] intValue] < [array[k] intValue]) {
                k = j;
            }
        }
        if (k != i) {
            temp = [array[i] intValue];
            array[i] = array[k];
            array[k] = [NSNumber numberWithInt:temp];
        }
    }
    fun(array);
}

@end
