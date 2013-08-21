//
//  CashContext.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "CashContext.h"
#import "CashReturn.h"
#import "CashSuper.h"
#import "CashNormal.h"
#import "CashRebate.h"
@implementation CashContext
- (CashContext *)MyInit:(int)type
{
    int myTypes;
     myTypes = type;
    switch(myTypes)
    {
        case 1:
            [self setCashSuper:[[CashNormal alloc]init]];
            break;
        case 2:     
            [self setCashSuper: [[CashReturn alloc]MyInit:300 And:100]];
            break;
        case 3:
            [self setCashSuper:[[CashRebate alloc]MyInit:0.8]];
            break;
        default:
            break;
    }
    return self;
}

-(void)setCashSuper:(CashSuper*)cashSuper{
    cs = cashSuper;
}

- (double)getResult:(double)money{
    return [cs acceptCash:money];
}
@end
