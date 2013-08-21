//
//  ClassA.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-28.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassA : NSObject
{
    @protected int count;
}
@end

@interface ClassA
(protected)-(void)requsetString;
@end