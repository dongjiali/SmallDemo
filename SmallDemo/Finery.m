//
//  Finery.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Finery.h"

@implementation Finery

- (void)Decorator:(Person *)_compoent
{
     compoent = _compoent;
}

- (void)Show
{
    if (compoent != nil) {
        [compoent Show];
    }
}
@end
