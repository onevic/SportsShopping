//
//  STSearchResultCell.m
//  SportsShopping
//
//  Created by one_vic on 13-11-22.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "STSearchResultCell.h"

@implementation STSearchResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _mImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 80, 80)];
        [self.contentView addSubview:_mImageView];
        _mImageView.backgroundColor = [UIColor grayColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 20, 190, 45)];
        _titleLabel.textColor = [UIColor darkGrayColor];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 100-24, 80, 24)];
        [self.contentView addSubview:_priceLabel];
        _priceLabel.textColor = [UIColor redColor];
        
        // 结算按钮
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.frame = CGRectMake(320-60-45, 120-20-22, 55, 22);
        [_payBtn setBackgroundImage:[UIImage imageNamed:@"购物车_18.png"] forState:UIControlStateNormal];
        [_payBtn setTitle:@"去看看" forState:UIControlStateNormal];
        _payBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _payBtn.titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_payBtn];
        [_payBtn addTarget:self action:@selector(payClicked) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(320-20-9.5, 52.5, 9.5, 15)];
        leftImageView.image = [UIImage imageNamed:@"购物车_14.png"];
        [self.contentView addSubview:leftImageView];
        
        UIImageView *breakLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 119, 320, 1)];
        breakLine.image = [UIImage imageNamed:@"运动鞋1_46.png"];
        [self.contentView addSubview:breakLine];
    }
    return self;
}

#pragma mark - 事件响应
- (void)payClicked
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
