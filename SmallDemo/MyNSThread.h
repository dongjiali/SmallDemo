//
//  MyNSThread.h
//  SmallDemo
//
//  Created by Curry on 13-11-6.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNSRunloop.h"

@interface MyNSThread : NSObject
{
    MyNSRunloop *runloop;
}
- (void)main:(id)sender;
@end

