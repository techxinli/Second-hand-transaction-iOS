//
//  AdColumn.h
//  CollectionView
//
//  Created by 李鑫 on 15/4/6.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdColumn : UIView<UIScrollViewDelegate>
{

    NSTimer *_timer;

}

//广告栏
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageController;

@property (nonatomic, strong) UILabel *imageNum;

@property (nonatomic) NSInteger totalNum;

-(void)setArray:(NSArray *)imageArray;

-(void)openTimer;

-(void)closeTimer;


@end
