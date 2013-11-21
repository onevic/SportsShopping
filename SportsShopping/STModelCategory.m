//
//  STModelCategory.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STModelCategory.h"

@implementation STModelCategory
- (id)init
{
    self = [super init];
    if (self) {
        self.categorySubIds = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
