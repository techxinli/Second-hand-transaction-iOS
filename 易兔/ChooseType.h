//
//  ChooseType.h
//  易兔
//
//  Created by 李鑫 on 15/4/15.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseType : UIView<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong)UIView *darkView;

@property (nonatomic,strong)UILabel *detailtextLabel;

@property (nonatomic,strong)UILabel *textLabel;

@property (nonatomic,strong)UIButton *clickButton;

@property (nonatomic) NSInteger totalNum;







-(void)setArray:(NSArray *)showArray;



@end
