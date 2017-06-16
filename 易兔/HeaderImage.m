//
//  HeaderImage.m
//  易兔
//
//  Created by 李鑫 on 15/4/28.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "HeaderImage.h"

static HeaderImage *_instance = nil;

@implementation HeaderImage

@synthesize image = _image;

+(HeaderImage*)shareInstance
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
