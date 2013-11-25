//
//  MyNSTimer.m
//  SmallDemo
//
//  Created by Curry on 13-11-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "MyNSTimer.h"

@implementation MyNSTimer
@synthesize lasttime = lasttime;
@synthesize interval = interval;
- (void)invoke;
{
    if ([target respondsToSelector:action]) {
        [target performSelector:action withObject:nil];
    }
}
@end