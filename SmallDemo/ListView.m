//
//  ListView.m
//  ListView
//
//  Created by Curry on 13-6-8.
//  Copyright (c) 2013年 sinosoft. All rights reserved.
//
//标题和tableView的行高
#define TitleViewHeight 55.0
//箭头图片距右边距的像素
#define ImageArrowMarkRame  CGRectMake(210, 23, 16, 16)
//标题里的label的位置和大小
#define  TitleTextFrame  CGRectMake(15, 0, 300, TitleViewHeight)

#import "ListView.h"
@implementation ListView
@synthesize tableView_ ,delegate,arrayData_,listData_;

- (id)initWithFrame:(CGRect)frame arrayData_:(NSArray *)arrayData scrollEnabled:(BOOL)boolflag;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.arrayData_ = arrayData;
        // Initialization code
        flag = NO;
        openFlag = NO;
        sumHeight = 0;
        self.frame = frame;
        rownumber = [arrayData count]-1;
        // Do any additional setup after loading the view from its nib.
        NSInteger totalHeight = 0;//初始化的总高度
        scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, [arrayData_ count]*TitleViewHeight +200 )];
        scrollview.contentSize = CGSizeMake(0, scrollview.frame.size.height+1);
        scrollview.scrollEnabled = boolflag;
        scrollview.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollview];
        for(int i = 0; i < [arrayData_ count]; i++)
        {
            NSString *Titlename = [arrayData_ objectAtIndex:i];//得到标题
            
            UIView *BodyView = [[UIView alloc] initWithFrame:CGRectMake(0, totalHeight, frame.size.width, TitleViewHeight)];//添加view，开始view的高度为默认的60
            [BodyView setBackgroundColor:[UIColor blackColor]];
            [BodyView setTag:[[NSString stringWithFormat:@"%d",i+20] intValue]];
            [scrollview addSubview:BodyView];
            
            totalHeight = totalHeight + TitleViewHeight;
            
            UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, TitleViewHeight)];//添加button所在的view，因为该view的颜色要改变
            [titleView setTag:[[NSString stringWithFormat:@"%d",i+10] intValue]];
            UIImageView *titlebackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, TitleViewHeight)];
            [titlebackground setImage:[UIImage imageNamed:@"TreeLilstTitleBg@2x.png"]];
            [titleView addSubview:titlebackground];
            [BodyView addSubview:titleView];
            [titlebackground release];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTag:[[NSString stringWithFormat:@"%d",i] intValue]];
            [btn setFrame:CGRectMake(0, 0, 311.5, TitleViewHeight)];
            [btn addTarget:self action:@selector(reSetFrame:) forControlEvents:UIControlEventTouchUpInside];
            [titleView addSubview:btn];
            
            UIImageView *img = [[UIImageView alloc] initWithFrame:ImageArrowMarkRame];
            img.image = [UIImage imageNamed:@"arrowmark_close@2x.png"];
            [img setTag:[[NSString stringWithFormat:@"%d",i+30] intValue]];
            [titleView addSubview:img];
            
            
            UILabel *labTitle = [[UILabel alloc] initWithFrame:TitleTextFrame];
            labTitle.textColor = [UIColor colorWithRed:9/255.0 green:75/255.0 blue:120/255.0 alpha:1];
            labTitle.backgroundColor = [UIColor clearColor];
            labTitle.shadowColor = [UIColor whiteColor];
            labTitle.shadowOffset = CGSizeMake(0, 1);
            labTitle.text = Titlename;
            labTitle.font = [UIFont boldSystemFontOfSize:20];
            [titleView addSubview:labTitle];
            
            tableView_ = [[UITableView alloc]initWithFrame:CGRectMake(0, TitleViewHeight, frame.size.width, 0) style:UITableViewStylePlain];
            tableView_.tag = [[NSString stringWithFormat:@"%d",i+40] intValue];
            tableView_.dataSource = self;
            tableView_.delegate = self;
            tableView_.scrollEnabled = NO;
            tableView_.bounces = YES;
            tableView_.bouncesZoom = YES;
            tableView_.scrollEnabled = YES;
            [BodyView addSubview:tableView_];
            [labTitle release];
            [img release];
            [titleView release];
            [BodyView release];
        }
    }
    return self;
}



-(void)reSetFrame:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSInteger btnTag = btn.tag;
    if(!flag || lasterTag == btnTag)
    {
        flag = !flag;
    }
    lasterTag = btnTag;
    [UIView beginAnimations:nil context:self];//开始动画
    [UIView setAnimationDuration:0.4];//设定速度
    
    for (int i = 0; i < [arrayData_ count]; i++)
    {
        [tableView_ deselectRowAtIndexPath:[tableView_ indexPathForSelectedRow] animated:NO];
        if(btnTag == [[NSString stringWithFormat:@"%d",i] intValue] && flag)//触发当前行
        {
            tableView_ = (UITableView*)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+40] intValue]];
            //                sumHeight = [[listData_ objectAtIndex:lasterTag]count] * 44;
            sumHeight = tableView_.contentSize.height;
            
            UIView *titleView = (UIView *)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+10] intValue]];
            titleView.backgroundColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:0.6];
            
            UIView *QQView = (UIView *)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+20] intValue]];
            QQView.frame = CGRectMake(0,i * TitleViewHeight  , self.frame.size.width, sumHeight + TitleViewHeight);        //fix by levi
            
            tableView_.frame = CGRectMake(0, TitleViewHeight, self.frame.size.width, sumHeight);
            
            UIImageView *img = (UIImageView*)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+30] intValue]];
            if ([[listData_ objectAtIndex:i]count ]>0)
            {
                img.image = [UIImage imageNamed:@"arrowmark_open@2x.png"];
                //                scrollview.contentSize = CGSizeMake(0,sumHeight + [arrayData_ count]*TitleViewHeight);
                scrollview.contentSize = CGSizeMake(0,201+ [arrayData_ count]*TitleViewHeight);
                openFlag = YES;
            }
            else
            {
                NSString *requsetstring = [NSString stringWithFormat:@"%d",i];
                [self.delegate resultData:requsetstring];
            }
        }
        else
        {
            UIView *titleView = (UIView *)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+10] intValue]];
            titleView.backgroundColor = [UIColor clearColor];
            
            UIView *QQView = (UIView *)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+20] intValue]];
            QQView.frame = CGRectMake(0, i* TitleViewHeight + sumHeight, self.frame.size.width, TitleViewHeight);
            
            tableView_ = (UITableView*)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+40] intValue]];
            tableView_.frame = CGRectMake(0, TitleViewHeight, self.frame.size.width, 0);
            
            UIImageView *img = (UIImageView*)[self viewWithTag:[[NSString stringWithFormat:@"%d",i+30] intValue]];
            img.image = [UIImage imageNamed:@"arrowmark_close@2x.png"];
        }
    }
    if (openFlag) {
        openFlag = NO;
    }
    else
    {
        scrollview.contentSize = CGSizeMake(0, scrollview.frame.size.height+1);
    }
    [UIView commitAnimations];
    sumHeight = 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[listData_ objectAtIndex:rownumber--]count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TitleViewHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    cell.textLabel.text = [[listData_ objectAtIndex:lasterTag]objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    cell.textLabel.textColor = [UIColor colorWithRed:181/255.0 green:185/255.0 blue:185/255.0 alpha:1];
    cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:253/255.0 green:176/255.0 blue:0 alpha:.8];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *requsetstring = [NSString stringWithFormat:@"%d%d",lasterTag,indexPath.row];
    [self.delegate resultData:(NSString *)requsetstring];
}

-(void)dealloc
{
    [scrollview release];
    [tableView_ release];
    [arrayData_ release];
    [listData_ release];
    [super dealloc];
}
@end

