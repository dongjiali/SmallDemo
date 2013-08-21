//
//  PlantView.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-3.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "PlantView.h"

@implementation PlantView

- (id)initWithFrame:(CGRect)frame 
{ 
    self = [super initWithFrame:frame]; 
    if (self) 
    { 
        lineImageView = [[UIImageView alloc] initWithFrame:frame]; 
        lineImageView.backgroundColor = [UIColor grayColor]; 
        [self addSubview:lineImageView]; 
    } 
    
    return self; 
} 

- (void)drawRect:(CGRect)rect 
{    
    context = UIGraphicsGetCurrentContext();  // 获取当前的设备上下文，必须在drawRect中获取，否则会出错 
    
    CGContextSetLineCap(context, kCGLineCapRound); // 设置划线样式 
    CGContextSetLineWidth(context, 6); 
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);   // 设置画出的线的颜色信息 
    
    CGContextBeginPath(context); 
    CGContextMoveToPoint(context, 10, 10); 
    CGContextAddLineToPoint(context, 100, 100); 
    
    CGContextStrokePath(context);  // 绘出图形 
    
    [super drawRect:rect]; 
} 

// 移动鼠标划线 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{ 
    UITouch *aTouch = [touches anyObject]; 
    lastPoint = [aTouch locationInView:self]; 
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor); 
    CGContextSetAllowsAntialiasing(context, YES); 
    
    CGContextMoveToPoint(context, 0, 15); 
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 70, 70)); 
    
    CGContextDrawPath(context, 1); 
} 

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{ 
    UITouch *aTouch = [touches anyObject]; 
    
    CGPoint currentPoint = [aTouch locationInView:self]; 
    
    UIGraphicsBeginImageContext(self.frame.size);   // 创建一个bitmap设备上下文  如果不创建，UIGraphicsGetCurrentContext()不能获取当前设备上下文 
    
    
    [lineImageView.image drawInRect:CGRectMake(0, 0, 768, 1024)];  // 设置图形的显示区域 
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound); 
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 7); 
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0); 
    
    CGContextBeginPath(UIGraphicsGetCurrentContext()); 
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y); 
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y); 
    CGContextStrokePath(UIGraphicsGetCurrentContext()); 
    
    [lineImageView setImage:UIGraphicsGetImageFromCurrentImageContext()]; 
    UIGraphicsEndImageContext();  // 关闭创建的设备上下文 
    
    lastPoint = currentPoint; 
} 

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{ 
    UIGraphicsBeginImageContext(self.frame.size); 
    [lineImageView.image drawInRect:CGRectMake(0, 0, 768, 1024)]; 
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound); 
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 7); 
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0); 
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y); 
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y); 
    CGContextStrokePath(UIGraphicsGetCurrentContext()); 
    CGContextFlush(UIGraphicsGetCurrentContext()); 
    [lineImageView setImage:UIGraphicsGetImageFromCurrentImageContext()]; 
    UIGraphicsEndImageContext(); 
    
} @end
