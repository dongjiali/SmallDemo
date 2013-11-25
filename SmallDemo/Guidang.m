//
//  Guidang.m
//  SmallDemo
//
//  Created by Curry on 13-11-1.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "Guidang.h"

@implementation Guidang
- (id)init
{
    if (self = [super init]) {
        NSString *homeDirectory = NSHomeDirectory(); //获取根目录
        
        NSString *homePath = [homeDirectory stringByAppendingPathComponent:@"test.archiver"];
        
        NSMutableData *data = [[NSMutableData alloc] init];
        
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        
        [archiver encodeFloat:50 forKey:@"age"];
        
        [archiver encodeObject:@"jack" forKey:@"name"];
        
        [archiver finishEncoding];  //结束添加对象到data中
        
        [archiver release];
        
        [data writeToFile:homePath  atomically:YES];//将data写到文件中保存在磁盘上
        
        
        
        NSData *content= [NSData dataWithContentsOfFile:homePath];
        
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:content];
        
        float age = [unarchiver decodeFloatForKey:@"age"];
        
        NSString *name = [unarchiver decodeObjectForKey:@"name"];
        
        
        NSLog(@"%f,%@",age,name);
    }
    return self;
}

@end
