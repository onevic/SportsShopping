//
//  STMyFavouriteCell.h
//  SportsShopping
//
//  Created by one_vic on 13-11-22.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMyFavouriteCell : UITableViewCell {
    UIImageView *_cover1;
    UIImageView *_cover2;
}

@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UILabel *priceLabel1;
@property (strong, nonatomic) UILabel *priceLabel2;

@end
