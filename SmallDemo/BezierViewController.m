//
//  BezierViewController.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-13.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "BezierViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Bezierview.h"
@interface BezierViewController ()
@end

@implementation BezierViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *myview1 = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    myview1.backgroundColor = [UIColor blueColor];
    myview1.layer.shadowOffset = CGSizeZero;
    NSLog(@"%f,%f",CGSizeZero.height,CGSizeZero.width);
    myview1.layer.shadowOpacity = 0.75f;
    myview1.layer.shadowRadius = 20.0f;
    myview1.layer.shadowColor = [UIColor redColor].CGColor;
    myview1.layer.shadowPath = [UIBezierPath bezierPathWithRect:myview1.layer.bounds].CGPath;
    myview1.clipsToBounds = NO;
    [self.view addSubview:myview1];
    Bezierview *myviews = [[Bezierview alloc]initWithFrame:CGRectMake(10, 150, 300, 400)];
    [self.view addSubview:myviews];
    [myviews release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
