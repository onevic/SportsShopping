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
    
    NSString *cateName = [cateDict objectForKey:@"Name"];
    NSString *cateId = [cateDict objectForKey:@"ID"];
    NSArray *list = [cateDict objectForKey:@"List"];
    if ([database open])
    {
        [database executeUpdate:@"insert into Category values(?,?);", cateName, cateId];
        for (NSDictionary *subDict in list) {
            NSString *cateSubId = [subDict objectForKey:@"ID"];
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
    NSMutableArray *allCategories = [[NSMutableArray alloc] init];
    if ([database open])
    {
        FMResultSet *rs = [database executeQuery:@"select * from Category;"];
        while ([rs next]) {
            
            NSString *cateName = [rs stringForColumn:@"name"];
            NSString *cateId = [rs stringForColumn:@"id"];
            NSMutableArray *cateSubIds = [[NSMutableArray alloc] init];
            
            FMResultSet *resultset = [database executeQuery:@"select * from CategorySubId where categoryId=?;", cateId];
            while ([resultset next]) {
                NSString *subId = [resultset stringForColumn:@"subId"];
                [cateSubIds addObject:subId];
            }
            
            
            STModelCategory *cate = [[STModelCategory alloc] init];
            cate.categoryName = cateName;
            cate.categoryId = cateId;
            cate.categorySubIds = cateSubIds;
            
            [allCategories addObject:cate];
        }
    }
    [database close];
    return (allCategories.count == 0)?nil:allCategories;
}
@end
