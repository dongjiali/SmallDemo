//
//  MyObject.m
//  SmallDemo
//
//  Created by Curry on 13-1-22.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject

static MyObject *myObject_;

+ (MyObject *)getMyObjectClass
{
    NSLog(@"%@",myObject_.superclass);
    NSLog(@"%@",myObject_.self);
    NSLog(@"%@",myObject_.self);
    return myObject_;
}
@end
