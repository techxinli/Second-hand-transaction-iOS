//
//  GoodDetail.h
//  易兔
//
//  Created by 李鑫 on 15/4/18.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGoodInfo.h"

@interface GoodDetail : UIViewController<detailInfo,UIScrollViewDelegate>

@property (nonatomic,strong)UIView *headerView;

@property (nonatomic,strong)UIView *InfoView;

@property (nonatomic,strong)UIImageView *headerImage;

@property (nonatomic,strong)UIImageView *GoodImage;

@property (nonatomic,strong)UIImageView *phoneNumImage;

@property (nonatomic,strong)UILabel *phoneNumLabel;

@property (nonatomic,strong)UIImageView *schoolImage;

@property (nonatomic,strong)UILabel *schoolLabel;

@property (nonatomic,strong)UIImageView *detaiImage;

@property (nonatomic,strong)UILabel *detailLabel;

@property (nonatomic,strong)UITextView *detailText;

@property (nonatomic,strong)UIImageView *TypeImage;

@property (nonatomic,strong)UILabel *TypeLabel;

@property (nonatomic,strong)UIImageView *placeImage;

@property (nonatomic,strong)UILabel *placeLabel;

@property (nonatomic,strong)UIImageView *priceImage;

@property (nonatomic,strong)UILabel *priceLabel;

@property (nonatomic,strong)UIScrollView *scrollView;


@end
