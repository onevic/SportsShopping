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
        /*如果存在*/
        BOOL isExist = NO;
        FMResultSet *rs = [database executeQuery:@"select * from Category where id=?;", cateId];
        while ([rs next]) {
            isExist = YES;
            break;
        }
        /*不存在才插入*/
        if (!isExist)
        {
            [database executeUpdate:@"insert into Category values(?,?);", cateName, cateId];
            for (NSDictionary *subDict in list) {
                NSString *cateSubId = [subDict objectForKey:@"ID"];
                [database executeUpdate:@"insert into CategorySubId values(?,?);", cateId, cateSubId];
            }
        }
    }
    [database close];
}

- (void)insertItem:(NSDictionary *)itemDict
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/Caches/sqlite.db", NSHomeDirectory()];
    FMDatabase *database = [FMDatabase databaseWithPath:filePath];
    /*
     @property (nonatomic, strong) NSString *itemName;
     @property (nonatomic, strong) NSString *itemFavs;
     @property (nonatomic, strong) NSString *itemPrice;
     @property (nonatomic, strong) NSString *itemUrl;
     @property (nonatomic, strong) NSString *itemAct; //销量
     @property (nonatomic, strong) NSString *itemId;
     @property (nonatomic, strong) NSString *itemImage;
     */
    NSString *itemName = [itemDict objectForKey:@"name"];
    NSString *itemFavs = [itemDict objectForKey:@"favs"];
    NSString *itemPrice = [itemDict objectForKey:@"price"];
    NSString *itemUrl = [itemDict objectForKey:@"url"];
    NSString *itemAct = [itemDict objectForKey:@"act"];
    NSString *itemId = [itemDict objectForKey:@"ID"];
    NSString *itemImage = [itemDict objectForKey:@"img2"];
    if ([database open])
    {
        /*判断是否存在*/
        BOOL isExist = NO;
        FMResultSet *rs = [database executeQuery:@"select * from Item where id=?;", itemId];
        while ([rs next])
        {
            isExist = YES;
            break;
        }
        if (!isExist)
        {
            [database executeUpdate:@"insert into Item values(?,?,?,?,?,?,?);", itemName, itemFavs, itemPrice, itemUrl, itemAct, itemId, itemImage];
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
