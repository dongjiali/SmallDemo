//
//  PlantView.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-3.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlantView : UIView
{
    CGPoint lastPoint; 
    UIImageView *lineImageView; 
    CGContextRef context;
}
@end
