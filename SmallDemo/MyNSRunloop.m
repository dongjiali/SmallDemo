//
//  MyNSRunloop.m
//  SmallDemo
//
//  Created by Curry on 13-11-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "MyNSRunloop.h"

@implementation MyNSRunloop

- (void)addTimer:(MyNSTimer*)t;
{
    @synchronized(timerQueue){
        [timerQueue addObject:t];
    }
}
- (void)executeOnce;
{
    CFAbsoluteTime currentTime=CFAbsoluteTimeGetCurrent();
    @synchronized(timerQueue){
        for(MyNSTimer *t in timerQueue){
            if((currentTime-t.lasttime)>t.interval){
                t.lasttime=currentTime;
                [t invoke];
            }
        }
    }
}
@end

