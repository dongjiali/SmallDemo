//
//  MyDog.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "MyDog.h"

@implementation MyDog
- (void)SomthingHappen
{
    [delegate Bark];
}
-(void)SetHost:(id)host
{
    delegate = host;
}
@end
