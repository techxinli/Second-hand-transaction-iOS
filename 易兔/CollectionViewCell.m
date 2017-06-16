//
//  CollectionViewCell.m
//  UICollectionView
//
//  Created by 李鑫 on 15/4/7.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "Post.h"




@interface CollectionViewCell()
{
    
  

}

@end

@implementation CollectionViewCell



-(id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self)
    {
        
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 250)];

        [self addSubview:_mainView];
        self.backgroundColor = [UIColor whiteColor];
        self.goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame)-20,150)];
        self.goodImageView.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        self.goodImageView.layer.cornerRadius = 6;
        self.goodImageView.clipsToBounds = YES;
        [self.goodImageView setImageWithURL:_post.picUrl];
        //self.goodImageView.backgroundColor = [UIColor redColor];
        [self.mainView addSubview:self.goodImageView];
        
//        self.underlineView = [[UIImageView alloc] initWithFrame:CGRectMake(0,self.goodImageView.frame.origin.y, CGRectGetWidth(self.goodImageView.frame), 1)];
//        self.underlineView.image = [UIImage imageNamed:@"login_bt_back"];
//        [self.goodImageView addSubview:self.underlineView];
//        
        
        
        self.view = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.goodImageView.frame), CGRectGetWidth(self.frame), 100)];
        self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        [self.mainView addSubview:self.view];
        
        _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-35, CGRectGetMaxY(_goodImageView.frame)-35, 70, 70)];
        _headerView.layer.cornerRadius = _headerView.frame.size.width/2;
        _headerView.clipsToBounds = YES;
        _headerView.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1].CGColor;
        _headerView.layer.borderWidth = 1;
        
        [self.mainView addSubview:_headerView];
        
        _timeLabel  = [[UILabel alloc]initWithFrame:CGRectMake(_headerView.frame.origin.x+80, CGRectGetMaxY(_goodImageView.frame)+15, 100, 30)];
        _timeLabel.font = [UIFont fontWithName:@"Heiti SC" size:15];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.mainView addSubview:_timeLabel];
        
        

                                                                          
        
        
        self.labelView = [[UIImageView alloc]initWithFrame:CGRectMake(20,48,20, 20)];
        //self.labelView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.labelView];
        
        self.labelLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125,40,250,30)];
        self.labelLabel.adjustsFontSizeToFitWidth = YES;
        self.labelLabel.textAlignment = NSTextAlignmentCenter;
        self.labelLabel.font = [UIFont systemFontOfSize:20];
        self.labelLabel.textColor = [UIColor grayColor];
        [self.view  addSubview:self.labelLabel];
        
        self.locationView = [[UIImageView alloc]initWithFrame:CGRectMake(20,25, 20, 20)];
        _locationView.image = [UIImage imageNamed:@"详情"];
        [self.view addSubview:self.locationView];
//
//        self.locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 100, 20)];
//        self.locationLabel.adjustsFontSizeToFitWidth = YES;
//        self.locationLabel.textAlignment = NSTextAlignmentLeft;
//        self.locationLabel.textColor = [UIColor darkGrayColor];
//        self.locationLabel.font = [UIFont systemFontOfSize:10];
//        self.locationLabel.numberOfLines = 2;
//        [self.view addSubview:self.locationLabel];
        
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-30,CGRectGetMaxY(_labelLabel.frame), 60, 20)];
        self.priceLabel.adjustsFontSizeToFitWidth = YES;
        self.priceLabel.font = [UIFont fontWithName:@"Heiti SC" size:18];
        self.priceLabel.textColor = [UIColor grayColor];
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:self.priceLabel];
        
        self.priceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(_labelLabel.frame)-4, 20, 20)];
        _priceImageView.image = [UIImage imageNamed:@"价格"];
        [self.view addSubview:self.priceImageView];
        
        
//        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(260,25, 60, 20)];
//        self.timeLabel.adjustsFontSizeToFitWidth = YES;
//        self.timeLabel.textAlignment = NSTextAlignmentLeft;
//        self.timeLabel.font = [UIFont fontWithName:@"Heiti SC" size:10];
//        self.timeLabel.textColor = [UIColor darkGrayColor];
//        [self.view addSubview:self.timeLabel];
//        
//        self.timeView = [[UIImageView alloc]initWithFrame:CGRectMake(240,25,20, 20)];
//        [self.view addSubview:self.timeView];
//        
//        self.underlineview1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame), CGRectGetWidth(self.frame), 1)];
//        [self.view addSubview:self.underlineview1];
        
        
        
        
    }
    
    return self;


}



//-(void)setPost:(Post *)post
//{
//    _post = post;
//    [self.goodImageView setImageWithURL:_post.picUrl placeholderImage:[UIImage imageNamed:@"profile-image-placehoder"]];
//    [self setNeedsLayout];
//    
//}

@end
