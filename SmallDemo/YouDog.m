//
//  YouDog.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "YouDog.h"

@implementation YouDog
@synthesize ID=_ID;
- (id)init
{
    self = [super init];
    if (self) {
        timer=[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(UpdateTimer:) userInfo:nil repeats:YES];
    }
    return self;
}
- (void)setBark:(void (^)(YouDog *, int))eachBark
{
        if(BarkCallback != eachBark) {
            [BarkCallback release];
        }
    BarkCallback = [eachBark copy];
}

-(void)GetMyBlcok:(Myblock)mb{
    
    if(simblock != mb) {
        [simblock release];
    }
    simblock = [mb copy];
    //注意:这里对block进行了copy操作
}

- (void)getMyBlokck:(Myblock)mb
{
    int (^doubler)(int);
    doubler = ^(int n){return n*2;};
    int j = doubler(9);
    NSLog(@"j=%d",j);
    int s = ^(int a) {return a*a;} (5);
    NSLog(@"s=%d",s);
}

-(void)UpdateTimer:(id)arg{
    
    barkcount++;
    
    NSLog(@"dog%d bark count %d",_ID,barkcount);
          
          if(BarkCallback)
          {
              BarkCallback(self,barkcount);    
              //这里调用了block
          }
          if(simblock)
          {
            int num =simblock(5,barkcount);    //这里调用了block
            NSLog(@"simBlock num is %d", num);         
          }
}
          
-(void)dealloc{
    [simblock release];     //注意:这里对block进行了释放
    [BarkCallback  release]; //因为block执行了copy操作，需要手动删除
    [super dealloc];
}
@end
