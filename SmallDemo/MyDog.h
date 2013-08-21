//
//  MyDog.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"
@interface MyDog : NSObject{
 id<MyProtocol> delegate;
}
-(void)SomthingHappen;

-(void)SetHost:(id)host;
@end
