//
//  SimpleFactory.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-16.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "SimpleFactory.h"
#import "Undergrauate.h"
#import "Volunteer.h"
@implementation SimpleFactory
+(LeiFeng *)CreateLeiFeng:(NSInteger)type
{
    LeiFeng *result = nil;
    switch (type) {
        case 1:
            result = [[Undergrauate alloc]init];
            break;
        case 2:
            result = [[Volunteer alloc]init];
            break;   
        default:
            break;
    }
    return result;
}
@end
