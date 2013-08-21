//
//  HandsetSoft.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-17.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IQuery

@required
-(void) Query:(NSString*) sql;

@end

@interface HandsetSoft : NSObject
{

}
- (void)Run;
@end
