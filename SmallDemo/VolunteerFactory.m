//
//  VolunteerFactory.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-16.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "VolunteerFactory.h"
#import "Volunteer.h"
@implementation VolunteerFactory
- (LeiFeng *)CreateLeifeng
{
    return [[Volunteer alloc]init];
}
@end
