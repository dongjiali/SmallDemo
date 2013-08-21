//
//  Person.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
}
- (void)Show;
-(id)init:(NSString *)_name;
@end
