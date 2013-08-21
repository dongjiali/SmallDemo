//
//  Finery.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface Finery : Person
{
    Person *compoent;
}
- (void)Decorator:(Person *)_compoent;
@end
