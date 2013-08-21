//
//  File.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-6.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "File.h"

@implementation File
- (id)init
{
    if (self = [super init]) {
        //获得document文件夹
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//        NSString *filename = [documentsDirectory stringByAppendingPathComponent:@"text.txt"];
//        NSData *string = nil;
//        [string writeToFile:filename atomically:YES];
//        //获得tmp临时文件夹
//        NSString *tmppaths = NSTemporaryDirectory();
//        NSString *tmpfile = [tmppaths stringByAppendingPathComponent:@"text2.txt"];
        
        NSMutableArray  *mutablearry = [[NSMutableArray alloc]init];
        [mutablearry addObject:@"a"];
        [mutablearry addObject:@"b"];
        [mutablearry addObject:@"c"];
        [mutablearry addObject:@"d"];
        [mutablearry writeToFile:[self dataFilePath] atomically:YES];
        
        NSString *filePate = [self dataFilePath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePate]) {
            NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePate];
            for (NSString *string  in array) {
                NSLog(@"%@",string);
            }
        }
    }
    return self;
}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentDirectory = [paths objectAtIndex:0];
    return  [doucumentDirectory stringByAppendingPathComponent:@"data.plist"];
}

@end
