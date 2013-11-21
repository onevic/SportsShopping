//
//  STDataHelper.h
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDataHelper : NSObject
{
    NSOperationQueue *_operationQueue;
    NSBlockOperation *_loadAllCategories;
    NSBlockOperation *_loadCategoryDetail;
}
+ (id)sharedInstance;
@end
