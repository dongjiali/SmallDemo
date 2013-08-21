//
//  myview.m
//  scrollView
//
//  Created by Dong JiaLi on 12-12-12.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import "Bezierview.h"
@implementation Bezierview
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization cod
    }
    return self;
}

- (void)drawHead {
    
    //使用 bezierPathWithOvalInRect 方法在一個設定的矩形方塊中畫出圓形，也就是笑臉的頭部
    UIBezierPath *pathHead = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 40, 240, 240)];
//    UIBezierPath *pathHead = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 120, 200, 100)];
//    UIBezierPath *pathHead = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 120, 200, 100) cornerRadius:10];
//    UIBezierPath *pathHead = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 120, 200, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 50)];
    //設定畫出線條的寬度
    [pathHead setLineWidth:5];
    
    //畫出線條
    [pathHead stroke];
}

- (void)drawEyes {
    
    //此設定的 path 為畫出眼睛
    UIBezierPath*pathEyes = [UIBezierPath bezierPath];
    
    //畫出左眼
    [pathEyes addArcWithCenter:CGPointMake(115, 110) radius:10 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
//    [pathEyes addArcWithCenter:CGPointMake(100, 100) radius:60 startAngle:0 endAngle:360 clockwise:YES];
    //畫出右眼
    [pathEyes moveToPoint:CGPointMake(215, 110)];
    [pathEyes addArcWithCenter:CGPointMake(205, 110) radius:10 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    [pathEyes setLineWidth:5];
    [pathEyes stroke];
}

- (void)drawSmile {
    
    //此設定的 path 為畫出嘴巴
    UIBezierPath*pathSmile = [UIBezierPath bezierPath];
    
    //移動至座標點
    [pathSmile moveToPoint:CGPointMake(100, 200)];
    
    //此方法為利用貝茲曲線的方法畫出微笑的嘴巴
    [pathSmile addCurveToPoint:CGPointMake(220, 200) controlPoint1:CGPointMake(130, 250) controlPoint2:CGPointMake(190, 240)];
    
    //同樣設定線條寬度以及畫出線條
    [pathSmile setLineWidth:5];
    [pathSmile stroke];
}

//最後我們只要在這個  FaceDraw class 中的程式進入點地方引用這些方法就可以繪製出笑臉圖案了。


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //設定所畫出的 Path 顏色
    [[UIColor blueColor] set];
    
    [self drawHead];
    [self drawEyes];
    [self drawSmile];
}

@end
