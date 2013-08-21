//
//  NLViewController.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-30.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLViewController : UIViewController<UIWebViewDelegate>
{
    UILabel *_label;
    NSData *_data;
    NSCondition *_connection;
}
@property (nonatomic,assign)UILabel *label;
@property (nonatomic,assign) NSData *data;
@property (nonatomic,assign)NSCondition *connection;
@end
