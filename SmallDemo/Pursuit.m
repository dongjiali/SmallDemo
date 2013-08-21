//
//  Pursuit.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Pursuit.h"

@implementation Pursuit
- (id)init:(SchoolGirl *)_mm
{
    self = [super init];
    if (self) {
        mm = _mm;
    }
    return self;
}
- (void)GiveDolls
{
    NSLog(@"%@送你洋娃娃",mm._name);
}

- (void)GiveFlowers
{
    NSLog(@"%@送你鲜花",mm._name);
}

- (void)GiveChocolate
{
    NSLog(@"%@送你巧克力",mm._name);
}

@end
