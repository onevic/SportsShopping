//
//  STCateDetailsViewController.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STCateDetailsViewController.h"
#import "STCateDetailsCell.h"

@interface STCateDetailsViewController ()

@end

@implementation STCateDetailsViewController {
    UITableView *_tableView;
    UIImageView *_topImageView;
    NSMutableArray *_btnArray;
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
    [self createUI];
}

#pragma mark - UI
- (void)createUI
{
    // 添加标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 13, 80, 18)];
   // titleLabel.text = [NSString stringWithFormat:@"%@",_cate.categoryName];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.myNavigationBar addSubview:titleLabel];
    
    // 选项按钮
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 43)];
    [self.view addSubview:topView];
    _topImageView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 43)];
    _topImageView.image = [UIImage imageNamed:@"相关.png"];
    [topView addSubview:_topImageView];
    
    // 存放button数组
    _btnArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    // 选择排序方式按钮
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 101;
    btn1.frame = CGRectMake(13, 11.5, 54, 19.5);
    [btn1 setImage:[UIImage imageNamed:@"运动鞋1_03.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"运动鞋_03nmb.png"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn1];
    [_btnArray addObject:btn1];
    btn1.selected = YES;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 102;
    btn2.frame = CGRectMake(93, 11.5, 54, 19.5);
    [btn2 setImage:[UIImage imageNamed:@"运动鞋_05.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"运动鞋1_05.png"] forState:UIControlStateSelected];
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn2];
    [_btnArray addObject:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.tag = 103;
    btn3.frame = CGRectMake(173, 11.5, 54, 19.5);
    [btn3 setImage:[UIImage imageNamed:@"运动鞋_07.png"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"运动鞋1_07.png"] forState:UIControlStateSelected];
    [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn3];
    [_btnArray addObject:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.tag = 104;
    btn4.frame = CGRectMake(253, 11.5, 54, 19.5);
    [btn4 setImage:[UIImage imageNamed:@"运动鞋_09.png"] forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"运动鞋1_09.png"] forState:UIControlStateSelected];
    [btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn4];
    [_btnArray addObject:btn4];
    
    // 表格
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 43, kScreenWidth, kScreenHeight-87-20) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - 事件响应
- (void)btnClick:(UIButton *)btn
{
    int selected = btn.tag - 100 - 1;
    NSArray *namesArray = @[@"相关", @"价格", @"销量", @"人气"];
    btn.selected = YES;
    _topImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [namesArray objectAtIndex:selected]]];
    for (UIButton *button in _btnArray) {
        if (button.tag != btn.tag) {
            button.selected = NO;
        }
    }
}

#pragma mark tableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STCateDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[STCateDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    if (_allItems.count != 0)
//    {
//        STModelItem *item = [_allItems objectAtIndex:indexPath.row];
//        //        cell.textLabel.text = item.itemName;
//        [cell layoutWithItem:item];
//    }
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
