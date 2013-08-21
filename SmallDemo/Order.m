//
//  Order.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Order.h"

@implementation BLL(Order)
-(void) createOrder:(NSString*) productNo quantity:(int) amount
{
	NSLog(@"thank you for order our product. productNo:%@,quantity:%d",productNo,amount);
}

@end
