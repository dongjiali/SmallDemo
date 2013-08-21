//
//  Book.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-2.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Author;
@interface Book : NSObject
{
    NSString *name;
    Author *author;
    float price; 
    NSArray *relativeBooks; 
    Class classname;
}
-(void) print:(NSString*) msg;
@end
