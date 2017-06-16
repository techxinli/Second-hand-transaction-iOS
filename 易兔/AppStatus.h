//
//  AppStatus.h
//  易兔
//
//  Created by 李鑫 on 15/4/17.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppStatus : NSObject
{

    NSDictionary *_UserInfo;

}
@property (nonatomic,retain) NSDictionary *UserInfo;

+(AppStatus *)shareInstance;

@end
