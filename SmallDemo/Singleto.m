//
//  Singleto.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-16.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Singleto.h"

@implementation Singleto
	static Singleto  *instance = nil;
+ (Singleto *)GetInstance
{
	@synchronized([Singleto class]){
		if(instance ==nil){
			instance = [[self alloc]init];
			NSLog(@"我被创建了");
		}
	}
	return instance;
}

+(id)alloc{
	@synchronized([Singleto class]){
		if (instance ==nil) {
			instance = [super alloc];
		}
		else {
			NSLog(@"不好意思，你在实例化第二个对象");
		}
		return instance;
	}
	return nil;
}

-(id)init{
	self = [super init];
	if(self !=nil){
		NSLog(@"初始化数据");
	}
	return self;
}
@end
