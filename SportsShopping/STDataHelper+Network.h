//
//  STDataHelper+Network.h
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STDataHelper.h"

@interface STDataHelper (Network)

@end

@class STModelCategory;
#define kNotifyLoadAllCategoryCompleted @"kNotifyLoadAllCategoryCompleted"
#define kNotifyLoadCategoryDetailCompleted @"kNotifyLoadCategoryDetailCompleted"
@interface STDataHelper (NetworkHome)
- (void)loadAllCategories;
- (void)loadCategoryDetailWithCate:(STModelCategory *)cate;
@end
