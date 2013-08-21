//
//  YouDog.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef int(^Myblock) (int a ,int b);
@interface YouDog : NSObject
{
    int _ID;
    NSTimer *timer;
    int barkcount;
    void(^BarkCallback)(YouDog *thisdog,int count);
    Myblock simblock;
}
@property(assign)int ID;
- (void)setBark:(void(^)(YouDog *thisdog,int count))eachBark;
- (void)getMyBlokck:(Myblock)mb;
@end
