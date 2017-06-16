//
//  CollectionViewCell.h
//  UICollectionView
//
//  Created by 李鑫 on 15/4/7.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Post.h"
@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) Post *post;

@property (nonatomic,strong) UIView *mainView;

@property (nonatomic,strong) UIImageView *headerView;

@property (nonatomic,strong) UIImageView *goodImageView;

@property (nonatomic,strong) UIImageView *priceImageView;

@property (nonatomic,strong) UIImageView *labelView;

@property (nonatomic,strong) UIImageView *timeView;

@property (nonatomic,strong) UIImageView *locationView;

@property (nonatomic,strong) UIImageView *underlineView;

@property (nonatomic,strong) UIImageView *underlineview1;

@property (nonatomic,strong) UILabel *priceLabel;

@property (nonatomic,strong) UILabel *labelLabel;

@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UILabel *locationLabel;

@property (nonatomic,strong) UILabel *timelabel;


@property (nonatomic,strong) UIView *view;







@end
