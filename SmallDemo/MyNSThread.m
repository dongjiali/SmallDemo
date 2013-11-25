//
//  MyNSThread.m
//  SmallDemo
//
//  Created by Curry on 13-11-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "MyNSThread.h"

@implementation MyNSThread
- (void)main:(id)sender
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    while (TRUE) {
        //do some jobs
        //break in some condition
        [runloop executeOnce];
        usleep(10000);
        [pool drain];
    }
    [pool release];
}
@end