//
//  dropview.h
//  Air
//
//  Created by 李鑫 on 14-12-20.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherview.h"
#import "IGLDropDownMenu.h"





@interface dropview : UIView<pastValue,windspeed,deg,humidity>

@property(nonatomic,strong)IGLDropDownMenu *dropDownMenu;

@property(nonatomic,strong)NSString *condition;

@property(nonatomic,strong)NSString *rwindspeed;

@property(nonatomic,strong)NSString *humidity;

@property(nonatomic,strong)NSString *deg;

@property (nonatomic,strong)NSMutableString *humidityone;

@property(nonatomic,strong)NSMutableString *windspeedone;


@property(nonatomic,strong)NSMutableString *speedplace;





@property  NSUInteger hour;

@end
