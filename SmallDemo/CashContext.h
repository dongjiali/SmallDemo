//
//  CashContext.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSuper.h"
@interface CashContext : NSObject
{
    @private CashSuper *cs;
}
- (CashContext *)MyInit:(int)type;
- (void)setCashSuper:(CashSuper *)cashSuper;
- (double)getResult:(double)money;
@end
