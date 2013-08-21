//
//  Subjects.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-8.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Observers;
@interface Subjects : NSObject
{
    NSMutableArray *observers;
}
-(Subjects*)MyInit;
-(void)Attach:(Observers*)observer;
-(void)Detach:(Observers*)observer;
-(void)Notify;
@end
