//
//  STLeftViewController.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STLeftViewController.h"
#import "STLeftCell.h"

@interface STLeftViewController ()

@end

@implementation STLeftViewController {
    NSArray *_menuTitleArray;
    NSArray *_menuImageArray;
    UITableView *_menuTableView;
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
    [self createMenuList];
}

// 创建菜单列表
- (void)createMenuList
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-20)];
    bgImageView.image = [UIImage imageNamed:@"左滑-背景.png"];
    [self.view addSubview:bgImageView];
    _menuTitleArray = [[NSArray alloc] initWithObjects:@"主页", @"搜索", @"我喜欢的", @"个人中心", nil];
    _menuImageArray = [[NSArray alloc] initWithObjects:@"左滑_06.png", @"左滑_09.png", @"左滑_11.png", @"左滑_16.png", @"左滑_03.png", nil];
    _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 220)];
    _menuTableView.backgroundColor = [UIColor clearColor];
    _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    [self.view addSubview:_menuTableView];
}

#pragma mark - TableViewDelegateMethod

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[STLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.menuTitleLabel.text = [NSString stringWithFormat:@"%@",[_menuTitleArray objectAtIndex:indexPath.row]];
    cell.menuImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_menuImageArray objectAtIndex:indexPath.row]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"户外运动", @"搜索", @"我喜欢的", @"购物车", nil];
    //    if (indexPath.row != 4) {
    //        DDMenuController *menuController = (DDMenuController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).ddmenu;
    //        [menuController setRootController:_index animated:YES];
    //        _index.titleLabel.text = [NSString stringWithFormat:@"%@",[titleArray objectAtIndex:indexPath.row]];
    //    } else if (indexPath.row == 4) {
    //
    //    }
//    if (indexPath.row == 0)
//    {
//        IndexViewController *index = [[IndexViewController alloc] init];
//        STBaseNavigationController *nav = [[STBaseNavigationController alloc] initWithRootViewController:index];
//        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//        [appDelegate.ddmenu setRootController:nav animated:YES];
//    }
//    
//    if (indexPath.row == 1)
//    {
//        STSearchViewController *search = [[STSearchViewController alloc] init];
//        STBaseNavigationController *nav = [[STBaseNavigationController alloc] initWithRootViewController:search  ];
//        
//        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//        [appDelegate.ddmenu setRootController:nav animated:YES];
//    }
//    
//    if (indexPath.row == 2) {
//        MyFavouriteViewController *favourite = [[MyFavouriteViewController alloc] init];
//        STBaseNavigationController *nav = [[STBaseNavigationController alloc] initWithRootViewController:favourite];
//        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//        [appDelegate.ddmenu setRootController:nav animated:YES];
//    }
//    
//    if (indexPath.row == 3) {
//        CenterViewController *center = [[CenterViewController alloc] init];
//        STBaseNavigationController *nav = [[STBaseNavigationController alloc] initWithRootViewController:center];
//        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//        [appDelegate.ddmenu setRootController:nav animated:YES];
//    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showMyNavigationBar:NO animate:NO];
}

@end
