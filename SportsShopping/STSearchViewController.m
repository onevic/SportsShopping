//
//  STSearchViewController.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STSearchViewController.h"
#import "STSearchResultCell.h"
#import "STAppDelegate.h"
#import "DDMenuController.h"

@interface STSearchViewController ()

@end

@implementation STSearchViewController {
    UITableView *_tableView;
    UITextField *_searchTextField;
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
    
    // 菜单按钮
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(20, 15, 18.5, 13);
    [menuBtn setImage:[UIImage imageNamed:@"购物车_06.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.myNavigationBar addSubview:menuBtn];
    
    /*标题*/
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 13, 80, 18)];
    titleLabel.text = @"搜索";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.center = self.myNavigationBar.center;
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.myNavigationBar addSubview:titleLabel];
    
    // 搜索条
    UIImageView *searchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 215, 33.5)];
    searchImageView.image = [UIImage imageNamed:@"搜索2_07.png"];
    [self.view addSubview:searchImageView];
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(240, 15, 54.5, 33.5);
    [searchBtn setImage:[UIImage imageNamed:@"搜索1_07.png"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"搜索3_08.png"] forState:UIControlStateHighlighted];
    [searchBtn addTarget:self action:@selector(goSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(32, 17, 208, 30)];
    _searchTextField.delegate = self;
    [self.view addSubview:_searchTextField];
    
    // 点击背景收起键盘
    UIControl *control = [[UIControl alloc] init];
    control.frame = CGRectMake(0, 0, 320, 460);
    [control addTarget:self action:@selector(controlClick)                                                              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
    [self.view sendSubviewToBack:control];
    
    //_resultsItems = [[NSMutableArray alloc] init];
    
    // 搜索结果
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 67, kScreenWidth, kScreenHeight-64-67)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.hidden = YES;
}

#pragma mark - 事件响应
- (void)goSearch
{
    [_searchTextField resignFirstResponder];
//    if (_searchTextField.text == Nil || [_searchTextField.text isEqualToString:@""])
//    {
//        return;
//    }
//    [[STDataHelper sharedInstance] searchWithKeyword:_searchTextField.text];
    
}

- (void)showMenu
{
    STAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.ddmenu showLeftController:YES];
}

- (void)controlClick
{
    [_searchTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_searchTextField resignFirstResponder];
    [self goSearch];
    return YES;
}

- (void)searchFailed
{
    
}

#pragma mark tableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STSearchResultCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[STSearchResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    if (_resultsItems.count != 0)
//    {
//        STModelItem *item = [_resultsItems objectAtIndex:indexPath.row];
//        [cell layoutWithItem:item];
//    }
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
