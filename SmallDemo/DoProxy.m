#import "DoProxy.h"
#import "Cattle.h"
#import "Bull.h"

@implementation DoProxy
- (void) setAllIVars
{
	cattle[0] = [Cattle new];
	
	bullClass = NSClassFromString(BULL_CLASS);
	cattle[1] = [bullClass new];
	cattle[2] = [bullClass new];

	say = @selector(saySomething);
	skin = NSSelectorFromString(SET_SKIN_COLOR);
}
- (void) SELFuncs
{
	[self doWithCattleId:cattle[0] colorParam:@"brown"];
	[self doWithCattleId:cattle[1] colorParam:@"red"];
	[self doWithCattleId:cattle[2] colorParam:@"black"];
	[self doWithCattleId:self colorParam:@"haha"];
    int (^one)(int,int);
    one = ^(int anlnt,int a){
        return anlnt + a;
    };
    
    NSLog(@"%d",one(3,2));
    void (^p[2])(void) = { ^(void){ puts("Hello, world!"); }, ^(void){ puts("Goodbye!"); } };
    p[0](), p[1]();
    
    
    char *myCharacters[ 3 ] = { "TomJohn" , "George" , "Charles Condomine" };
    qsort_b (myCharacters, 3 ,
                sizeof ( char *),^( const void *l, const void *r)
                 {
                     char *left = *( char **)l;
                     char *right = *( char **)r;
                     return strncmp (left, right, 1 );
                 });
}
- (void) functionPointers
{
	setSkinColor_Func=(void (*)(id, SEL, NSString*)) [cattle[1] methodForSelector:skin];
	//IMP setSkinColor_Func = [cattle[1] methodForSelector:skin];
	say_Func = [cattle[1] methodForSelector:say];
	setSkinColor_Func(cattle[1],skin,@"verbose");
	NSLog(@"Running as a function pointer will be more efficiency!");
	say_Func(cattle[1],say); 
}
- (void) doWithCattleId:(id) aCattle colorParam:(NSString*) color
{
	if(notFirstRun == NO)
	{
		NSString *myName = NSStringFromSelector(_cmd);
		NSLog(@"Running in the method of %@", myName);
		notFirstRun = YES;
	}
	NSString *cattleParamClassName =  NSStringFromClass([aCattle class]);
	if([cattleParamClassName isEqualToString:BULL_CLASS] || 
	   [cattleParamClassName isEqualToString:CATTLE_CLASS])
	{
		[aCattle setLegsCount:4];
		if([aCattle respondsToSelector:skin])
		{
			[aCattle performSelector:skin withObject:color];
		}
		else
		{
			NSLog(@"Hi, I am a %@, have not setSkinColor!", cattleParamClassName);
		}
		[aCattle performSelector:say];
	}
	else
	{
		NSString *yourClassName = NSStringFromClass([aCattle class]);
		NSLog(@"Hi, you are a %@, but I like cattle or bull!", yourClassName);
    }
}
@end

