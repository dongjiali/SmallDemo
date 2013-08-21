//
//  AfternoonState.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "AfternoonState.h"
#import "Work.h"
#import "EveningState.h"
@implementation AfternoonState
-(void)WriteProgram:(Work *)w{
    if ([w hour] <17) {
        NSLog(@"当前时间:%f点下午状态还不错,继续努力", [w hour]);
    }
    else {
        [w setState:[[EveningState alloc]init]];
        [w writeProgram];
    }
}
@end
