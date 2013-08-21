//
//  ClassB.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-28.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB
-(void)requsetString{
}
+(void)staticMethod
{
    [super staticMethod];
}

-(void)publicMethod
{
    NSLog(@"%@",publicString);
    NSLog(@"%@",staticString);
    NSLog(@"%@",protectedString);
//    NSLog(@"%@",privateString);
    [super publicMethod];
}

-(void)privateMethod
{

}
@end
