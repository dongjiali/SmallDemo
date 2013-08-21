//
//  Youperson.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Youperson.h"

@implementation Youperson
@synthesize dog = _dog;
-(void)setDog:(YouDog *)dog{
        if(_dog!= dog){
        [_dog release];
        _dog = [dog retain];
        }
    [_dog setBark:^(YouDog* thisDog,int count) {NSLog(@"person dog: %d count:%d",[thisDog ID], count);}];
    [_dog GetMyBlcok:^int(int a,int b){NSLog(@"MyBlock is going on.numA:%d;numB:%d", a, b);return (a+b);}];
    [_dog GetMyBlcok:^int(int a,int b) {return 1;}];
}

-(YouDog*)dog{
    return _dog;
}
-(void)dealloc{
    [_dog release];
    [super dealloc];
}

@end
