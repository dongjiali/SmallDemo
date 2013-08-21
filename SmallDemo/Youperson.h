//
//  Youperson.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YouDog.h"
@interface Youperson : NSObject
{
    YouDog *_dog;
}
@property(retain)YouDog *dog;

@end
