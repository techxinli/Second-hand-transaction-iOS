//
//  HeaderImage.h
//  易兔
//
//  Created by 李鑫 on 15/4/28.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HeaderImage : NSObject
{
    UIImage *_image;
  
}

@property (nonatomic,retain) UIImage *image;

+(HeaderImage *)shareInstance;

@end
