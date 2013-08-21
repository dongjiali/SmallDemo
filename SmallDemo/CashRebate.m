

//
//  CashRebate.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "CashRebate.h"
@implementation CashRebate
@synthesize moneyRebate;
- (CashRebate *)MyInit:(double)moneyRabates
{
    [self setMoneyRebate:moneyRabates];
    return self;
}

-(double)acceptCash:(double)money{
    
    return moneyRebate*money;
}
@end
