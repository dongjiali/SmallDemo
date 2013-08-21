//
//  ListView.h
//  ListView
//
//  Created by Curry on 13-6-8.
//  Copyright (c) 2013年 sinosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol IRequestDelegate <NSObject>
@optional
- (void)resultData:(NSString *)resultData;
@end

@interface ListView : UIView <UITableViewDelegate,UITableViewDataSource>
{
    id <IRequestDelegate> delegate;
    UIScrollView *scrollview;
    UITableView *tableView_;
    NSArray *arrayData_;
    NSMutableArray *listData_;
    NSInteger lasterTag;
    NSInteger rownumber;
    BOOL flag;
    BOOL openFlag;
    float sumHeight;
}
@property (nonatomic,retain) NSArray *arrayData_;
@property (nonatomic,retain) NSMutableArray *listData_;
@property (nonatomic,assign) id <IRequestDelegate> delegate;
@property (nonatomic,retain) UITableView *tableView_;
- (void)reSetFrame:(id)sender;
- (id)initWithFrame:(CGRect)frame arrayData_:(NSArray *)arrayData scrollEnabled:(BOOL)boolflag;
@end


/*
 NSArray *titleArray = [[NSArray alloc]initWithObjects:@"Introduction", @"Planner", @"Quotation&Product", @"E-Sub",@"Setting",nil];
 NSMutableArray *dataArray = [[NSMutableArray alloc]init];
 NSArray *arrayone = [[NSArray alloc]initWithObjects:@"none",@"none",nil];
 NSArray *arraytwo = [[NSArray alloc]initWithObjects:@"Customer List",@"New Planner",nil];
 NSArray *arraythree = [[NSArray alloc]initWithObjects:nil,nil];
 NSArray *arrayfore = [[NSArray alloc]initWithObjects:nil, nil];
 NSArray *arrayfive = [[NSArray alloc]initWithObjects:nil,nil];
 [dataArray addObject:arrayone];
 [dataArray addObject:arraytwo];
 [dataArray addObject:arraythree];
 [dataArray addObject:arrayfore];
 [dataArray addObject:arrayfive];
 [arrayone release];
 [arraytwo release];
 [arraythree release];
 [arrayfore release];
 [arrayfive release];
 
 
 ListView *listView_ = [[ListView alloc]initWithFrame:CGRectMake(0.0f, 20.0f, 320.0f ,480) arrayData_:titleArray scrollEnabled:YES];
 listView_.self.listData_ = dataArray;
 listView_.layer.masksToBounds = YES;
 listView_.delegate = self;
 [self.window addSubview:listView_];
 [dataArray release];
 [listView_ release];
*/