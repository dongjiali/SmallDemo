//
//  ConcreteSubject.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-8.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subjects.h"
@interface ConcreteSubject:Subjects
@property (assign)NSString *subjectState;
-(ConcreteSubject*)MyInit;
@end
