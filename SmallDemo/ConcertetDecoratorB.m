//
//  ConcertetDecoratorB.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ConcertetDecoratorB.h"

@implementation ConcertetDecoratorB
-(void)Operation
{
    [super Operation];
    NSLog(@"具体装饰地象A操作");
}

-(void)AddedBehavior
{
    
}
@end
