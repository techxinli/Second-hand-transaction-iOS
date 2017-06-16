//
//  RootViewController.m
//  Air
//
//  Created by 李鑫 on 14-12-15.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import "RootViewController.h"
#import "weatherview.h"
#import "imageview.h"
#import "dropview.h"
#import "BezierView.h"


@interface RootViewController ()



@end

@implementation RootViewController



-(void)changetime
{
    NSDate*date = [NSDate date];
    
    NSCalendar*calendar = [NSCalendar currentCalendar];
    
    NSDateComponents*comps;
    
    comps =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond) fromDate:date];
    
    
    _hour= [comps hour];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 100)];
//    label.textColor = [UIColor whiteColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont fontWithName:@"Heiti SC" size:15];
//    label.text = @"Welcome to Etoo";
//    [self.view addSubview:label];
//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-200, 36, 36)];
//    image.image = [UIImage imageNamed:@"风速白"];
//    [self.view addSubview:image];
    
//    if (_hour>=18&&_hour<=24)
//    {
//        _imagefive = (UIImageView *)[[self.view subviews] objectAtIndex:0];
//        _imagefive.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [_imagefive setImage:[UIImage imageNamed:@"夜晚"]];
//    }
//    
//    else if (_hour==0)
//    {
//        _imagefive = (UIImageView *)[[self.view subviews] objectAtIndex:0];
//        _imagefive.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [_imagefive setImage:[UIImage imageNamed:@"夜晚"]];
//    }
//    else if (_hour>0&&_hour<6)
//    {
//        _imagefive = (UIImageView *)[[self.view subviews] objectAtIndex:0];
//        _imagefive.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [_imagefive setImage:[UIImage imageNamed:@"夜晚"]];
//    }
//    
//    else if (_hour>=6&&_hour<=9)
//    {
//        _imagesix=(UIImageView*)[[self.view subviews] objectAtIndex:0];
//        _imagesix.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [_imagesix setImage:[UIImage imageNamed:@"日出"]];
//    }
//    
//    else if (_hour>9&&_hour<16)
//    {
//        _imageseven=(UIImageView*)[[self.view subviews] objectAtIndex:0];
//        _imageseven.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [_imageseven setImage:[UIImage imageNamed:@"白天"]];
//    }
//    
//    else if(_hour>=16&&_hour<18)
//    {
//        
//        _imageeight=(UIImageView*)[[self.view subviews] objectAtIndex:0];
//        _imageeight.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [_imageeight setImage:[UIImage imageNamed:@"日落"]];
//    }
//    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changetime) name:@"time" object:nil];
    
    NSDate*date = [NSDate date];
    
    NSCalendar*calendar = [NSCalendar currentCalendar];
    
    NSDateComponents*comps;
    
    comps =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond) fromDate:date];

    
    _hour= [comps hour];
    
       
//    if (_hour>=18&&_hour<=24)
//    {
//        _imageone = [[UIImageView alloc] initWithFrame:self.view.frame];
//        _imageone.image = [UIImage imageNamed:@"夜晚"];
//        _imageone.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.view addSubview:_imageone];
//    }
//    
//    else if (_hour==0)
//    {
//       _imageone = [[UIImageView alloc] initWithFrame:self.view.frame];
//       _imageone.image = [UIImage imageNamed:@"夜晚"];
//       _imageone.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.view addSubview:_imageone];
//    }
//    else if (_hour>0&&_hour<6)
//    {
//        _imageone = [[UIImageView alloc] initWithFrame:self.view.frame];
//        _imageone.image = [UIImage imageNamed:@"夜晚"];
//        _imageone.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.view addSubview:_imageone];
//    }
//    
//    
//    else if (_hour>=6&&_hour<=9)
//    {
//        _imagetwo= [[UIImageView alloc] initWithFrame:self.view.frame];
//        _imagetwo.image = [UIImage imageNamed:@"日出"];
//        _imagetwo.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.view addSubview:_imagetwo];
//    }
//    
//    else if (_hour>9&&_hour<16)
//    {
//        _imagethree = [[UIImageView alloc] initWithFrame:self.view.frame];
//       _imagethree.image = [UIImage imageNamed:@"白天"];
//        _imagethree.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.view addSubview:_imagethree];
//    }
//    
//    else if(_hour>=16&&_hour<18)
//    {
//        _imagefour = [[UIImageView alloc] initWithFrame:self.view.frame];
//        _imagefour.image = [UIImage imageNamed:@"日落"];
//        _imagefour.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.view addSubview:_imagefour];
//    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)viewWillDisappear:(BOOL)animated
{
   [super viewWillDisappear:animated]
    ;
    NSNotification *hidden=[NSNotification notificationWithName:@"hidden" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:hidden];

    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;

}


- (void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    NSNotification *notification1=[NSNotification notificationWithName:@"location" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification1];
    
   
    
    
    NSNotification *time=[NSNotification notificationWithName:@"time" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:time];
    
    NSNotification *show=[NSNotification notificationWithName:@"show" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:show];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(10, 20, 30, 30);
    //_backButton.backgroundColor = [UIColor whiteColor];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_backButton setTitle:@"◁" forState:UIControlStateNormal];
    [self.view addSubview:_backButton];
    
    _weather= [[weatherview alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-90,self.view.frame.size.height/2-110, 180, 180)];
    _weather.canChangeTempType = YES;
    _weather.showsTempType = YES;
    
//    BezierView *view = [[BezierView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 100)];
//    view.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
//    [self.view addSubview:view];
    
    
    
    [self.view addSubview:_weather];
    
    
    
//    imageview *image=[[imageview alloc]initWithFrame:CGRectMake(15,70,110,110)];
//    self.weather.delegate=image;
//    [self.view addSubview:image];
    
//    dropview *dropview1=[[dropview alloc]initWithFrame:CGRectMake(5, 30, 110, 35)];
//    
//    self.weather.deledate2=dropview1;
//    self.weather.delegate5=dropview1;
//    self.weather.delegate6=dropview1;
//    self.weather.delegate3=dropview1;
//    
//    [self.view addSubview:dropview1];
    
    
}

-(void)back
{

    [self.navigationController popToRootViewControllerAnimated:YES];


}

    @end
