//
//  Author.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-2.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//
#define SECONDS_PER_YEAR (60 * 60 * 24 * 365)UL
#define MIN_NUM(A,B) （（A） <= (B) ? (A) : (B)) 
#import <Foundation/Foundation.h>
@class Book;
@interface Author : NSObject
{
    NSString *name;
    const int a;
    int const b;  
    const int *c;  
    int * const d;  
}
 + (void)staticMethod; 

- (void)instanceMethod;

@end

@interface Author
(private) - (void)thisIsAPrivateMethod; 
@end

