//
//  Work.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Work.h"
#import "State.h"
#import "ForenoonState.h"
@implementation Work
@synthesize hour = _hour;
@synthesize taskFinished = _taskFinished;
- (id)init
{
    self = [super init];
    if (self) {
        current = [[ForenoonState alloc]init];
    }
    return self;
}

- (void)setState:(State *)s
{
    current = s;
}

- (void)writeProgram
{
    [current WriteProgram:self];
}
@end
