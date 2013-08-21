//
//  HandsetGame.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-18.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HandsetSoft.h"
@interface HandsetGame : HandsetSoft<IQuery>

- (void)test:(id <IQuery>) obj;
@end
