//
//  CashRebate.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"
@interface CashRebate : CashSuper
{
    @private double moneyRabate;
}
@property double moneyRebate;
- (CashRebate *)MyInit:(double)moneyRabates;
@end
