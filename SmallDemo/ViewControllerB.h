//
//  ViewControllerB.h
//  SmallDemo
//
//  Created by Curry on 13-2-19.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserEntity.h"
@interface ViewControllerB : UIViewController
{
    IBOutlet UITextField *textName_;
    IBOutlet UITextField *textSex_;
    IBOutlet UITextField *textAge_;
}
@property (nonatomic,retain) UserEntity *userentity;
- (IBAction)backButton:(id)sender;
@end
