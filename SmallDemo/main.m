//
//  main.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Book.h"
#import "Author.h"
int main(int argc, char *argv[])
{
    @autoreleasepool {
        Book *book=[[Book alloc] init]; 
        [book setValue:@"《Objective C入门》" forKey:@"name"]; 
        NSString *name=[book valueForKey:@"name"]; 
        NSLog(@"book name: %@",name); 

        Author *author=[[[Author alloc] init] autorelease]; 
        [author setValue:@"dongjiali" forKey:@"name"]; 
        [book setValue:author forKey:@"author"]; 
        NSString *authorName=[book valueForKeyPath:@"author.name"]; 
        NSLog(@"author name: %@",authorName); 
        [book setValue:@"zhangsan" forKeyPath:@"author.name"]; 
        [book setValue:@"10.4" forKey:@"price"]; 
        NSLog(@"book price is %@",[book valueForKey:@"price"]); 
        
        Book *book1=[[[Book alloc] init] autorelease]; 
        [book1 setValue:@"5.0" forKey:@"price"]; 
        
        Book *book2=[[[Book alloc] init] autorelease]; 
        [book2 setValue:@"4.0" forKey:@"price"]; 
        
        Book *book3=[[[Book alloc] init] autorelease]; 
        [book3 setValue:@"4.0" forKey:@"price"]; 
        
        Book *book4=[[Book alloc] init]; 
        NSArray *bookProperties=[NSArray arrayWithObjects:@"name",@"price",nil]; 
        NSDictionary *bookPropertiesDictionary=[book4 dictionaryWithValuesForKeys:bookProperties]; 
        NSLog(@"book values: %@",bookPropertiesDictionary); 
        
        NSDictionary *newBookPropertiesDictionary=[NSDictionary dictionaryWithObjectsAndKeys:@"《Objective C入门》",@"name", 
                                                   @"20.5",@"price",nil]; 
        [book4 setValuesForKeysWithDictionary:newBookPropertiesDictionary]; 
        NSLog(@"book with new values: %@",[book4 dictionaryWithValuesForKeys:bookProperties]); 
        
        NSArray *books=[NSArray arrayWithObjects:book1,book2,book3,nil]; 
        [book setValue:books forKey:@"relativeBooks"]; 
        NSLog(@"relative books price: %@",[book valueForKeyPath:@"relativeBooks.price"]); 
        NSLog(@"relative books distinct price: %@",[book valueForKeyPath:@"relativeBooks.@distinctUnionOfObjects.price"]); 
        NSLog(@"relative books count: %@",[book valueForKeyPath:@"relativeBooks.@count"]); 
        NSLog(@"relative books price sum: %@",[book valueForKeyPath:@"relativeBooks.@sum.price"]); 
        NSLog(@"relative books price avg: %@",[book valueForKeyPath:@"relativeBooks.@avg.price"]); 
        NSLog(@"relative books price avg: %@",[book valueForKeyPath:@"relativeBooks.@max.price"]); 
        NSLog(@"relative books price avg: %@",[book valueForKeyPath:@"relativeBooks.@min.price"]); 

        Book *s = [Book new];	
        
        if ([s respondsToSelector:@selector(print:)]) //这一行就是判断实例s中有没有方法print
        {
            [s print:@"Hello World"];
        }
        else
        {
            NSLog(@"%@",@"Sample类中没有定义方法print");
        }
        
        [s release];
        
        
        IMP stand = NULL;
        SEL select;
        select = @selector(instanceMethod);
        stand = [author methodForSelector:select];
        stand(author,select);
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        
        if(notification !=nil){
            
            NSDate *now = [NSDate new];
            
            notification.fireDate    = [now dateByAddingTimeInterval:1];
            
            notification.timeZone  = [NSTimeZone defaultTimeZone];
            
            notification.alertBody   = @"该吃饭了！";
            
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
            
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
