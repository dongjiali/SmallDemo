//
//  Animal.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject{
    NSString  *name;
    int shoutNum;
}
@property (nonatomic,assign)int shoutNum_;
- (id)init:(NSString *)_name;
-(id)init;
-(NSString *)Shout;
- (NSString *)getShoutSound;
@end
