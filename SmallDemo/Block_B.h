//
//  Block_B.h
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block_A.h"
typedef void (^BlockTestXH)(NSString *string);
@interface Block_B : NSObject
{
    BlockTestXH _blockTestXH;
}
-(void)justForTest:(NSString *)string block:(BlockTestXH)block;
@end
