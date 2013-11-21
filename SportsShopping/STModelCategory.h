//
//  STModelCategory.h
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STModelCategory : NSObject
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSMutableArray *categorySubIds;
@end
