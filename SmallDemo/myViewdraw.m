//
//  myViewdraw.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-16.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "myViewdraw.h"

@implementation myViewdraw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        // Initialization code

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToRect(context, CGRectMake(0, 0, 50, 50));
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextStrokePath(context);
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1);
    CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 1);
    CGContextFillRect(context, CGRectMake(50, 50, 100, 100));
    CGContextFillPath(context);
}

@end
