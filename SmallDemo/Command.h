//
//  Command.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-23.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Barbecuer.h"
@interface Command : NSObject
{
@protected 
    Barbecuer *receiver;
}
- (id)init:(Barbecuer *)receiver_;
@end
