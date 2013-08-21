//
//  Porxy.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Porxy.h"

@implementation Porxy
- (id)init:(SchoolGirl *)_mm
{
    self = [super init];
    if (self) {
        mm = _mm;
        gg = [[Pursuit alloc]init:mm];
    }
    return self;
}



- (void)GiveDolls
{   
    [gg GiveDolls];
}

- (void)GiveFlowers
{
    [gg GiveFlowers];
}

- (void)GiveChocolate
{
    [gg GiveChocolate];
}
@end
