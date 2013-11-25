//
//  Data_Array_char.h
//  SmallDemo
//
//  Created by Curry on 13-11-11.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data_Array_char : NSObject
{
    const char *chars;
    NSData *data;
    NSString *string;
}

- (void)dataTostring;

- (void)stringTodata;

- (void)dataTochar;

- (void)charTodata;

- (void)stringTochar;

@end
