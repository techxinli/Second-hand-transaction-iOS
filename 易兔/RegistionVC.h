//
//  RegistionVC.h
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistionVC : UIViewController

@property (nonatomic,strong)UILabel *headerLabel;

@property (nonatomic,strong)UIView *userView;

@property (nonatomic,strong)UIView *passWordView;

@property (nonatomic,strong)UIView *configureView;

@property (nonatomic,strong)UIImageView *underline1;

@property (nonatomic,strong)UIImageView *underline2;

@property (nonatomic,strong)UIImageView *underline3;

@property (nonatomic,strong)UIImageView *underline4;

@property (nonatomic,strong)UIImageView *underline5;

@property (nonatomic,strong)UIImageView *userNameImage;

@property (nonatomic,strong)UIImageView *passWordImage;

@property (nonatomic,strong)UIImageView *ConfigureImage;

@property (nonatomic,strong)UITextField *userName;

@property (nonatomic,strong)UITextField *passWord;

@property (nonatomic,strong)UITextField *Configure;

@property (nonatomic,strong)UIButton *registionBtn;

@property (nonatomic,strong)UIAlertView *_alertView1;

@property (nonatomic,strong)UIAlertView *alert;

@property BOOL change;



@end
