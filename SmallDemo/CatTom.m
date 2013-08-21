//
//  CatTom.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "CatTom.h"

@implementation CatTom

-(id)init:(NSString *)_name
{
    self = [super init];
    if (self) {
        name = _name;  
    }
    return self;
}

-(void)Shout{
    NSLog(@"%@", [NSString stringWithFormat:@"我的名字叫%@",name]);
}

@end