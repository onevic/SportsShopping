//
//  STBaseViewController.h
//  自动滚动
//
//  Created by scott on 13-11-21.
//  Copyright (c) 2013年 scott. All rights reserved.
//  适配iOS 7,各种随便自定义

#import <UIKit/UIKit.h>

@interface STBaseViewController : UIViewController
{
    /*保证iOS7只调整一次*/
    BOOL _isAdjusted;
    
    UIImageView *_myNavigationBar;
}
@property (nonatomic, strong) UIImageView *myNavigationBar;

/*这个方法只能放在viewWillAppear中*/
- (void)showMyNavigationBar:(BOOL)show animate:(BOOL)animate;
/*修改导航条背景*/
- (void)setNavigationBarBackgroundImage:(UIImage *)image;
@end
