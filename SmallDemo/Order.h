//
//  Order.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLL.h"
@interface BLL(Order)
-(void) createOrder:(NSString*) productNo quantity:(int) amount;
@end
