//
//  SortArithmetic.h
//  SmallDemo
//
//  Created by Curry on 13-2-26.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Sort_Function)(NSMutableArray *array);
typedef struct _SortFucntionInfo
{
    NSString *name;
    Sort_Function sort;
}SortFucntionInfo;

@interface SortArithmetic : NSObject
{
    Sort_Function function;
}
//直接排序
- (void)insert_sort:(NSMutableArray *)array block:(Sort_Function)fun;
//希尔排序
- (void)shell_sort:(NSMutableArray *)array block:(Sort_Function)fun;
//冒泡排序
- (void)bubble_sort:(NSMutableArray *)array block:(Sort_Function)fun;
//快速排序
//- (void)quick_partition:(NSMutableArray *)array block:(Sort_Function)fun;
// 直接选择排序
- (void)select_sort:(NSMutableArray *)array block:(Sort_Function)fun;
@end
