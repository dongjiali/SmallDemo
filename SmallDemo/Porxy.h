//
//  Porxy.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SchoolGirl.h"
#import "Pursuit.h"
@interface Porxy : NSObject
{
    SchoolGirl *mm;
    Pursuit *gg;
}
- (id)init:(SchoolGirl *)_mm;
- (void)GiveDolls;
- (void)GiveFlowers;
- (void)GiveChocolate;
@end
