//
//  Decorator.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-12.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Compoent.h"
@interface Decorator : Compoent
{
    Compoent *compoent;
}
-(void)SetCompoent:(Compoent *)_compoent;
@end
