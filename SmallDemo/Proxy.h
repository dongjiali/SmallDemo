//
//  Proxy.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-13.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"
#import "RealSubject.h"
@interface Proxy : Subject
{
    @private RealSubject *realsubject;
}
@end
