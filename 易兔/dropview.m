//
//  dropview.m
//  Air
//
//  Created by 李鑫 on 14-12-20.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import "dropview.h"


@implementation dropview


-(void)deg:(NSString *)deg
{
    int degone=[deg intValue];
    _deg=[NSString stringWithFormat:@"%d",degone];
    _speedplace=[[NSMutableString alloc]init];
    [_speedplace  appendString:_deg];
    [_speedplace appendString:@"º"];
    
}

-(void)humidity:(NSString *)humidity
{

    _humidity=humidity;
    _humidityone=[[NSMutableString alloc]init];
    [_humidityone appendString:_humidity];
    [_humidityone appendString:@"%"];
    
   
}

-(void)windspeed:(NSString *)wendspeed

{
    float a=[wendspeed floatValue];
    _rwindspeed=[NSString stringWithFormat:@"%.f",a];
    _windspeedone=[[NSMutableString alloc]init];
    [_windspeedone appendString:_rwindspeed];
    [_windspeedone appendString:@"m/s"];
    
}


-(void)pastCondition:(NSString *)condition1
{
    
    
    NSDate*date = [NSDate date];
    
    NSCalendar*calendar = [NSCalendar currentCalendar];
    
    NSDateComponents*comps;
    
    comps =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond) fromDate:date];
    
    _hour= [comps hour];
    
    _condition=condition1;
    
    if ([_condition isEqualToString:@"Mist"]&&_hour>=6&&_hour<18)
        
{
    NSArray *dataArray = @[@{@"image":@"海拔白.png",@"title":@"●′ω`●"},
                           @{@"image":@"风速白.png",@"title":_windspeedone},
                           @{@"image":@"风向白.png",@"title":_speedplace},
                           @{@"image":@"水分白.png",@"title":_humidityone},
                           @{@"image":@"空气质量白.png",@"title":@"Medi"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < dataArray.count; i++)
        {
            
        NSDictionary *dict = dataArray[i];
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
        [item setText:dict[@"title"]];
        [dropdownItems addObject:item];
         
        }
        

        
       self.dropDownMenu = [[IGLDropDownMenu alloc] init];
       UIImage *image=[UIImage imageNamed:@"windy.png"];
       self.dropDownMenu.menuIconImage=image;
       self.dropDownMenu.dropDownItems = dropdownItems;
       self.dropDownMenu.paddingLeft = 15;
       self.dropDownMenu.gutterY = 1;
       self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
       self.dropDownMenu.itemAnimationDelay = 0.1;
       [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
       [self.dropDownMenu reloadView];
    
       [self addSubview:self.dropDownMenu];
    
}
    
    
    else if ([_condition isEqualToString:@"Snow"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray = @[@{@"image":@"海拔白.png",@"title":@"●′ω`●"},
                               @{@"image":@"风速白.png",@"title":_windspeedone},
                               @{@"image":@"风向白.png",@"title":_speedplace},
                               @{@"image":@"水分白.png",@"title":_humidityone},
                               @{@"image":@"空气质量白.png",@"title":@"Medi"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"snow.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];

    }
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔白.png",@"title":@"≥ω≤"},
                              @{@"image":@"风速白.png",@"title":_windspeedone},
                              @{@"image":@"风向白.png",@"title":_speedplace},
                              @{@"image":@"水分白.png",@"title":_humidityone},
                              @{@"image":@"空气质量白.png",@"title":@"Good"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"sun.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    }
    
    else if ([_condition isEqualToString:@"Cluods"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔白.png",@"title":@"≥ω≤"},
                              @{@"image":@"风速白.png",@"title":_windspeedone},
                              @{@"image":@"风向白.png",@"title":_speedplace},
                              @{@"image":@"水分白.png",@"title":_humidityone},
                              @{@"image":@"空气质量白.png",@"title":@"Good"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"clouds.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    }
    
    else if ([_condition isEqualToString:@"Rain"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔白.png",@"title":@"●′ω`●"},
                              @{@"image":@"风速白.png",@"title":_windspeedone},
                              @{@"image":@"风向白.png",@"title":_speedplace},
                              @{@"image":@"水分白.png",@"title":_humidityone},
                              @{@"image":@"空气质量白.png",@"title":@"Medi"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"rain.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    
    
    }
      else if ([_condition isEqualToString:@"Mist"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray = @[@{@"image":@"海拔白.png",@"title":@"●′ω`●"},
                               @{@"image":@"风速白.png",@"title":_windspeedone},
                               @{@"image":@"风向白.png",@"title":_speedplace},
                               @{@"image":@"水分白.png",@"title":_humidityone},
                               @{@"image":@"空气质量白.png",@"title":@"Medi"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"windy.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
        
    }
    
    
    else if ([_condition isEqualToString:@"Haze"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray = @[@{@"image":@"海拔白.png",@"title":@"＞﹏＜"},
                               @{@"image":@"风速白.png",@"title":_windspeedone},
                               @{@"image":@"风向白.png",@"title":_speedplace},
                               @{@"image":@"水分白.png",@"title":_humidityone},
                               @{@"image":@"空气质量白.png",@"title":@"Bad"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"windy.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    
    }
    
    else if ([_condition isEqualToString:@"Fog"]&&_hour>=6&&_hour<18)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔白.png",@"title":@"●′ω`●"},
                              @{@"image":@"风速白.png",@"title":_windspeedone},
                              @{@"image":@"风向白.png",@"title":_speedplace},
                              @{@"image":@"水分白.png",@"title":_humidityone},
                              @{@"image":@"空气质量白.png",@"title":@"Medi"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"windy.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    }
    
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour>=18&&_hour<=24)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"≥ω≤"},
                              @{@"image":@"风速.png",@"title":_windspeedone},
                              @{@"image":@"风向.png",@"title":_speedplace},
                              @{@"image":@"水分.png",@"title":_humidityone},
                              @{@"image":@"空气质量.png",@"title":@"Good"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"sun.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    }
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour==0)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"≥ω≤"},
                              @{@"image":@"风速.png",@"title":_windspeedone},
                              @{@"image":@"风向.png",@"title":_speedplace},
                              @{@"image":@"水分.png",@"title":_humidityone},
                              @{@"image":@"空气质量.png",@"title":@"Good"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"sun.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    }
    
    else if ([_condition isEqualToString:@"Clear"]&&_hour>0&&_hour<6)
        
    {
        NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"≥ω≤"},
                              @{@"image":@"风速.png",@"title":_windspeedone},
                              @{@"image":@"风向.png",@"title":_speedplace},
                              @{@"image":@"水分.png",@"title":_humidityone},
                              @{@"image":@"空气质量.png",@"title":@"Good"}];
        NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++)
        {
            NSDictionary *dict = dataArray[i];
            
            IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
            [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
            [item setText:dict[@"title"]];
            [dropdownItems addObject:item];
        }
        
        self.dropDownMenu = [[IGLDropDownMenu alloc] init];
        UIImage *image=[UIImage imageNamed:@"sun.png"];
        self.dropDownMenu.menuIconImage=image;
        self.dropDownMenu.dropDownItems = dropdownItems;
        self.dropDownMenu.paddingLeft = 15;
        self.dropDownMenu.gutterY = 1;
        self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
        self.dropDownMenu.itemAnimationDelay = 0.1;
        [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
        [self.dropDownMenu reloadView];
        
        [self addSubview:self.dropDownMenu];
    }
    
        else if ([_condition isEqualToString:@"Mist"]&&_hour>=18&&_hour<=24)
            
        {
            NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                   @{@"image":@"风速.png",@"title":_windspeedone},
                                   @{@"image":@"风向.png",@"title":_speedplace},
                                   @{@"image":@"水分.png",@"title":_humidityone},
                                   @{@"image":@"空气质量.png",@"title":@"Medi"}];
            NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
            for (int i = 0; i < dataArray.count; i++)
            {
                NSDictionary *dict = dataArray[i];
                IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                [item setText:dict[@"title"]];
                [dropdownItems addObject:item];
            }
            
            self.dropDownMenu = [[IGLDropDownMenu alloc] init];
            UIImage *image=[UIImage imageNamed:@"windy.png"];
            self.dropDownMenu.menuIconImage=image;
            self.dropDownMenu.dropDownItems = dropdownItems;
            self.dropDownMenu.paddingLeft = 15;
            self.dropDownMenu.gutterY = 1;
            self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
            self.dropDownMenu.itemAnimationDelay = 0.1;
            [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
            [self.dropDownMenu reloadView];
            
            [self addSubview:self.dropDownMenu];
        }
    
        else if ([_condition isEqualToString:@"Mist"]&&_hour==0)
        {
            NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                  @{@"image":@"风速.png",@"title":_windspeedone},
                                  @{@"image":@"风向.png",@"title":_speedplace},
                                  @{@"image":@"水分.png",@"title":_humidityone},
                                  @{@"image":@"空气质量.png",@"title":@"Medi"}];
            NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
            for (int i = 0; i < dataArray.count; i++)
            {
                NSDictionary *dict = dataArray[i];
                IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                [item setText:dict[@"title"]];
                [dropdownItems addObject:item];
            }
            
            self.dropDownMenu = [[IGLDropDownMenu alloc] init];
            UIImage *image=[UIImage imageNamed:@"windy.png"];
            self.dropDownMenu.menuIconImage=image;
            self.dropDownMenu.dropDownItems = dropdownItems;
            self.dropDownMenu.paddingLeft = 15;
            self.dropDownMenu.gutterY = 1;
            self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
            self.dropDownMenu.itemAnimationDelay = 0.1;
            [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
            [self.dropDownMenu reloadView];
            
            [self addSubview:self.dropDownMenu];
        }
    
        else if ([_condition isEqualToString:@"Mist"]&&_hour>0&&_hour<6)
            
        {
            NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                   @{@"image":@"风速.png",@"title":_windspeedone},
                                   @{@"image":@"风向.png",@"title":_speedplace},
                                   @{@"image":@"水分.png",@"title":_humidityone},
                                   @{@"image":@"空气质量.png",@"title":@"Medi"}];
            NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
            for (int i = 0; i < dataArray.count; i++)
            {
                NSDictionary *dict = dataArray[i];
                
                IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                [item setText:dict[@"title"]];
                [dropdownItems addObject:item];
            }
            
            self.dropDownMenu = [[IGLDropDownMenu alloc] init];
            UIImage *image=[UIImage imageNamed:@"windy.png"];
            self.dropDownMenu.menuIconImage=image;
            self.dropDownMenu.dropDownItems = dropdownItems;
            self.dropDownMenu.paddingLeft = 15;
            self.dropDownMenu.gutterY = 1;
            self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
            self.dropDownMenu.itemAnimationDelay = 0.1;
            [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
            [self.dropDownMenu reloadView];
            
            [self addSubview:self.dropDownMenu];
        }
    
            else if ([_condition isEqualToString:@"Snow"]&&_hour>=18&&_hour<=24)
                
            {
                NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                      @{@"image":@"风速.png",@"title":_windspeedone},
                                      @{@"image":@"风向.png",@"title":_speedplace},
                                      @{@"image":@"水分.png",@"title":_humidityone},
                                      @{@"image":@"空气质量.png",@"title":@"Medi"}];
                NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                for (int i = 0; i < dataArray.count; i++) {
                    NSDictionary *dict = dataArray[i];
                    
                    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                    [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                    [item setText:dict[@"title"]];
                    [dropdownItems addObject:item];
                }
                
                self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                UIImage *image=[UIImage imageNamed:@"snow.png"];
                self.dropDownMenu.menuIconImage=image;
                self.dropDownMenu.dropDownItems = dropdownItems;
                self.dropDownMenu.paddingLeft = 15;
                self.dropDownMenu.gutterY = 1;
                self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                self.dropDownMenu.itemAnimationDelay = 0.1;
                [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                [self.dropDownMenu reloadView];
                
                [self addSubview:self.dropDownMenu];
            }
            else if ([_condition isEqualToString:@"Snow"]&&_hour==0)
            {
                NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                       @{@"image":@"风速.png",@"title":_windspeedone},
                                       @{@"image":@"风向.png",@"title":_speedplace},
                                       @{@"image":@"水分.png",@"title":_humidityone},
                                       @{@"image":@"空气质量.png",@"title":@"Medi"}];
                NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                for (int i = 0; i < dataArray.count; i++)
                {
                    NSDictionary *dict = dataArray[i];
                    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                    [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                    [item setText:dict[@"title"]];
                    [dropdownItems addObject:item];
                }
                
                self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                UIImage *image=[UIImage imageNamed:@"snow.png"];
                self.dropDownMenu.menuIconImage=image;
                self.dropDownMenu.dropDownItems = dropdownItems;
                self.dropDownMenu.paddingLeft = 15;
                self.dropDownMenu.gutterY = 1;
                self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                self.dropDownMenu.itemAnimationDelay = 0.1;
                [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                [self.dropDownMenu reloadView];
                
                [self addSubview:self.dropDownMenu];
            }
    
            else if ([_condition isEqualToString:@"Snow"]&&_hour>0&&_hour<6)
                
            {
                NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                      @{@"image":@"风速.png",@"title":_windspeedone},
                                      @{@"image":@"风向.png",@"title":_speedplace},
                                      @{@"image":@"水分.png",@"title":_humidityone},
                                      @{@"image":@"空气质量.png",@"title":@"Medi"}];
                NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                for (int i = 0; i < dataArray.count; i++)
                {
                    NSDictionary *dict = dataArray[i];
                    
                    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                    [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                    [item setText:dict[@"title"]];
                    [dropdownItems addObject:item];
                }
                
                self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                UIImage *image=[UIImage imageNamed:@"snow.png"];
                self.dropDownMenu.menuIconImage=image;
                self.dropDownMenu.dropDownItems = dropdownItems;
                self.dropDownMenu.paddingLeft = 15;
                self.dropDownMenu.gutterY = 1;
                self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                self.dropDownMenu.itemAnimationDelay = 0.1;
                [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                [self.dropDownMenu reloadView];
                [self addSubview:self.dropDownMenu];
            }
    
            else if ([_condition isEqualToString:@"Clouds"]&&_hour>=18&&_hour<=24)
                
                {
                    NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                           @{@"image":@"风速.png",@"title":_windspeedone},
                                           @{@"image":@"风向.png",@"title":_speedplace},
                                           @{@"image":@"水分.png",@"title":_humidityone},
                                           @{@"image":@"空气质量.png",@"title":@"Medi"}];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++) {
                        NSDictionary *dict = dataArray[i];
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"clouds.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    [self addSubview:self.dropDownMenu];
                }
    
            else if ([_condition isEqualToString:@"Clouds"]&&_hour==0)
                
            {
                NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                      @{@"image":@"风速.png",@"title":_windspeedone},
                                      @{@"image":@"风速.png",@"title":_speedplace},
                                      @{@"image":@"水分.png",@"title":_humidityone},
                                      @{@"image":@"空气质量.png",@"title":@"Medi"}];
                NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                for (int i = 0; i < dataArray.count; i++)
                {
                    NSDictionary *dict = dataArray[i];
                    
                    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                    [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                    [item setText:dict[@"title"]];
                    [dropdownItems addObject:item];
                }
                
                self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                UIImage *image=[UIImage imageNamed:@"clouds.png"];
                self.dropDownMenu.menuIconImage=image;
                self.dropDownMenu.dropDownItems = dropdownItems;
                self.dropDownMenu.paddingLeft = 15;
                self.dropDownMenu.gutterY = 1;
                self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                self.dropDownMenu.itemAnimationDelay = 0.1;
                [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                [self.dropDownMenu reloadView];
                [self addSubview:self.dropDownMenu];
            }
    
            else if ([_condition isEqualToString:@"Clouds"]&&_hour>0&&_hour<6)
                
            {
                NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                      @{@"image":@"风速.png",@"title":_windspeedone},
                                      @{@"image":@"风向.png",@"title":_speedplace},
                                      @{@"image":@"水分.png",@"title":_humidityone},
                                      @{@"image":@"空气质量.png",@"title":@"Medi"}];
                NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                for (int i = 0; i < dataArray.count; i++)
                {
                    NSDictionary *dict = dataArray[i];
                    
                    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                    [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                    [item setText:dict[@"title"]];
                    [dropdownItems addObject:item];
                }
                
                self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                UIImage *image=[UIImage imageNamed:@"clouds.png"];
                self.dropDownMenu.menuIconImage=image;
                self.dropDownMenu.dropDownItems = dropdownItems;
                self.dropDownMenu.paddingLeft = 15;
                self.dropDownMenu.gutterY = 1;
                self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                self.dropDownMenu.itemAnimationDelay = 0.1;
                [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                [self.dropDownMenu reloadView];
                
                [self addSubview:self.dropDownMenu];
            }
    
            else if ([_condition isEqualToString:@"Clouds"]&&_hour>=6&&_hour<18)
                
            {
                NSArray *dataArray =@[@{@"image":@"海拔白.png",@"title":@"●′ω`●"},
                                      @{@"image":@"风速白.png",@"title":_windspeedone},
                                      @{@"image":@"风向白.png",@"title":_speedplace},
                                      @{@"image":@"水分白.png",@"title":_humidityone},
                                      @{@"image":@"空气质量白.png",@"title":@"Medi"}];
                NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                for (int i = 0; i < dataArray.count; i++)
                {
                    NSDictionary *dict = dataArray[i];
                    
                    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                    [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                    [item setText:dict[@"title"]];
                    [dropdownItems addObject:item];
                }
                
                self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                UIImage *image=[UIImage imageNamed:@"clouds.png"];
                self.dropDownMenu.menuIconImage=image;
                self.dropDownMenu.dropDownItems = dropdownItems;
                self.dropDownMenu.paddingLeft = 15;
                self.dropDownMenu.gutterY = 1;
                self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                self.dropDownMenu.itemAnimationDelay = 0.1;
                [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                [self.dropDownMenu reloadView];
                
                [self addSubview:self.dropDownMenu];
            }
    
               else if ([_condition isEqualToString:@"Rain"]&&_hour>=18&&_hour<=24)
                   
                {
                    NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                          @{@"image":@"风速.png",@"title":_windspeedone},
                                          @{@"image":@"风向.png",@"title":_speedplace},
                                          @{@"image":@"水分.png",@"title":_humidityone},
                                          @{@"image":@"空气质量.png",@"title":@"Medi"}];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"rain.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    [self addSubview:self.dropDownMenu];
                }
    
               else if ([_condition isEqualToString:@"Rain"]&&_hour==0)
                   
               {
                   NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                         @{@"image":@"风速.png",@"title":_windspeedone},
                                         @{@"image":@"风向.png",@"title":_speedplace},
                                         @{@"image":@"水分.png",@"title":_humidityone},
                                         @{@"image":@"空气质量.png",@"title":@"Medi"}];
                   NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                   for (int i = 0; i < dataArray.count; i++)
                   {
                       NSDictionary *dict = dataArray[i];
                       
                       IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                       [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                       [item setText:dict[@"title"]];
                       [dropdownItems addObject:item];
                   }
                   
                   self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                   UIImage *image=[UIImage imageNamed:@"rain.png"];
                   self.dropDownMenu.menuIconImage=image;
                   self.dropDownMenu.dropDownItems = dropdownItems;
                   self.dropDownMenu.paddingLeft = 15;
                   self.dropDownMenu.gutterY = 1;
                   self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                   self.dropDownMenu.itemAnimationDelay = 0.1;
                   [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                   [self.dropDownMenu reloadView];
                   [self addSubview:self.dropDownMenu];
               }
    
               else if ([_condition isEqualToString:@"Rain"]&&_hour>0&&_hour<6)
                   
               {
                   NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                         @{@"image":@"风速.png",@"title":_windspeedone},
                                         @{@"image":@"风向.png",@"title":_speedplace},
                                         @{@"image":@"水分.png",@"title":_humidityone},
                                         @{@"image":@"空气质量.png",@"title":@"Medi"}];
                   NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                   for (int i = 0; i < dataArray.count; i++) {
                       NSDictionary *dict = dataArray[i];
                       IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                       [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                       [item setText:dict[@"title"]];
                       [dropdownItems addObject:item];
                   }
                   
                   self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                   UIImage *image=[UIImage imageNamed:@"rain.png"];
                   self.dropDownMenu.menuIconImage=image;
                   self.dropDownMenu.dropDownItems = dropdownItems;
                   self.dropDownMenu.paddingLeft = 15;
                   self.dropDownMenu.gutterY = 1;
                   self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                   self.dropDownMenu.itemAnimationDelay = 0.1;
                   [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                   [self.dropDownMenu reloadView];
                   
                   [self addSubview:self.dropDownMenu];
               }
    
                else if ([_condition isEqualToString:@"Haze"]&&_hour>=18&&_hour<=24)
                    
                {
                    NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"＞﹏＜"},
                                          @{@"image":@"风速.png",@"title":_windspeedone},
                                          @{@"image":@"风向.png",@"title":_speedplace},
                                          @{@"image":@"水分.png",@"title":_humidityone},
                                          @{@"image":@"空气质量.png",@"title":@"Bad"}                                         ];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        item.textLabel.textColor=[UIColor yellowColor];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"windy.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    
                    [self addSubview:self.dropDownMenu];
                }
    
                else if ([_condition isEqualToString:@"Haze"]&&_hour==0)
                    
                {
                    NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"＞﹏＜"},
                                           @{@"image":@"风速.png",@"title":_windspeedone},
                                           @{@"image":@"风向.png",@"title":_speedplace},
                                           @{@"image":@"水分.png",@"title":_humidityone},
                                           @{@"image":@"空气质量.png",@"title":@"Bad"}];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"windy.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    
                    [self addSubview:self.dropDownMenu];
                }
    
                else if ([_condition isEqualToString:@"Haze"]&&_hour>0&&_hour<6)
                    
                {
                    NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"＞﹏＜"},
                                           @{@"image":@"风速.png",@"title":_windspeedone},
                                           @{@"image":@"风向.png",@"title":_speedplace},
                                           @{@"image":@"水分.png",@"title":_humidityone},
                                           @{@"image":@"空气质量.png",@"title":@"Bad"}];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"windy.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    [self addSubview:self.dropDownMenu];
                }
    
    
                else if ([_condition isEqualToString:@"Fog"]&&_hour>=18&&_hour<=24)
                    
                {
                    NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                           @{@"image":@"风速.png",@"title":_windspeedone},
                                           @{@"image":@"风向.png",@"title":_speedplace},
                                           @{@"image":@"水分.png",@"title":_humidityone},
                                           @{@"image":@"空气质量.png",@"title":@"Medi"}];                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"windy.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    [self addSubview:self.dropDownMenu];
                }
    
                else if ([_condition isEqualToString:@"Fog"]&&_hour==0)
                    
                {
                    NSArray *dataArray =@[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                          @{@"image":@"风速.png",@"title":_windspeedone},
                                          @{@"image":@"风向.png",@"title":_speedplace},
                                          @{@"image":@"水分.png",@"title":_humidityone},
                                          @{@"image":@"空气质量.png",@"title":@"Medi"}];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"windy.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    
                    [self addSubview:self.dropDownMenu];
                }
    
                else if ([_condition isEqualToString:@"Fog"]&&_hour>0&&_hour<6)
                    
                {
                    NSArray *dataArray = @[@{@"image":@"海拔.png",@"title":@"●′ω`●"},
                                           @{@"image":@"风速.png",@"title":_windspeedone},
                                           @{@"image":@"风向.png",@"title":_speedplace},
                                           @{@"image":@"水分.png",@"title":_humidityone},
                                           @{@"image":@"空气质量.png",@"title":@"Medi"}];
                    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
                    for (int i = 0; i < dataArray.count; i++)
                    {
                        NSDictionary *dict = dataArray[i];
                        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
                        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
                        [item setText:dict[@"title"]];
                        [dropdownItems addObject:item];
                    }
                    
                    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
                    UIImage *image=[UIImage imageNamed:@"windy.png"];
                    self.dropDownMenu.menuIconImage=image;
                    self.dropDownMenu.dropDownItems = dropdownItems;
                    self.dropDownMenu.paddingLeft = 15;
                    self.dropDownMenu.gutterY = 1;
                    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
                    self.dropDownMenu.itemAnimationDelay = 0.1;
                    [self.dropDownMenu setFrame:CGRectMake(15, 5, 110, 35)];
                    [self.dropDownMenu reloadView];
                    
                    [self addSubview:self.dropDownMenu];
                }
    
    
    

}

-(instancetype)initWithFrame:(CGRect)frame
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hidden) name:@"hidden" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(show) name:@"show" object:nil];
    
    self=[super initWithFrame:frame];
    
    return self;
    
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    
}

-(void)hidden
{
    self.dropDownMenu.hidden=YES;

}
-(void)show
{
    self.dropDownMenu.hidden=NO;

}

@end
