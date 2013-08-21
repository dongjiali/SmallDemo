#import "Cattle.h"
#import <objc/objc-class.h>

@implementation Cattle
-(void) saySomething
{
	NSLog(@"Hello, I am a cattle, I have %d legs.", legsCount);
}

-(void) setLegsCount:(int) count
{
    legsCount = count;
}

+ (id)cattleWithLegsCountVersionA:(int)count
{
    id ret = [[Cattle alloc]init];
    [ret setLegsCount:count];
    return [ret autorelease];
}

+ (id)cattleWithLegsCountVersionB:(int)count
{
    id ret = [[[Cattle alloc]init]autorelease];
    [ret setLegsCount:count];
    return ret;
}

+ (id) cattleWithLegsCountVersionC:(int) count
{
    id ret = [[self alloc] init];
    NSLog(@"%@",self);
    [ret setLegsCount:count];
    return [ret autorelease];
}

+ (id) cattleWithLegsCountVersionD:(int) count 
{
    id ret = [[self alloc] init];
    [ret setLegsCount:count];
    
    if([self class] == [Cattle class])
        return [ret autorelease];
    SEL sayName = @selector(saySomething);
//    Method unknownSubClassSaySomething = class_getInstanceMethod([self class], sayName);
//    //Change the subclass method is RUDE!
//    Method cattleSaySomething = class_getInstanceMethod([Cattle class], sayName);
//    //method_imp is deprecated since 10.5
//    unknownSubClassSaySomething->method_imp = cattleSaySomething->method_imp;
    
    return [ret autorelease];
}

@end
