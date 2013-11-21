//
//  STBaseViewController.m
//  自动滚动
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STBaseViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kNavigationBarHeight 44
#define kAnimateDuration 0.5

@interface STBaseViewController ()

@end

@implementation STBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*自定义的导航栏*/
    self.navigationController.navigationBarHidden = YES;
    
    _myNavigationBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
    [self.view addSubview:_myNavigationBar];
    _myNavigationBar.image = [UIImage imageNamed:@"购物车2_02.png"];
    _myNavigationBar.hidden = YES;
    _myNavigationBar.userInteractionEnabled = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7 && _isAdjusted == NO)
    {
        _isAdjusted = YES;
        if (self.navigationController == nil || self.navigationController.navigationBarHidden || self.navigationController.navigationBar.hidden)
        {
            /*下移20*/
            for (UIView *view in self.view.subviews) {
                /*导航栏强制调整,这里只移动除了导航栏以外的子视图*/
                if (view == _myNavigationBar)
                    continue;
                CGRect frame = view.frame;
                CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y+20, frame.size.width, frame.size.height);
                view.frame = newframe;
            }
        }else {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    
    /*默认显示导航栏*/
    [self showMyNavigationBar:YES animate:NO];
}

#pragma mark - 事件响应

- (void)showMyNavigationBar:(BOOL)show animate:(BOOL)animate
{
    float systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if (show == !_myNavigationBar.hidden)
        return;
    if (show)
    {
        _myNavigationBar.hidden = NO;
        if (animate)
        {
            [UIView animateWithDuration:kAnimateDuration animations:^{
                if (systemVersion >= 7)
                {
                    _myNavigationBar.frame = CGRectMake(0, 20, kScreenWidth, kNavigationBarHeight);
                }else {
                    _myNavigationBar.frame = CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight);
                }
                /*所有下移44*/
                for (UIView *view in self.view.subviews) {
                    if (view == _myNavigationBar)
                        continue;
                    CGRect frame = view.frame;
                    CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y+kNavigationBarHeight, frame.size.width, frame.size.height);
                    view.frame = newframe;
                }
            }];
        }else {
            if (systemVersion >= 7)
            {
                _myNavigationBar.frame = CGRectMake(0, 20, kScreenWidth, kNavigationBarHeight);
            }else {
                _myNavigationBar.frame = CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight);
            }
            /*所有下移44*/
            for (UIView *view in self.view.subviews) {
                if (view == _myNavigationBar)
                    continue;
                CGRect frame = view.frame;
                CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y+kNavigationBarHeight, frame.size.width, frame.size.height);
                view.frame = newframe;
            }
        }
        
    }else {
        if (animate)
        {
            [UIView animateWithDuration:kAnimateDuration animations:^{
                _myNavigationBar.frame = CGRectMake(0, -kNavigationBarHeight, kScreenWidth, kNavigationBarHeight);
                /*所有上移44*/
                for (UIView *view in self.view.subviews) {
                    if (view == _myNavigationBar)
                        continue;
                    CGRect frame = view.frame;
                    CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y-kNavigationBarHeight, frame.size.width, frame.size.height);
                    view.frame = newframe;
                }
            } completion:^(BOOL finished) {
                _myNavigationBar.hidden = YES;
            }];
        }else {
            _myNavigationBar.frame = CGRectMake(0, -kNavigationBarHeight, kScreenWidth, kNavigationBarHeight);
            _myNavigationBar.hidden = YES;
            /*所有上移44*/
            for (UIView *view in self.view.subviews) {
                if (view == _myNavigationBar)
                    continue;
                CGRect frame = view.frame;
                CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y-kNavigationBarHeight, frame.size.width, frame.size.height);
                view.frame = newframe;
            }
        }
    }
}

- (void)setNavigationBarBackgroundImage:(UIImage *)image
{
    _myNavigationBar.image = image;
}

@end
