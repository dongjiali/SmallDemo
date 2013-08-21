//
//  Animal.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Animal.h"

@implementation Animal
@synthesize shoutNum_ = shoutNum;
-(id)init:(NSString *)_name
{
    self = [super init];
    if (self) {
        name = _name;  
        shoutNum = 3;
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        name = @"无名";  
    }
    return self;
}

-(NSString *)Shout{
    NSString *result = @"";
    for (int i =0; i<shoutNum; i++) {
        result = [NSString stringWithFormat:@"%@,%@",[self getShoutSound],result];
    }
    return [NSString stringWithFormat:@"我的名字叫%@%@",name,result];
}

- (NSString *)getShoutSound
{
    return @"";
}

@end
