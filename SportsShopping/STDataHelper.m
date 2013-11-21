//
//  STDataHelper.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STDataHelper.h"

@implementation STDataHelper
+ (id)sharedInstance
{
    static STDataHelper *_instance = Nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super alloc] init];
    });
    return _instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _operationQueue = [[NSOperationQueue alloc] init];
        
    }
    return self;
}

@end
