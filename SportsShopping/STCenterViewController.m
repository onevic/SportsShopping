//
//  STCenterViewController.m
//  SportsShopping
//
//  Created by one_vic on 13-11-22.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STCenterViewController.h"
#import "STAppDelegate.h"
#import "DDMenuController.h"

#define kTaoBaoCenterInterface @"http://h5.m.taobao.com/my/index.htm?#!myTaobao"

@interface STCenterViewController ()

@end

@implementation STCenterViewController {
    UIWebView *_webView;
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
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 13, 80, 18)];
    titleLabel.text = @"个人中心";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor =[UIColor clearColor];
    [self.myNavigationBar addSubview:titleLabel];
    
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    [self.view addSubview:_webView];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",kTaoBaoCenterInterface]]];
    [_webView loadRequest:urlRequest];
}

#pragma mark - 事件响应
- (void)showMenu
{
    STAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.ddmenu showLeftController:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
