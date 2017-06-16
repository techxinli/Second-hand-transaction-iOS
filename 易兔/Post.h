//
//  Post.h
//  CollectionView
//
//  Created by 李鑫 on 15/4/6.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit+AFNetworking.h"
#import "MainViewC.h"

@class User;

@interface Post : NSObject


@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *fname; //类别

@property (nonatomic,copy) NSString* mobPhone;

@property (nonatomic,strong) NSURL *picUrl;

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,assign) NSUInteger money;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString* posttime;

@property (nonatomic,strong) NSMutableArray *mutablePosts;

@property (nonatomic,assign) NSUInteger picnum;

@property (nonatomic,assign) NSUInteger cityid;

@property (nonatomic,strong)NSString *DataUrl;

@property (nonatomic,strong)NSURL *touxiang;

@property (nonatomic,strong)NSString *uid;

@property (nonatomic,strong)NSString *did;

@property (nonatomic,strong)NSString *fid1;

@property (nonatomic)NSInteger  fid;

@property (nonatomic)NSInteger  sxtimes;

-(instancetype)initWithDic:(NSDictionary *)dic;

-(void)infoPostsWithBlock:(void(^)(NSMutableArray *,NSError *))block;


@end
