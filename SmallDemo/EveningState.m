//
//  EveningState.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "EveningState.h"
#import "Work.h"
#import "RestState.h"
#import "SleepingState.h"

@implementation EveningState
-(void)WriteProgram:(Work *)w{
    if ([w taskFinished]) {
        [w setState:[[RestState alloc]init]];
        [w writeProgram];
    }
    else {
        if([w hour] <21)
            NSLog(@"当前时间:%f点加班哦,疲惫之极", [w hour]);
        else {
            [w setState:[[SleepingState alloc]init]];
            [w writeProgram];
        }
    }
}
@end
