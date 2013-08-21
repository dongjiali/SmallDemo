//
//  BLL.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "BLL.h"

@implementation BLL
-(void) setConnString:(NSString *)connString
{
	connStr = connString;
}

-(NSString*) connString
{
	return connStr;
}

-(void) dealloc
{
	[connStr release];
	[super dealloc];
}
@end
