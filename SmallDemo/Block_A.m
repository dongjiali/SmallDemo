//
//  Block_A.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-20.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "Block_A.h"
@implementation Block_A


-(id)init
{
    if (self = [super init]) {        
        NSDate *da = [NSDate date];
        NSString *daStr = [da description];
        const char *queueName = [daStr UTF8String];
        dispatch_queue_t myQueue = dispatch_queue_create(queueName, NULL);
        dispatch_async(myQueue, ^{NSLog(@"myqueue=%@",myQueue);});
//        int (^doubler)(int);
//        doubler = ^(int n){return n*2;};
//        int j = doubler(9);
//        NSLog(@"j=%d",j);
        // Create an array
        NSArray *array = [NSArray arrayWithObjects: @"12345", @"12345678", @"abcd", @"123abc", nil];
        // Create a set (an unordered collection of objects) with the indexes of the objects// in the array where the length of the object in the array is > 5.// Notice the parameter is a block.
        NSIndexSet *set = [array indexesOfObjectsPassingTest: ^(id obj, NSUInteger idx, BOOL *stop)  {
            if ([obj length] > 5)    return YES;  else    return NO;}];
        
        // Enumerate the set, printing the
        [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop){  NSLog(@"Array entry %d contains: %@", idx, [array objectAtIndex:idx]);}];
      
        
        __block BOOL found = NO;
        NSSet *aSet = [NSSet setWithObjects: @"Alpha", @"Beta", @"Gamma", @"X", nil];
        NSString *string = @"gamma";
        //we provide below a way of how to enumerate, using our own compare logic
        [aSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            if ([obj localizedCaseInsensitiveCompare:string] == NSOrderedSame) {
                *stop = YES;
                found = YES;  
            }  
        }];

        NSArray *arrayOfDictionaryObjects = [NSArray arrayWithObjects:    [NSDictionary dictionaryWithObjectsAndKeys:@"1234", @"accountID",
        [NSNumber numberWithBool:NO],  @"isActive", nil],
        [NSDictionary dictionaryWithObjectsAndKeys:@"2345", @"accountID", [NSNumber numberWithBool:NO],  @"isActive", nil],
        [NSDictionary dictionaryWithObjectsAndKeys:@"3456", @"accountID", [NSNumber numberWithBool:YES], @"isActive", nil],
        [NSDictionary dictionaryWithObjectsAndKeys:@"4567", @"accountID", [NSNumber numberWithBool:NO],  @"isActive", nil], nil];
        
        NSUInteger activeAccount = [arrayOfDictionaryObjects indexOfObjectPassingTest: ^(id obj, NSUInteger idx, BOOL *stop)                                                                        {         NSNumber *num = [obj valueForKey:@"isActive"];  if ([num boolValue] == YES)  {    // Stop processing the block
            *stop = YES;     return YES;  }  else    return NO;}];
        
        NSDictionary *dict = [NSTimeZone abbreviationDictionary];NSLog(@"Abbreviations: %@", dict);
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){  if ([obj hasPrefix:@"America"])    NSLog(@"America Timezone: %@", key);
            // To view all key/value pairs//
            NSLog(@"Key: %@ Value: %@",key, obj);}];
    }
    return self;
}

@end
