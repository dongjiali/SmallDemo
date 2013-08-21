//
//  SleepingState.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "SleepingState.h"
#import "Work.h"
@implementation SleepingState
-(void)WriteProgram:(Work *)w{
    NSLog(@"当前时间:%f点不行了,睡着了", [w hour]);
}
@end
