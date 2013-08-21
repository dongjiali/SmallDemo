//
//  MyTask.m
//  SmallDemo
//
//  Created by Curry on 13-5-31.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "MyTask.h"

@implementation MyTask
/* 不会执行NSTimer
-(void)main
{
    NSLog(@"开始线程=%@",self);
    [NSTimer timerWithTimeInterval:2 target:self selector:@selector(hiandeTime:) userInfo:nil repeats:NO];
}
 */


/* 不会执行NSTimer
-(void)main
{
    NSLog(@"开始线程=%@",self);
    NSTimer *timer=[NSTimer timerWithTimeInterval:2 target:self selector:@selector(hiandeTime:) userInfo:nil repeats:NO];
    [timer fire];
    while (1) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}

*/


-(void)main
{
NSLog(@"start new thread …");
[NSThread detachNewThreadSelector:@selector(runOnNewThread) toTarget:self withObject:nil];
while (!end) {
    NSLog(@"runloop…");
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    NSLog(@"runloop end.");
}
NSLog(@"ok.");
}


- (void)runOnNewThread
{
    NSLog(@"run for new thread …");
    sleep(1);
     [self performSelectorOnMainThread:@selector(setEnd) withObject:nil waitUntilDone:NO];
    NSLog(@"end.");
}

-(void)setEnd{
    end=YES;
}

-(void)hiandeTime:(id)sender
{
    NSLog(@"执行了NSTimer");
}
-(void)dealloc
{
    NSLog(@"delloc mytask=%@",self);
    [super dealloc];
}
@end
