//
//  ViewControllerA.m
//  SmallDemo
//
//  Created by Curry on 13-2-19.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "ViewControllerA.h"
#import "UserEntity.h"
#import "ViewControllerB.h"
@interface ViewControllerA ()

@end

@implementation ViewControllerA

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
    // Do any additional setup after loading the view from its nib.
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    la.text = @"陈凯";
    la.textColor = [UIColor redColor];
    NSString *image_url = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MyBundle.bundle/images/PolicyService_@2x.png"];
    la.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:image_url]];
    [self.view addSubview:la];
    
    [imageView_ setImage:[UIImage imageWithContentsOfFile:image_url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)passValueButton:(id)sender {
    //构建UserEntity对象
    UserEntity *userEntity = [[UserEntity alloc] init];
    userEntity.userName = textName_.text;
    userEntity.gendar = textSex_.text;
    userEntity.age = [textAge_.text intValue];
    
    ViewControllerB *secondView = [[ViewControllerB alloc] initWithNibName:@"ViewControllerB" bundle:[NSBundle mainBundle]];
    //设置SecondViewController中的值
    secondView.userentity = userEntity;
    //跳转界面
    [self presentModalViewController:secondView animated:YES];
    
    [userEntity release];
    [secondView release];
}
@end
