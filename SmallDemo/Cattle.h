
#import <Foundation/Foundation.h>


@interface Cattle : NSObject {
	int legsCount;
}
- (void)saySomething;
+(id)cattleWithLegsCountVersionA:(int)count;
+(id)cattleWithLegsCountVersionB:(int)count;
+(id)cattleWithLegsCountVersionC:(int)count;
+(id)cattleWithLegsCountVersionD:(int)count;
@end
