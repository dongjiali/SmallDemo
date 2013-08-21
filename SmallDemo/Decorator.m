//
//  Decorator.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Decorator.h"

@implementation Decorator
-(void)SetCompoent:(Compoent *)_compoent
{
    compoent = _compoent;
}
-(void)Operation
{
    if (compoent != nil) {
        [compoent  Operation];
    }
}
@end
