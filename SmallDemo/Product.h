//
//  Product.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLL.h"
@interface BLL(Product)
-(void) addProduct: (NSString* )productName productNo:(NSString*)proNo;
-(void) deleteProduct:(NSString*) productNo;
@end
