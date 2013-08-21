//
//  UndergraduteFactory.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-16.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "UndergraduteFactory.h"
#import "Undergrauate.h"
@implementation UndergraduteFactory
-(LeiFeng* )CreateLeifeng{
    return [[Undergrauate alloc]init];
}
@end
