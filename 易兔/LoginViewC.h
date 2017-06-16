//
//  profileViewC.h
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol post <NSObject>

-(void)post:(NSDictionary*)dic;

@end



@interface LoginViewC : UIViewController

@property (nonatomic,strong) UIImageView * headerView;

@property (nonatomic,strong) UIView *loginView;

@property (nonatomic,strong) UIImageView *underline1;

@property (nonatomic,strong) UIImageView *underline2;

@property (nonatomic,strong) UIImageView *underline3;

@property (nonatomic,strong) UIImageView *underline4;

@property (nonatomic,strong) UIButton *loginButton;

@property (nonatomic,strong) UIImageView *userImage;

@property (nonatomic,strong) UIImageView *passWordImage;

@property (nonatomic,strong) UITextField *userName;

@property (nonatomic,strong) UITextField *passWord;

@property (nonatomic,strong) UIAlertView *alertView;

@property (nonatomic,strong)UILabel *Didload;

@property (nonatomic,strong)UIImage *image;

@property(nonatomic,strong)NSNumber *duration;

@property (nonatomic,strong)UIAlertView *alert;


@property BOOL LoginType;

-(void)postLogin;

@property (nonatomic,retain)id<post>delegate;







@end
