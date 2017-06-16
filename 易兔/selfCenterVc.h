//
//  selfCenterVc.h
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelfViewC.h"



@interface selfCenterVc :SelfViewC

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong)NSDictionary *cellDic;

@property (nonatomic,strong)UIImageView *headerImage;

@property (nonatomic,strong)UILabel *namelabel;

@property (nonatomic,strong)UILabel *schoolLabel;

@property BOOL save1;



@end
