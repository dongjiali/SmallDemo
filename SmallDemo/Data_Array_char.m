//
//  Data_Array_char.m
//  SmallDemo
//
//  Created by Curry on 13-11-11.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "Data_Array_char.h"
@implementation Data_Array_char

- (id)init
{
    if (self = [super init]) {
        chars = "abcdefg";
        string = @"hijklmn";
    }
    return self;
}

- (void)dataTostring
{
    string = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
     NSLog(@"data -> string = %@",data);
}

- (void)stringTodata
{
    data = [string dataUsingEncoding: NSASCIIStringEncoding];
    NSLog(@"string -> data = %@",data);
}

- (void)dataTochar
{

    const char *bu =[data bytes];
    NSLog(@"data -> char = %s",bu);
}

- (void)charTodata
{
    data = [NSData dataWithBytes:chars length:strlen(chars)];
    NSLog(@"char -> data = %@",data);
}

- (void)stringTochar
{
    const char *fnameStr;
    fnameStr =[string UTF8String];
    NSLog(@"string -> char = %s",fnameStr);
}
@end
