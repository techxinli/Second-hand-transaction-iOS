//
//  LoginView.h
//  易兔
//
//  Created by 李鑫 on 15/4/10.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "selfCenterVc.h"


@interface profileView : UIViewController<UIAlertViewDelegate>

@property (nonatomic,strong)UIView *loginView;

@property (nonatomic,strong)UIView *registionView;

@property (nonatomic,strong)UIImageView *loginImage;

@property (nonatomic,strong)UIImageView *registionImage;

@property (nonatomic,strong)UILabel *loginLabel1;

@property (nonatomic,strong)UILabel *loginLabel2;

@property (nonatomic,strong)UILabel *registionLabel1;

@property (nonatomic,strong)UILabel *registionLabel2;

@property (nonatomic,strong)UIButton *loginButton;

@property (nonatomic,strong)UIButton *registionButton;

@property (nonatomic,strong)UIView *selfView;

@property (nonatomic,strong)UIImageView *selfImageView;

@property (nonatomic,strong)UILabel *selfLabel;

@property (nonatomic,strong)UIButton *selfButton;

@property (nonatomic,strong)UIView *FeedbackView;

@property (nonatomic,strong)UIImageView *FeedbackImage;

@property (nonatomic,strong)UILabel * FeedbackLabel;

@property (nonatomic,strong)UIButton *FeedbackButton;

@property (nonatomic,strong)selfCenterVc *selfVc;


@property (nonatomic,strong) UIAlertView *alertview;

@property (nonatomic,strong) UIAlertView *alertview1;

@property (nonatomic,strong) UIImageView *userImage;

@property (nonatomic,strong) UIImage *image;




@property BOOL ChangeView;

@property BOOL selfcenter;

@property BOOL save;





@end
