//
//  STDataHelper+Database.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STDataHelper+Database.h"
#import "STModelCategory.h"
#import "FMDatabase.h"

@implementation STDataHelper (Database)
- (void)insertCategory:(NSDictionary *)cateDict
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/Caches/sqlite.db", NSHomeDirectory()];
    FMDatabase *database = [FMDatabase databaseWithPath:filePath];
    
    NSString *cateName = [cateDict objectForKey:@""];
    NSString *cateId = [cateDict objectForKey:@""];
    if ([database open])
    {
        [database executeUpdate:@"insert into Category values(?,?);", cateName, cateId];
        for (NSString *cateSubId in [cateDict objectForKey:@""]) {
            [database executeUpdate:@"insert into CategorySubId values(?,?);", cateId, cateSubId];
        }
    }
    [database close];
}
@end

@implementation STDataHelper (DatabaseHome)
- (NSMutableArray *)allCategories
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/Caches/sqlite.db", NSHomeDirectory()];
    FMDatabase *database = [FMDatabase databaseWithPath:filePath];
    if ([database open])
    {
        FMResultSet *rs = [database executeQuery:@"select * from Category;"];
        while ([rs next]) {
            
        }
    }
    [database close];
}
@end
