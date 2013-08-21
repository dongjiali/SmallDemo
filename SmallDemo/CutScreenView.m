//
//  CutScreenView.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-18.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "CutScreenView.h"

@implementation CutScreenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        flag_ = YES;
        
        int  i =10;
        int *p = &i;
        NSLog(@"&p=%p",&p);
        NSLog(@"p=%p",p);
        NSLog(@"*p= %d",*p);

        NSArray *stringsArray = [NSArray arrayWithObjects:
                                 @"string 1",
                                 @"String 21",
                                 @"string 12",
                                 @"String 11",
                                 @"String 02", nil];
        static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch |
        NSWidthInsensitiveSearch | NSForcedOrderingSearch;
        NSLocale *currentLocale = [NSLocale currentLocale];
        NSComparator finderSort = ^(id string1, id string2) {
            NSRange string1Range = NSMakeRange(0, [string1 length]);
            return [string1 compare:string2 options:comparisonOptions range:string1Range locale:currentLocale];
        };
        NSLog(@"finderSort: %@", [stringsArray sortedArrayUsingComparator:finderSort]);
        
        CGRect screenFrame = [UIScreen mainScreen].bounds;
        self.frame = screenFrame;
        backgroundImage_ = [[UIImageView alloc]initWithFrame:screenFrame];
        backgroundImage_.userInteractionEnabled = NO;
//        [[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"];
        [backgroundImage_ setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"qietuback@2x" ofType:@"png"]]];
        [self addSubview:backgroundImage_];
        [backgroundImage_ release];
        
        topImage_ = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:topImage_];
        [topImage_ release];
        
        bottomImage_ =[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:bottomImage_];
        [bottomImage_ release];
        
        {
            UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
            UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:flag_?@"bubbleSelf":@"bubble" ofType:@"png"]];
//            UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:YES?@"对话框01":@"对话框" ofType:@"png"]];
            UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:21 topCapHeight:14]];
            UIFont *font = [UIFont systemFontOfSize:12];
            NSString *text = @"我是可拉伸图片显示,我是可拉伸图片显示,我是可拉伸图片显示，我是可拉伸图片显示，我是可拉伸图片显示，我是可拉伸图片显示";
            CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
            
            UILabel *msgtitle = [[UILabel alloc] init];
            msgtitle.backgroundColor = [UIColor clearColor];
            msgtitle.font = font;
            msgtitle.numberOfLines = 0;
            msgtitle.lineBreakMode = UILineBreakModeCharacterWrap;
            
            msgtitle.text = [NSString stringWithFormat:@"距离2fkm"];
            
            UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(21.0f, 40.0f, size.width+10, size.height+10)];
            bubbleText.backgroundColor = [UIColor clearColor];
            bubbleText.font = font;
            bubbleText.numberOfLines = 0;
            bubbleText.lineBreakMode = UILineBreakModeCharacterWrap;
            bubbleText.text = text;
            
            returnView.frame = CGRectMake(120.0f, 10.0f, 200.0f, size.height+60.0f);
            bubbleImageView.frame = CGRectMake(0.0f, 25.0f, 200.0f, size.height+40.0f);
            msgtitle.frame = CGRectMake(100.0f, 50.0f, 250, 20);
        
            [self addSubview:returnView];
            [returnView addSubview:bubbleImageView];
            [bubbleImageView release];
            [returnView addSubview:msgtitle];
            [msgtitle release];
            [returnView addSubview:bubbleText];
            [bubbleText release];
        }
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (flag_) {
        touch_beganPoint_ = [[touches anyObject] locationInView:self];
        CGImageRef backimageRef = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"qietuback@2x" ofType:@"png"]].CGImage;
        CGImageRef  cgImageRefTop = CGImageCreateWithImageInRect(backimageRef, CGRectMake(0, 0, self.frame.size.width*2, touch_beganPoint_.y*2));
        [topImage_ setImage:[UIImage imageWithCGImage:cgImageRefTop]];
        topImage_.frame = CGRectMake(0, 0, self.frame.size.width, touch_beganPoint_.y + 20);
        bottomImage_.frame = CGRectMake(0, touch_beganPoint_.y + 20, self.frame.size.width, self.frame.size.height - touch_beganPoint_.y + 20);
        topImage_.hidden = !flag_;
        
         CGImageRef  cgImageRefBottom = CGImageCreateWithImageInRect(backimageRef, CGRectMake(0, touch_beganPoint_.y + 20, self.frame.size.width*2, (self.frame.size.height - touch_beganPoint_.y + 20)*2));
        [bottomImage_ setImage:[UIImage imageWithCGImage:cgImageRefBottom]];
        [UIView animateWithDuration:0.5 animations:^{
            bottomImage_.frame = CGRectMake(0, touch_beganPoint_.y + 120, self.frame.size.width, self.frame.size.height - touch_beganPoint_.y + 20);
            bottomImage_.hidden = !flag_;
        }];
        backgroundImage_.hidden = flag_;
    }
    
    if (!flag_) {
        [UIView animateWithDuration:0.5 animations:^{
            bottomImage_.frame = CGRectMake(0, touch_beganPoint_.y + 20, self.frame.size.width, self.frame.size.height - touch_beganPoint_.y + 20);
        }];
    }
        flag_ = !flag_;
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
