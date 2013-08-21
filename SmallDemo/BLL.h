//
//  BLL.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
/*
 做过asp.net开发的程序员都知道，c#中的partial class可以方便的将同一个类的代码，分散在多个不同的物理文件中，编译器在编译时能自动将它们合并。这是一个很棒的功能，在团队开发中我经常把一个类的不同业务模块，分散成几个不同的物理文件（比如class_jimmy.cs，class_mike.cs...），然后jimmy只在class_jimmy.cs中写代码，mike只在class_mike.cs中写代码，在很大程度上这样可以减少(或避免)最终svn提交合并时的冲突。
 表面上看，partial class与扩展方法是风马牛不相及的二个概念，但是在obj-C中，这二个其实是一回事。
 场景：比如一个商城系统，对产品的增、删、改定义，我想单独放到文件Product.h中，而对订单的处理，我想单独放到文件Order.h中，但是这些跟业务相关的处理，我想在逻辑上把它们都归到同一个类BLL.h中。
 看看obj-C中的做法:(主要是看几个文件是如何组织成一个类的，代码只是示例而已)
*/

#import <Foundation/Foundation.h>

@interface BLL : NSObject
{
    NSString* connStr;
}
-(void) setConnString:(NSString*) connString;
-(NSString*) connString;
@end
