//
//  Grammar.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-28.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Grammar.h"

@interface Grammar(private)

- (void)privateMethod;

@end

#pragma mark -
#pragma mark Grammar

@implementation Grammar

@synthesize publicString;

- (id)init
{
    if((self = [super init]))
    {
        if(publicString == nil)
        {
            publicString = [[NSString alloc] init];
        }
        
        if(protectedString == nil)
        {
            protectedString = [[NSString alloc] init];
        }
        
        if(privateString == nil)
        {
            privateString = [[NSString alloc] init];
        }
        
        if(staticString == nil)
        {
            staticString = [[NSString alloc] init];
        }
        a =[[NSMutableArray alloc]initWithObjects:@"100",@"89",@"aa",@"zhangss2",@"31", nil];
        b = [NSMutableArray new];
        NSArray *sortedArray = [a sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] >= [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;//递减
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;//上升
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        NSLog(@"%@",sortedArray);
    }
    
    return self;
}

- (void)dealloc
{
    [b release];
    [publicString release];
    [protectedString release];
    [privateString release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Method

+ (void)staticMethod
{
}

- (void)publicMethod
{
}

#pragma mark -
#pragma mark Private Method

- (void)privateMethod
{
    
}
@end
