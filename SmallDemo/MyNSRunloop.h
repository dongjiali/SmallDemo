//
//  MyNSRunloop.h
//  SmallDemo
//
//  Created by Curry on 13-11-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNSTimer.h"

@interface MyNSRunloop : NSObject
{
    NSMutableArray *timerQueue;
}
- (void)addTimer:(MyNSTimer*)t;
- (void)executeOnce;
@end

