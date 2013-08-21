//
//  ForenoonState.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ForenoonState.h"
#import "Work.h"
#import "NoonState.h"
@implementation ForenoonState
-(void)WriteProgram:(Work *)w{
    if ([w hour] < 12) {
        NSLog(@"当前时间:%f点上午工作,精神百倍", [w hour]);
    }
    else {
        [w setState:[NoonState new]];
        [w writeProgram];
    }
}
@end
