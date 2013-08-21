//
//  NoonState.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "NoonState.h"
#import "Work.h"
#import "AfternoonState.h"

@implementation NoonState
-(void)WriteProgram:(Work *)w{
    if([w hour] <13)
        NSLog(@"当前时间:%f点饿了,午饭;犯困,午休",[w hour]);
    else {
        [w setState:[[AfternoonState    alloc]init]];
        [w writeProgram];
    }
}
@end
