//
//  imageview.m
//  Air
//
//  Created by 李鑫 on 14-12-16.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import "imageview.h"



@implementation imageview

#pragma mark --condition delegate

-(void)sendCondition:(NSString *)condition
{
    
    _condition=condition;
    
    NSDate*date = [NSDate date];
    
    NSCalendar*calendar = [NSCalendar currentCalendar];
    
    NSDateComponents*comps;
    
    comps =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond) fromDate:date];
    
    _hour= [comps hour];
    
    
    if ([_condition isEqualToString:@"Mist"]&&_hour>=6&&_hour<18)
    {
        
        UIImage *image1=[UIImage imageNamed:@"雾霾"];
        _imageview.image=image1;
        [self addSubview:_imageview];
        
    }
    else if ([_condition isEqualToString:@"Mist"]&&_hour>=18&&_hour<=24)
    {
        UIImage *image1=[UIImage imageNamed:@"雾霾1"];
        _imageview.image=image1;
        [self addSubview:_imageview];
        
    }
    
    
    else if ([_condition isEqualToString:@"Mist"]&&_hour==0)
    {
       
        UIImage *image1=[UIImage imageNamed:@"雾霾1"];
        _imageview.image=image1;
        [self addSubview:_imageview];
        
    }
    else if ([_condition isEqualToString:@"Mist"]&&_hour>0&&_hour<6)
    {
        UIImage *image1=[UIImage imageNamed:@"雾霾1"];
        _imageview.image=image1;
        [self addSubview:_imageview];
    
    }
    
    else if ([_condition isEqualToString:@"Haze"]&&_hour>=6&&_hour<18)
    {
        UIImage *image1=[UIImage imageNamed:@"雾"];
        _imageview.image=image1;
        [self addSubview:_imageview];
        
    }
    
    
    else if ([_condition isEqualToString:@"Haze"]&&_hour>=18&&_hour<=24)
    {
        UIImage *image1=[UIImage imageNamed:@"雾1"];
        _imageview.image=image1;
        [self addSubview:_imageview];
    
    }
    
    else if ([_condition isEqualToString:@"Haze"]&&_hour==0)
    {
        UIImage *image1=[UIImage imageNamed:@"雾1"];
        _imageview.image=image1;
        [self addSubview:_imageview];
        
    }
    else if ([_condition isEqualToString:@"Haze"]&&_hour>0&&_hour<6)
    {
        UIImage *image1=[UIImage imageNamed:@"雾1"];
        _imageview.image=image1;
        [self addSubview:_imageview];
        
    }
    
    else if ([_condition isEqualToString:@"Rain"]&&_hour==0)
    {
        NSLog(@"hello");
        UIImage *image2=[UIImage imageNamed:@"雨1"];
        _imageview.image=image2;
        [self addSubview:_imageview];
    
    }
    else if ([_condition isEqualToString:@"Rain"]&&_hour>0&&_hour<6)
    {
        NSLog(@"hello");
        UIImage *image2=[UIImage imageNamed:@"雨1"];
        _imageview.image=image2;
        [self addSubview:_imageview];
        
    }
    
    else if ([_condition isEqualToString:@"Rain"]&&_hour>=18&&_hour<=24)
    {
        
        UIImage *image2=[UIImage imageNamed:@"雨1"];
        _imageview.image=image2;
        [self addSubview:_imageview];
    
    }
    
    else if ([_condition isEqualToString:@"Rain"]&&_hour>=6&&_hour<18)
    {
        
        UIImage *image2=[UIImage imageNamed:@"雨"];
        _imageview.image=image2;
        [self addSubview:_imageview];
    
    }
    
    else if ([_condition isEqualToString:@"Clouds"]&&_hour==0)
    {
    
        UIImage *image3=[UIImage imageNamed:@"风1"];
        _imageview.image=image3;
        [self addSubview:_imageview];
    
    }
    else if ([_condition isEqualToString:@"Clouds"]&&_hour>0&&_hour<6)
    {
        
        UIImage *image3=[UIImage imageNamed:@"风1"];
        _imageview.image=image3;
        [self addSubview:_imageview];
        
    }
    else if ([_condition isEqualToString:@"Clouds"]&&_hour>=18&&_hour<=24)
    {
        
        UIImage *image3=[UIImage imageNamed:@"风1"];
        _imageview.image=image3;
        [self addSubview:_imageview];
    
    }
    else if ([_condition isEqualToString:@"Clouds"]&&_hour>=6&&_hour<18)
    {
        
        UIImage *image3=[UIImage imageNamed:@"风"];
        _imageview.image=image3;
        [self addSubview:_imageview];
    
    }
    
    else if ([_condition isEqualToString:@"Snow"])
    {
        UIImage *image4=[UIImage imageNamed:@"雪"];
        _imageview.image=image4;
        [self addSubview:_imageview];
    
    }
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour>=6&&_hour<18)
    {
        
        UIImage *image5=[UIImage imageNamed:@"晴"];
        _imageview.image=image5;
        [self addSubview:_imageview];
    }
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour>=18&&_hour<=24)
    {
        
        UIImage *image6=[UIImage imageNamed:@"阴"];
        _imageview.image=image6;
        [self addSubview:_imageview];
    }
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour==0)
    {
    
        UIImage *image6=[UIImage imageNamed:@"阴"];
        _imageview.image=image6;
        [self addSubview:_imageview];    }
    
    

   else if ([_condition isEqualToString:@"Clear"]&&_hour>0&&_hour<6)
   {
    
    UIImage *image6=[UIImage imageNamed:@"阴"];
    _imageview.image=image6;
    [self addSubview:_imageview];

    }
   else if ([_condition isEqualToString:@"Fog"]&&_hour>0&&_hour<6)
   {
       
       UIImage *image6=[UIImage imageNamed:@"雾1"];
       _imageview.image=image6;
       [self addSubview:_imageview];
       
   }
   else if ([_condition isEqualToString:@"Fog"]&&_hour==0)
   {
       
       UIImage *image6=[UIImage imageNamed:@"雾1"];
       _imageview.image=image6;
       [self addSubview:_imageview];
       
   }
   else if ([_condition isEqualToString:@"Fog"]&&_hour>=18&&_hour<=24)
   {
       
       UIImage *image6=[UIImage imageNamed:@"雾1"];
       _imageview.image=image6;
       [self addSubview:_imageview];
       
   }
   else if ([_condition isEqualToString:@"Fog"]&&_hour>=6&&_hour<18)
   {
       
       UIImage *image6=[UIImage imageNamed:@"雾"];
       _imageview.image=image6;
       [self addSubview:_imageview];
       
   }
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
     self=[super initWithFrame:frame];
    _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 110, 110)];
      return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}



@end
