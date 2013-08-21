//
//  CashReturn.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"
@interface CashReturn : CashSuper
{
@private  double moneyCondition;
@private  double moneyReturn;
}
@property double moneyCondition;
@property double moneyReturn;
- (CashReturn *)MyInit:(double)moneyConditions And:(double)moneyReturns;
@end
