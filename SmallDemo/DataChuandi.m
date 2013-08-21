//
//  DataChuandi.m
//  SmallDemo
//
//  Created by Curry on 13-6-7.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "DataChuandi.h"

@implementation DataChuandi

- (void)setName:(NSString *)n
{
    name = n;
    NSLog(@"%p,%p",name,n);
}

- (void)changeName
{
    name = @"im new string";
    NSLog(@"%p",name);
}

@end
