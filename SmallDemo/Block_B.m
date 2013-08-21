//
//  Block_B.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Block_B.h"

@implementation Block_B
-(void)justForTest:(NSString *)string block:(BlockTestXH)block{
    _blockTestXH = [block copy];//这里需要copy
//    _blockTestXH([NSString stringWithFormat:@"Can I success %@",string]);//()中的string为要回传的值
    
    [NSThread detachNewThreadSelector:@selector(begannweThread:) toTarget:self withObject:string];
}


- (void)begannweThread:(NSString *)str
{
    for(int i = 0 ;i<10;i++)
    {
         [NSThread sleepForTimeInterval:0.5];
        NSLog(@"newTrehad-----%d",i);
    }
    [NSThread sleepForTimeInterval:5];
    _blockTestXH([NSString stringWithFormat:@"Can I success %@",str]);

}

-(void)dealloc{
    [_blockTestXH release];
    [super dealloc];
}
@end
