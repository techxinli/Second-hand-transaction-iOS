//
//  PostInfo.h
//  易兔
//
//  Created by 李鑫 on 15/4/12.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol postInfo <NSObject>

-(void)postInfo:(NSArray *)postArray;

@end




@interface PostInfo : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>



@property (nonatomic,strong) UIView *InfoView;

@property (nonatomic,strong)UIButton *nextButton;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIButton *pickImage;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIImageView *underline1;

@property (nonatomic,strong) UITextField *titleTextfield;

@property (nonatomic,strong) UILabel *priceLabel;

@property (nonatomic,strong) UIImageView *underline2;

@property (nonatomic,strong)UITextField *priceTextfield;

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UIImageView *underline3;

@property (nonatomic,strong)UITextField *detailTextfield;

@property(nonatomic,strong)NSNumber *duration;


@property (nonatomic,retain) id<postInfo>delegate;











@end
