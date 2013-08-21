//
//  viewLoadOperation.m
//  SmallDemo
//
//  Created by Curry on 13-5-31.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "viewLoadOperation.h"
#import "MyTask.h"
@implementation viewLoadOperation
-(id)init
{
    if (self = [super init]) {
        NSOperationQueue *queue=[[NSOperationQueue alloc] init];
        MyTask *myTask=[[[MyTask alloc] init] autorelease];
        [queue addOperation:myTask];
        MyTask *myTask1=[[[MyTask alloc] init] autorelease];
        [queue addOperation:myTask1];
        MyTask *myTask2=[[[MyTask alloc] init] autorelease];
        [queue addOperation:myTask2];
        [queue release];
    }
return self;
}
@end
