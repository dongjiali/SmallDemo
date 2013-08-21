//
//  ConcreteObservers.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-8.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ConcreteObservers.h"

@implementation ConcreteObservers
@synthesize Subject;
-(ConcreteObservers*)MyInit:(ConcreteSubject*)s TheName:(NSString*)name{
    [self setSubject:s];
    names = name;
    return self;
}
-(void)Update{
    observerState= [Subject subjectState];
    NSLog(@"观察者%@的新状态是%@",names,observerState);
}
@end
