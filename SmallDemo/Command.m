//
//  Command.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-23.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Command.h"

@implementation Command
- (id)init:(Barbecuer *)receiver_{
    self = [super init];
    if (self) {
        receiver = receiver_;
    }
    return  self;
}
@end
