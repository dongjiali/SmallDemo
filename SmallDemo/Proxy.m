//
//  Proxy.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-13.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Proxy.h"

@implementation Proxy
- (void)requset
{
    if (realsubject == nil) {
        realsubject = [[RealSubject alloc]init];
    }
    [realsubject requset];
    return;
}
@end
