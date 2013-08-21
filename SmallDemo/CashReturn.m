//
//  CashReturn.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "CashReturn.h"

@implementation CashReturn
@synthesize moneyReturn;
@synthesize moneyCondition;
- (CashReturn *)MyInit:(double)moneyConditions And:(double)moneyReturns
{
    [self setMoneyReturn:moneyReturns];
    [self setMoneyCondition:moneyConditions];
    return self;
}
- (double)acceptCash:(double)money
{
    double result;
    result = money;
    @try{
        if(money >= moneyCondition){
            result = money - (money /moneyCondition)*moneyReturn;
        }
    }
    
    @catch(NSException*exception)
    {
        NSLog(@"Oh!Man!!CashReturn has something wrong!");
              }
              @finally{
                  return result;  
              }
}
@end
