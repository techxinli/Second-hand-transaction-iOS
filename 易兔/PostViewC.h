//
//  PostViewC.h
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewC : UIViewController<UIAlertViewDelegate>

@property (nonatomic,strong) UIButton *PostButton;

@property BOOL conClick;

@property (nonatomic,strong)UIAlertView *alert;

@property BOOL isUse;



@end
