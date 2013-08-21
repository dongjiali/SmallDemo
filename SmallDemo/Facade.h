//
//  Facade.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-13.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SubSystemOne;
@class SubSystemTwo;
@class SubSystemThree;
@class SubSystemFour;
@interface Facade : NSObject
{
    @private SubSystemOne *one;
    @private SubSystemTwo *two;
    @private SubSystemThree *three;
    @private SubSystemFour *four;
}
-(Facade*)MyInit;

-(void)MethodA;

-(void)MethodB;
@end
