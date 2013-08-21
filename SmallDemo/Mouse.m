//
//  Mouse.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Mouse.h"
@implementation Mouse
-(id)init:(NSString *)_name
{
    self = [super init];
    if (self) {
        name = _name;  
        delegate = self;
    }
    return self;
}

- (void)run
{
    NSLog(@"%@",[NSString stringWithFormat:@"老猫来了，%@ 快跑！",name]);
}

@end
