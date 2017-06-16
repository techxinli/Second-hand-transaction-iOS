//
//  AppStatus.m
//  易兔
//
//  Created by 李鑫 on 15/4/17.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "AppStatus.h"

static AppStatus *_instance = nil;

@implementation AppStatus

@synthesize UserInfo = _UserInfo;


+(AppStatus*)shareInstance
{

    if (_instance == nil)
    {
        _instance = [[super alloc]init];
        
    }
    return _instance;


}

-(id)init
{
    if (self = [super init])
    {
        
        
        
    }
    
    return self;



}



@end
