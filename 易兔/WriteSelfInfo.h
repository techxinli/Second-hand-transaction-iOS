//
//  WriteSelfInfo.h
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteSelfInfo : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UIView *InfoView;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIImageView *headImage;

@property (nonatomic,strong) UIImageView *underline1;

@property (nonatomic,strong) UIImageView *underline2;

@property (nonatomic,strong) UIImageView *underline3;

@property (nonatomic,strong) UIImageView *underline4;

@property (nonatomic,strong) UIImageView *underline5;

@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UITextField *nameTextfield;

@property (nonatomic,strong) UILabel *sexLabel;

@property (nonatomic,strong) UISegmentedControl *sexSegment;

@property (nonatomic,strong) UILabel *schoolLabel;

@property (nonatomic,strong) UITextField *schoolTextfield;

@property (nonatomic,strong) UILabel *phoneNumber;

@property (nonatomic,strong) UITextField *phoneTextfield;

@property (nonatomic,strong) UIButton *schoolButton;

@property (nonatomic,strong) UIButton *sexButton;

@property (nonatomic,strong)UITextField *sexTextfield;

@property (nonatomic,strong)UIButton *chooseButton;


@property (nonatomic,strong) UILabel *nameCLabel;

@property (nonatomic,strong) UILabel *sexCLabel;

@property (nonatomic,strong) UILabel *phoneCLabel;

@property (nonatomic,strong) UILabel *schoolCLabel;

@property (nonatomic,strong) UIButton *nameCbutton;

@property (nonatomic,strong) UIButton *sexCbutton;

@property (nonatomic,strong) UIButton *phoneCbutton;

@property (nonatomic,strong) UIButton *schoolCbutton;

@property (nonatomic,strong) UIAlertView *alertview;



@property BOOL choose;

@property BOOL change1;

@property BOOL save;




@end
