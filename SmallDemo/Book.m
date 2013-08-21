//
//  Book.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-2.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Book.h"

@implementation Book
-(void) print:(NSString*) msg
{
	NSLog(@"%@",msg);
    classname = NSClassFromString(@"Book");
    NSLog(@"%@",classname);
    NSString *str = NSStringFromClass(classname);
    NSLog(@"%@",str);
}

@end
