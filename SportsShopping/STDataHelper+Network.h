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

#define kNotifyLoadAllCategoryCompleted @"kNotifyLoadAllCategoryCompleted"
@interface STDataHelper (NetworkHome)
- (void)loadAllCategories;
@end
