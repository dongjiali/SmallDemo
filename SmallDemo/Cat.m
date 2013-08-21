//
//  Cat.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Cat.h"

@implementation Cat
-(id)init:(NSString *)_name
{
    self = [super init:_name];
    return self;
}

-(id)init
{
    self = [super init];
    return self;
}

- (NSString *)getShoutSound
{
    return  @"喵";
}

@end
