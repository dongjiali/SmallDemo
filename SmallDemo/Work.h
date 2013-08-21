//
//  Work.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class State;
@interface Work : NSObject
{
    State *current;
    double _hour;
    BOOL _taskFinished;
}
@property(assign)double hour;
@property(assign)BOOL taskFinished;
- (void)setState:(State *)s;
- (void)writeProgram;
@end
