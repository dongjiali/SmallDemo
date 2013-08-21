//
//  Operation.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ADD 1
#define SUB 2

@interface Operation : NSObject
{
    double numberA;
    double numberB;
    
}
@property(nonatomic,assign)double _numberA;
@property(nonatomic,assign)double _numberB;
- (double)GetResult;
@end
