//
//  Person.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)init:(NSString *)_name
{
    self  = [super init];
    if (self) {
            name = _name;
    }
    return self;
}

- (void)Show
{
    NSLog(@"装扮的%@",name);
}
@end
