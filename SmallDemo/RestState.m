//
//  RestState.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "RestState.h"
#import "Work.h"
@implementation RestState
-(void)WriteProgram:(Work *)w{
    NSLog(@"当前时间:%f点下班回家了", [w hour]);
}
@end
