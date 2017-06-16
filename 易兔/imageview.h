//
//  imageview.h
//  Air
//
//  Created by 李鑫 on 14-12-16.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherview.h"

@interface imageview : UIView<sendValue>

@property NSUInteger hour;

@property UIImageView *imageview;

@property NSString *condition;

@end
