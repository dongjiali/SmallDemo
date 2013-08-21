//
//  ViewControllerA.h
//  SmallDemo
//
//  Created by Curry on 13-2-19.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerA : UIViewController
{
    IBOutlet UITextField *textName_;
    IBOutlet UITextField *textSex_;
    IBOutlet UITextField *textAge_;
    IBOutlet UIButton *buttonSend_;
    IBOutlet UIImageView *imageView_;
}
- (IBAction)passValueButton:(id)sender;
@end
