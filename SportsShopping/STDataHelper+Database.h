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
@end

@interface STDataHelper (DatabaseHome)
- (NSMutableArray *)allCategories;
@end
