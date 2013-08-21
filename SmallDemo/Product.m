//
//  Product.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Product.h"

@implementation BLL(Product)
-(void) addProduct: (NSString* )productName productNo:(NSString*)proNo
{
	NSLog(@"connString=%@",connStr);//输出Bll.h中定义的成员connStr
	NSLog(@"addProduct success! productName:%@,productNo:%@",productName,proNo);
}

-(void) deleteProduct:(NSString*) productNo
{
	NSLog(@"connString=%@",[self connString]);//也可以用属性来访问
	NSLog(@"deleteProduct success! productNo:%@",productNo);
}

@end
