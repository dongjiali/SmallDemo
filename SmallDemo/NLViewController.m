//
//  NLViewController.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-30.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "NLViewController.h"

@interface NLViewController ()

@end

@implementation NLViewController
@synthesize label = _label; 
@synthesize data = _data; 
@synthesize connection = _connection; 

- (void)dealloc{ 
    [self.label release]; 
    [self.data release]; 
    [super dealloc]; 
} 

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
    [super viewDidLoad]; 
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 400)]; 
    self.label = label; 
    label.textAlignment = UITextAlignmentCenter; 
    [label setNumberOfLines:0]; 
    label.lineBreakMode = UILineBreakModeWordWrap;  
    self.label.text = @"正在在请求数据"; 
    [self.view addSubview:label]; 
    [label release]; 
    //step 1:请求地址 
    NSString *urlString = @"www.2cto.com"; 
    NSURL *url = [NSURL URLWithString:urlString]; 
    //step 2:实例化一个request 
    NSURLRequest *requrst = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0]; 
    //step 3：创建链接 
    self.connection = [[NSURLConnection alloc] initWithRequest:requrst delegate:self]; 
    if ( self.connection) { 
        NSLog(@"链接成功"); 
    }else { 
        NSLog(@"链接失败"); 
    } 
    
    [url release]; 
    [urlString release]; 
    [requrst release]; 
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response 
{ 
    //接受一个服务端回话，再次一般初始化接受数据的对象 
    
    NSLog(@"返回数据类型：%@",[response textEncodingName]);  
    NSMutableData *d = [[NSMutableData alloc] init]; 
    self.data = d; 
    [d release]; 
} 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{ 
    //接受返回数据，这个方法可能会被调用多次，因此将多次返回数据加起来 
    
    NSUInteger datalength = [data length]; 
    NSLog(@"返回数据量：%d",datalength); 
    [self.data appendData:data]; 
} 

- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{ 
    //连接结束 
    
    NSLog(@"%d:",[self.data length]); 
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000); 
    NSString *mystr = [[NSString alloc] initWithData:_data encoding:enc]; 
    // string i 
    NSLog(@"最后的结果：%@",mystr); 
    self.label.text = mystr; 
    [mystr release]; 
    [self.connection release]; 
} 

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error 
{ 
    //链接错误 
} 

- (void)viewDidUnload
{  self.label = nil; 
    self.data = nil; 
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
