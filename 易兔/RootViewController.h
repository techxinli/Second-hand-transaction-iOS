//
//  RootViewController.h
//  Air
//
//  Created by 李鑫 on 14-12-15.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherview.h"
@interface RootViewController : UIViewController

@property weatherview *weather;

@property UIImageView *imageone;
@property UIImageView *imagetwo;
@property UIImageView *imagethree;
@property UIImageView *imagefour;
@property UIImageView *imagefive;
@property UIImageView *imagesix;
@property UIImageView *imageseven;
@property UIImageView *imageeight;

@property NSString *conditionone;
@property NSUInteger hour;

@property (nonatomic,strong) UIButton *backButton;
@end
