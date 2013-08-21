//
//  CutScreenView.h
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-18.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface CutScreenView : UIView
{
    BOOL flag_;
    UIImageView *backgroundImage_;
    UIImageView *topImage_;
    UIImageView *bottomImage_;
    CGPoint touch_beganPoint_;
    CALayer *selectionLayer;
}
@end
