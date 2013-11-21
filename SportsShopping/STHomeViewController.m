//
//  STHomeViewController.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STHomeViewController.h"

@interface STHomeViewController ()

@end

@implementation STHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self createUI];
    [self addScrollView];
}

// 创建基础UI
- (void)createUI
{
    // 菜单按钮
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(20, 15, 18.5, 13);
    [menuBtn setImage:[UIImage imageNamed:@"购物车_06.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.myNavigationBar addSubview:menuBtn];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 13, 80, 18)];
    titleLabel.text = @"户外运动";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    [self.myNavigationBar addSubview:titleLabel];
}

// 显示菜单事件
- (void)showMenu
{
    
}

// 添加首页八个分类
- (void)addScrollView
{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    scrollView.contentSize = CGSizeMake(kScreenWidth, 25+126.5*2+274*2);
    [self.view addSubview:scrollView];
    scrollView.userInteractionEnabled = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 1;
    btn1.frame = CGRectMake(5, 5, 309, 126.5);
    [btn1 setImage:[UIImage imageNamed:@"首页_07.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 2;
    btn2.frame = CGRectMake(5, 10+126.5, 164, 274);
    [btn2 setImage:[UIImage imageNamed:@"首页_10.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.tag = 3;
    btn3.frame = CGRectMake(11+164, 10+126.5, 138, 134);
    [btn3 setImage:[UIImage imageNamed:@"首页_12.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.tag = 4;
    btn4.frame = CGRectMake(11+164, 15+126.5+134, 138, 134);
    [btn4 setImage:[UIImage imageNamed:@"首页_14.png"] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.tag = 5;
    btn5.frame = CGRectMake(5, 20+126.5+134*2, 309, 126.5);
    [btn5 setImage:[UIImage imageNamed:@"首页1_03.png"] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.tag = 6;
    btn6.frame = CGRectMake(5, 25+126.5*2+134*2, 164, 274);
    [btn6 setImage:[UIImage imageNamed:@"首页1_06.png"] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn6];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn7.tag = 7;
    btn7.frame = CGRectMake(11+164, 25+126.5*2+134*2, 138, 134);
    [btn7 setImage:[UIImage imageNamed:@"首页1_08.png"] forState:UIControlStateNormal];
    [btn7 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn7];
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn8.tag = 8;
    btn8.frame = CGRectMake(11+164, 30+126.5*2+134*3, 138, 134);
    [btn8 setImage:[UIImage imageNamed:@"首页1_10.png"] forState:UIControlStateNormal];
    [btn8 addTarget:self action:@selector(cateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn8];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
