//
//  ViewControllerB.m
//  SmallDemo
//
//  Created by Curry on 13-2-19.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

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
    
    //显示从前一个界面传过来的值
    textName_.text = self.userentity.userName;
    textSex_.text = self.userentity.gendar;
    //NSString转换为int型
    textAge_.text = [NSString stringWithFormat:@"%d",self.userentity.age];
    
}

- (IBAction)backButton:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
