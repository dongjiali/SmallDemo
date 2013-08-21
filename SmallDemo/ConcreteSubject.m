//
//  ConcreteSubject.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-8.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ConcreteSubject.h"

@implementation ConcreteSubject
@synthesize subjectState;
-(ConcreteSubject*)MyInit{
    observers= [[NSMutableArray alloc]init];
    return self;
}
@end
