//
//  DGoodInfo.h
//  易兔
//
//  Created by 李鑫 on 15/4/15.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdColumn.h"
#import "Post.h"

@protocol detailInfo <NSObject>

-(void)post:(Post*)detail;

@end



#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define StatusBarHeight (IOS7==YES ? 0 : 20)
#define BackHeight      (IOS7==YES ? 0 : 15)

#define fNavBarHeigth (IOS7==YES ? 64 : 44)

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height-StatusBarHeight)

@interface DGoodInfo : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{

    AdColumn *_headerView;



}

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong) Post *post;

@property (nonatomic,strong) NSMutableArray *posts;

@property (nonatomic,strong) UIAlertView *alert;

@property (nonatomic,retain)id<detailInfo>delegate;



-(void)reloadData;




@end
