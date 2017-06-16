//
//  nextOfPostInfo.h
//  易兔
//
//  Created by 李鑫 on 15/4/12.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostInfo.h"




@interface nextOfPostInfo : UIViewController<postInfo>

@property (nonatomic,strong) UIButton *postButton;

@property (nonatomic,strong) UIView *headerView1;

@property (nonatomic,strong) UITextField *goodType;

@property (nonatomic,strong) UIButton *pickTypeButton;

@property (nonatomic,strong) UILabel *PlaceLabel;

@property (nonatomic,strong) UITextField *placeTextfield;

@property (nonatomic,strong) UIImageView *underline1;

@property (nonatomic,strong) UILabel *PhoneLabel;

@property (nonatomic,strong) UITextField *PhoneTextfield;

@property (nonatomic,strong) UIImageView *underline2;

@property (nonatomic,strong) NSArray *infoArray;

@property (nonatomic,strong) NSString *fid;


@property (nonatomic,strong) UIAlertView *alertview;







@end
