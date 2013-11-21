//
//  STCateDetailsViewController.h
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STBaseViewController.h"

@class STModelCategory;
@interface STCateDetailsViewController : STBaseViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) STModelCategory *category;
@end
