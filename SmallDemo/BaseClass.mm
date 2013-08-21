//
//  BaseClass.m
//  SmallDemo
//
//  Created by Curry on 13-7-12.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "BaseClass.h"
#import "ClassAbase.h"

@implementation BaseClass

- (void)printfClassName
{
    NSLog(@"this is Base");
}

- (id)init
{
    if (self = [super init]) {
        Scientist *scient = new Scientist;
        //    scient->show_name();
        
        Scientist *physic = new Physicist;
        physic->show_name();
    }
    return self;
}

@end
