//
//  Facade.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-13.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Facade.h"
#import "SubSystemOne.h"
#import "SubSystemTwo.h"
#import "SubSystemThree.h"
#import "SubSystemFour.h"
@implementation Facade
- (Facade *)MyInit
{
     one = [[SubSystemOne alloc]init];
     two = [[SubSystemTwo alloc]init];
     three = [[SubSystemThree alloc]init];
     four = [[SubSystemFour alloc]init];
    return self;
}

- (void)MethodA{
    NSLog(@"\n方法组A()---- ");

    [one MethodOne];
    [two MethodTwo];
    [three MethodThree];
    [four MethodFour];
}

- (void)MethodB{
    NSLog(@"\n方法组B()---- ");
    [two MethodTwo];
    [three MethodThree];
}

@end
