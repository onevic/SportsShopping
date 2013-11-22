//
//  STMyFavoriteViewController.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STMyFavoriteViewController.h"
#import "STMyFavouriteCell.h"
#import "STAppDelegate.h"
#import "DDMenuController.h"

@interface STMyFavoriteViewController ()

@end

@implementation STMyFavoriteViewController {
    UITableView *_tableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //菜单按钮
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(20, 15, 18.5, 13);
    [menuBtn setImage:[UIImage imageNamed:@"购物车_06.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.myNavigationBar addSubview:menuBtn];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - 事件响应
- (void)showMenu
{
    STAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.ddmenu showLeftController:YES];
}

#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STMyFavouriteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[STMyFavouriteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
//    if (_allMyFavorites.count != 0) {
//        STModelItem *item1;
//        STModelItem *item2;
//        if (indexPath.row*2 <= _allMyFavorites.count-1)
//        {
//            
//            item1 = [_allMyFavorites objectAtIndex:indexPath.row*2];
//        }
//        if (indexPath.row*2+1 <= _allMyFavorites.count-1)
//        {
//            
//            item2 = [_allMyFavorites objectAtIndex:indexPath.row*2+1];
//        }
//        [cell layoutWithItem1:item1 andItem2:item2];
//    }
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


@end
