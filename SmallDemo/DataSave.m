//
//  DataSave.m
//  SmallDemo
//
//  Created by Curry on 13-2-22.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#import "DataSave.h"

@implementation DataSave

/*///////////////数据持久化////////////////*/


//属性列表NSUserDefaults
- (void)SaveDataToThisLocality1
{

    NSString *strOne = @"Persistent data1";
    NSString *strTwo = @"Persistent data 2";
    
    NSMutableArray *persistentArray = [[NSMutableArray alloc] init];
    [persistentArray addObject:strOne];
    [persistentArray addObject:strTwo];
    
    //archive
    NSUserDefaults *persistentDefaults = [NSUserDefaults standardUserDefaults];
    [persistentDefaults setObject:persistentArray forKey:@"myDefault"];
    NSString *descriptionDefault = [persistentDefaults description];
    NSLog(@"NSUserDefaults description is :%@",descriptionDefault);
    
    //unarchive
    NSArray *UnpersistentArray =
    
    [persistentDefaults objectForKey:@"myDefault"];
    
    
    NSString *UnstrOne = [UnpersistentArray objectAtIndex:0];
    NSString *UnstrTwo = [UnpersistentArray objectAtIndex:1];
    
    NSLog(@"UnstrOne = %@,UnstrTwo = %@",UnstrOne,UnstrTwo);
}

//对象归档NSKeyedArchiver和NSKeyedUnarchiver
- (void)SaveDataToThisLocality2
{
    NSString *strOne = @"Persistent data1";
    NSString *strTwo = @"Persistent data 2";
    
    NSArray *persistentArray = [NSArray arrayWithObjects:strOne,strTwo,nil];
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,    NSAllDomainsMask, YES);
    
    int pathLen = [pathArray count];
    
    NSLog(@"path number is :%d",pathLen);
    
    NSString *filePath;
    
    for(int i = 0; i < pathLen; i++)
    {
        filePath = [pathArray objectAtIndex:i];
        NSLog(@"%d path is :%@",i,filePath);
    }
    NSString *myFilename = [filePath stringByAppendingPathComponent:@"myFile.rtf"];
    
    NSLog(@"myfiles path is :%@",myFilename);
    
    // no files generated in correspond directory now
    
    [NSKeyedArchiver archiveRootObject:persistentArray toFile:myFilename];
}

@end
