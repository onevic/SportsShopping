//
//  STDataHelper+Network.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STDataHelper+Network.h"
#import "STDataHelper+Database.h"
#import "STModelCategory.h"

@implementation STDataHelper (Network)

@end

#define kServer @"http://192.168.88.8/app/taobao/api/"

@implementation STDataHelper (Home)
- (void)loadAllCategories
{
    NSString *urlString = [NSString stringWithFormat:@"%@get_cateall.php?app_name=sportShopping", kServer];
    _loadAllCategories = [NSBlockOperation blockOperationWithBlock:^{
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        if (jsonData)
        {
            NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:Nil];
            NSArray *list = [rootDict objectForKey:@"List"];
            NSDictionary *value0 = [list objectAtIndex:0];
            list = [value0 objectForKey:@"List"];
            for (NSDictionary *cateDict in list) {
                [self insertCategory:cateDict];
            }
            /*发通知回调*/
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotifyLoadAllCategoryCompleted object:Nil];
        }
    }];
    [_operationQueue addOperation:_loadAllCategories];
}

- (void)loadCategoryDetailWithCate:(STModelCategory *)cate
{
    NSString *urlString = kServer@"get_list.php?cate_id=";
    _loadCategoryDetail = [NSBlockOperation blockOperationWithBlock:^{
        for (NSString *subId in cate.categorySubIds) {
            NSString *urlStr = [NSString stringWithFormat:@"%@%@", urlString, subId];
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
            if (jsonData)
            {
                NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
                NSArray *list = [rootDict objectForKey:@"List"];
                for (NSDictionary *itemDict in list) {
                    [self insertItem:itemDict];
                }
                /*发通知回调*/
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotifyLoadCategoryDetailCompleted object:Nil];
            }
        }
    }];
    [_operationQueue addOperation:_loadCategoryDetail];
}
@end
