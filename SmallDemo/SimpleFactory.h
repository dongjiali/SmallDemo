//
//  SimpleFactory.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-16.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeiFeng.h"
@interface SimpleFactory : NSObject
+ (LeiFeng *)CreateLeiFeng:(NSInteger)type;
@end
