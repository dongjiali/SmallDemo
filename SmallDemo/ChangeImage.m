//
//  ChangeImage.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-7.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "ChangeImage.h"
#define __VERSION [[[UIDevice currentDevice] systemVersion] floatValue]>=6.0?4:3
#define ImageWithName(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%d%@",__VERSION,name] ofType:@"png"]]

#define __VERSION1 [[[UIDevice currentDevice] systemVersion] floatValue]>=6.0?@"image4.0/":@"image3.5/"
#define ImageWithName1(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@%@",__VERSION1,name] ofType:@"png"]]
@implementation ChangeImage
@synthesize rootVierController = _rootVierController;
int x = 4;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"%f",[[[UIDevice currentDevice] systemVersion] floatValue]);
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [image setImage:ImageWithName(@"_image")];
         [image setImage:ImageWithName1(@"image3")];
        [self addSubview:image];
        [image release];
    }
    return self;
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
