//
//  CatTom.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-10.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CatShoutHandler <NSObject>
    -(void)run;
@end

@interface CatTom : NSObject
{
    NSString  *name;
}
-(void)Shout;
@end
