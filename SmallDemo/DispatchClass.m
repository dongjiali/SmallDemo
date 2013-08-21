//
//  DispatchClass.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "DispatchClass.h"

@implementation DispatchClass
static DispatchClass  *instance = nil;
 +(DispatchClass *)GetInstance
{
        static dispatch_once_t onceToken;
        NSLog(@"onceTokenonceTokenonceTokenonceToken = %ld",onceToken);
        dispatch_once(&onceToken, ^{
            instance = [[DispatchClass alloc]init];
        });
    return instance;
}

//如果加下面这方法。调用GetInstance方法只会创建一个实现，但是如果在alloc 就会又得新生成一个实例，要想做到仅创建一个实例 加上下面这段代码就OK了
/*
+(id)alloc{
	@synchronized([DispatchClass class]){
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
*/
//初始化数据
/*
-(id)init{
	self = [super init];
	if(self !=nil){
		NSLog(@"初始化数据");
	}
	return self;
}
*/

@end
