//
//  myScrollView.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-3.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "myScrollView.h"
#import "myView.h"
@implementation myScrollView

- (id)initWithFrame:(CGRect)frame 
{ 
    self = [super initWithFrame:frame]; 
    if (self) { 
        [self setBackgroundColor:[UIColor redColor]]; 
        self.contentSize  = CGSizeMake(0, 700);
        myView *myview=[[myView alloc] initWithFrame:CGRectMake(1, 3, 100, 200)]; 
        [self addSubview:myview]; 
        for (int i = 0 ; i< 3; i++) {
            UIButton *btn       = [[UIButton alloc] initWithFrame:CGRectMake(0, i*20+20, 30, 10)];
            btn.backgroundColor = [UIColor greenColor];
            [btn addTarget:self action:@selector(slideClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [btn release];
        }
        [myView release]; 
    } 
    return self; 
} 

- (void)slideClick:(id)sender{
    UIButton *btn = (UIButton *)sender;
    btn.backgroundColor = [UIColor blueColor];
}

- (void)dealloc 
{ 
    [super dealloc]; 
} 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    beginPoint = [[touches anyObject] locationInView:self];
    NSLog(@"%f,%f",beginPoint.x,beginPoint.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint endPoint = [[touches anyObject] locationInView:self];
    if (endPoint.x != beginPoint.x) {
        NSLog(@"end%f",endPoint.x);
        if (beginPoint.x>endPoint.x) {
            self.center = CGPointMake(self.center.x - (beginPoint.x - endPoint.x), self.center.y);
        }
        if (beginPoint.x<endPoint.x) {
            self.center = CGPointMake(self.center.x + (endPoint.x - beginPoint.x), self.center.y);
        }
    }
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view 
{ 
    NSLog(@"用户点击了scroll上的视图%@,是否开始滚动scroll",view); 
    
    //返回yes 是不滚动 scroll 返回no 是滚动scroll 
    return YES;
} 
- (BOOL)touchesShouldCancelInContentView:(UIView *)view 
{ 
    
    NSLog(@"用户点击的视图 %@",view); 
    
    //NO scroll不可以滚动 YES scroll可以滚动 
    return NO;
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
