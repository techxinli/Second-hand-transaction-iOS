//
//  Post.m
//  CollectionView
//
//  Created by 李鑫 on 15/4/6.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//
#import "User.h"
#import "Post.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "MainViewC.h"
#import "ChooseType.h"


@interface Post ()

{



}

@end

@implementation Post







-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self)
    {
        
        NSLog(@"%@",dic);
        self.userName = [dic valueForKeyPath:@"username"];
        self.fname = [dic valueForKeyPath:@"fname"];
        self.picUrl = [NSURL URLWithString:[dic valueForKeyPath:@"picurl"]];
        self.mobPhone = [dic valueForKeyPath:@"mobphone"];
        NSLog(@"%@",self.mobPhone);
        self.content = [dic valueForKeyPath:@"content"];
        self.money = (NSUInteger) [[dic valueForKeyPath:@"jiage"] integerValue];
        self.title = [dic valueForKeyPath:@"title"];
        self.posttime = [dic valueForKeyPath:@"posttime"];
        self.picnum = (NSUInteger) [[dic valueForKeyPath:@"picnum"]integerValue];
        self.cityid = (NSUInteger) [dic valueForKeyPath:@"city_id"];
        self.touxiang = [NSURL URLWithString:[dic valueForKeyPath:@"touxiang"]];
        self.fid1 = [dic valueForKeyPath:@"fid"];
        self.did = [dic valueForKeyPath:@"id"];
        
       
    }
    
        
    return self;
   
}
- (void)infoPostsWithBlock:(void(^)(NSMutableArray *,NSError *))block
{

    NSDictionary *parameter;
    
    NSLog(@"%@",_DataUrl);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer =[AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *sxtimes = [NSString stringWithFormat:@"%ld",(long)_sxtimes];
    switch (_fid)
    {
                    
        case 341:
    
            parameter = @{@"fid":@"341",@"sxtimes":sxtimes};
            
            break;
            
        case 43:
            
            parameter = @{@"fid":@"43",@"sxtimes":sxtimes};
            
            break;
            
        case 30:
            
            parameter = @{@"fid":@"30",@"sxtimes":sxtimes};
            
            break;
            
        case 26:
            
            parameter = @{@"fid":@"26",@"sxtimes":sxtimes};
            
            break;
            
        case 173:
            
            parameter = @{@"fid":@"173",@"sxtimes":sxtimes};
            
            break;
            
        case 174:
            
            parameter = @{@"fid":@"174",@"sxtimes":sxtimes};
            
            break;
            
        case 178:
            
            parameter = @{@"fid":@"178",@"sxtimes":sxtimes};
            
            break;
            
        case 207:
            
            parameter = @{@"fid":@"207",@"sxtimes":sxtimes};
            
            break;
            
        case 208:
            
            parameter = @{@"fid":@"208",@"sxtimes":sxtimes};
            
            break;

        case 100:
            parameter = @{@"uid":_uid,@"sxtimes":sxtimes,@"did":_did,@"fid":_fid1,@"action":@"del"};
            
            break;
            
         case 0:
            
            parameter = @{@"fid":@"0",@"sxtimes":sxtimes};
            
            break;





                
                
            
        default:
            break;
    }
    
    __block NSMutableArray *mutablePost;
    [manager POST:[NSString stringWithFormat:@"%@",_DataUrl]
       parameters:parameter
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     
    {
        
        NSData *responseData = responseObject;
        NSDictionary * responseDic = [NSJSONSerialization JSONObjectWithData:responseData
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:nil];
        
        NSArray *postsFormResponse = [responseDic valueForKeyPath:@"data"];
        mutablePost = [NSMutableArray arrayWithCapacity:postsFormResponse.count];
        NSLog(@"%@",responseDic);
        
        for (NSDictionary *dic in postsFormResponse)
        {
            
            
            Post *post = [[Post alloc]initWithDic:dic];
            [mutablePost addObject:post];
          
            
        }
        
        if (block)
        {
            block([NSMutableArray arrayWithArray:mutablePost],nil);
            
        }
        
       
        
        
        
    
    }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
    
    
    {
        if (block)
        {
            block([NSMutableArray array],error);
            
        }
              
        
    
    }];
    
    
     



}


@end
