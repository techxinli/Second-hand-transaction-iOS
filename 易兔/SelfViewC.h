//
//  SelfViewC.h
//  易兔
//
//  Created by 李鑫 on 15/4/10.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat const kMGOffsetEffects;

@interface SelfViewC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *overView;
@property (nonatomic, strong) UIImageView *mainImageView;

- (instancetype)initWithMainImage:(UIImage *)image;

@end
