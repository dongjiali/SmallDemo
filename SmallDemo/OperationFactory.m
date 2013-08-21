//
//  OperationFactory.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "OperationFactory.h"
#import "OperationAdd.h"
#import "OperationSub.h"

@implementation OperationFactory
- (Operation *)creatOperate:(NSString *)operate
{
    Operation *oper = nil;
    switch ([operate intValue]) {
        case ADD:
            oper = [[OperationAdd alloc]init];
            break;
        case SUB:
            oper = [[OperationSub alloc]init];
            break;  
        default:
            break;
    }
    return oper;
}
@end
