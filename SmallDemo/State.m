//
//  State.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "State.h"
#import "Work.h"
@implementation State
-(void)WriteProgram:(Work *)w{
    NSLog(@"当前时间:%f点下班回家了", [w hour]);
}
@end
