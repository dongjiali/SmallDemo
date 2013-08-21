//
//  IosJSON.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-13.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "IosJSON.h"
#import <Foundation/NSJSONSerialization.h>
@implementation IosJSON
- (id)init
{
    if (self = [super init]) {
        NSString *urlpath = [[NSBundle mainBundle] pathForResource:@"jsondata" ofType:@"txt"];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8);//编码
        NSString *jsonData = [[NSString alloc] initWithContentsOfFile:urlpath encoding:enc error:nil];
        if (jsonData != nil) {
            NSLog(@"json data:%@",jsonData);
            //------ios
            NSData* data = [NSData dataWithContentsOfFile:urlpath];//2
            NSError* error;
            NSDictionary* json = [[NSDictionary alloc]init];
            json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"jsondata:%@",[[[json objectForKey:@"Data"] objectAtIndex:0] objectForKey:@"Data"] );
            NSLog(@"INS_NAME = %@",[[[[[json objectForKey:@"Data"] objectAtIndex:0] objectForKey:@"Data"] objectAtIndex:0] objectForKey:@"INS_NAME"]);
//            NSLog(@"jsondata:%@",json);
//            NSArray* jsonarr = [[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error] retain];
//            NSLog(@"%d",jsonarr.count);
//            NSLog(@"dept:%@",[jsonarr objectAtIndex:0]);
//            NSLog(@"dept:%@",[[jsonarr objectAtIndex:0] objectForKey:@"Flag"]);
        }
    }
    return self;
}
@end
