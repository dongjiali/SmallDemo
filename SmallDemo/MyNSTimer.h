//
//  MyNSTimer.h
//  SmallDemo
//
//  Created by Curry on 13-11-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNSTimer : NSObject
{
    id target;
    SEL action;
    float interval;
    CFAbsoluteTime lasttime;
}
@property(nonatomic)CFAbsoluteTime lasttime;
@property(nonatomic)float interval;
- (void)invoke;
@end

