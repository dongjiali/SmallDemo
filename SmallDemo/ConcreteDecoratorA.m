//
//  ConcreteDecoratorA.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ConcreteDecoratorA.h"

@implementation ConcreteDecoratorA
-(void)Operation
{
    [super Operation];
    addedState = @"New State";
    NSLog(@"具体装饰地象A操作");
}
@end
