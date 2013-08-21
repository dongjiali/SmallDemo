//
//  Author.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-2.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Author.h"
#import "Book.h"
@implementation Author
- (void)thisIsAPrivateMethod
{
    
}

- (void)instanceMethod
{
    NSLog(@"this is instanceMethod");
}

+ (void)staticMethod
{
    NSLog(@"this is staticMethod");
}

- (void)selector1:(NSNotification *)notification{
    
	NSObject *obj  = [notification object];
    
    
    
	if([obj isKindOfClass: [NSDictionary class]]){
        
		// Do dictionary payload funcntion 
        
	}else{
        
		//perform non-object payload function
        
	}
    
	
    
}

@end
