//
//  Subjects.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-8.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Subjects.h"

@implementation Subjects
-(Subjects*)MyInit{
observers= [NSMutableArray new];
return self;
}
-(void)Attach:(Observers*)observer{
[observers addObject:observer];
}
-(void)Detach:(Observers*)observer{
[observers removeObject:observer];
}
-(void)Notify{
for(Observers *ob in observers){
    [ob Update];
}
}
@end
