//
//  STItemDetailViewController.m
//  SportsShopping
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STItemDetailViewController.h"

@interface STItemDetailViewController ()

@end

@implementation STItemDetailViewController {
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
    
    // 返回按钮
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(20, 13, 10, 18);
    [menuBtn setImage:[UIImage imageNamed:@"商品详情_03.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(backCateDetails) forControlEvents:UIControlEventTouchUpInside];
    [self.myNavigationBar addSubview:menuBtn];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 13, 80, 18)];
    titleLabel.text = @"商品详情";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    [self.myNavigationBar addSubview:titleLabel];
    
    if (_webView == Nil)
    {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
        [self.view addSubview:_webView];
        
//        NSURL *url = [NSURL URLWithString:_item.itemUrl];
//        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//        [_webView loadRequest:urlRequest];
    }
}

#pragma mark - 事件响应
- (void)backCateDetails
{
    
}

@end
