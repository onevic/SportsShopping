//
//  STDataHelper+Database.h
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STDataHelper.h"

@interface STDataHelper (Database)
- (void)insertCategory:(NSDictionary *)cateDict;
- (void)insertItem:(NSDictionary *)itemDict;
@end

@interface STDataHelper (DatabaseHome)
- (NSMutableArray *)allCategories;

- (NSMutableArray *)allItemsWithRelated;
- (NSMutableArray *)allItemsWithPrice;
- (NSMutableArray *)allItemsWithAct;
- (NSMutableArray *)allItemsWithSold;
@end
