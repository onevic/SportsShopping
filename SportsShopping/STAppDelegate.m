//
//  STAppDelegate.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STAppDelegate.h"
#import "DDMenuController.h"
#import "STHomeViewController.h"
#import "STLeftViewController.h"
#import "STRightViewController.h"

@implementation STAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    /*保证数据库存在*/
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/Caches/sqlite.db", NSHomeDirectory()];
    if (![fileManager fileExistsAtPath:filePath])
    {
        NSString *dbPath = [NSString stringWithFormat:@"%@/sqlite.db", [NSBundle mainBundle].resourcePath];
        [fileManager copyItemAtPath:dbPath toPath:filePath error:Nil];
    }
    
    /*程序结构*/
    _ddmenu = [[DDMenuController alloc] init];
    STHomeViewController *home = [[STHomeViewController alloc] init];
    STLeftViewController *left = [[STLeftViewController alloc] init];
    STRightViewController *right = [[STRightViewController alloc] init];
    _ddmenu.rootViewController = home;
    _ddmenu.leftViewController = left;
    _ddmenu.rightViewController = right;
    
    self.window.rootViewController = _ddmenu;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
