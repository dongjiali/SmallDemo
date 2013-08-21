//
//  myView.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-3.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "myView.h"

@implementation myView

- (id)initWithFrame:(CGRect)frame 
{ 
    self = [super initWithFrame:frame]; 
    if (self) { 
        [self setBackgroundColor:[UIColor yellowColor]]; 
    } 
    return self; 
} 

- (void)dealloc 
{ 
    [super dealloc]; 
} 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
