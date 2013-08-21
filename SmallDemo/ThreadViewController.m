//
//  ThreadViewController.m
//  SmallDemo
//
//  Created by Curry on 13-2-21.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

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
    [NSThread detachNewThreadSelector:@selector(BeginThread) toTarget:self
                           withObject:nil];
}

- (void)BeginThread{
    
    [self performSelectorInBackground:@selector(dosomethinglongtime)
                           withObject:nil];
    
    [self performSelectorOnMainThread:@selector(UpdateUI) withObject:self
                        waitUntilDone:NO];
}

-(void)dosomethinglongtime{
    
    // 修改共享变量varProgress, varText等等
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    //[dateFormatter setDateFormat:@"hh:mm:ss"]
    [age retain];
    while (1) {
        sleep(.001);
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];      //毫秒
        age = [dateFormatter stringFromDate:[NSDate date]];
    }
}

-(void)UpdateUI{
    
    // 获得共享变量varProgress, varText等等, 显示在界面上
    
    labelAge_.text = [NSString stringWithFormat:@"%@",age];
    if(!finished)
    {
        [NSTimer scheduledTimerWithTimeInterval:0.001 target:self
                                       selector:@selector(UpdateUI)
                                       userInfo:nil repeats:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
