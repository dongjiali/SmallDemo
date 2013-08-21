//
//  Bull.m
//  04-Hello Inheritance
//
//  Created by Tianze on 09/04/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Bull.h"


@implementation Bull
-(void) saySomething
{
	NSLog(@"Hello, I am a %@ bull, I have %d legs.", [self getSkinColor],legsCount);
}
-(NSString*) getSkinColor
{
	return skinColor;
}
- (void) setSkinColor:(NSString *) color
{
	skinColor = color;
}

+ (id) bullWithLegsCount:(int) count bullSkinColor:(NSString*) theColor
{
    id ret = [self cattleWithLegsCountVersionC:count];
    [ret setSkinColor:theColor];
    //DO NOT USE autorelease here!
    return ret;
}
@end
