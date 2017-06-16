//
//  weatherview.h
//  Air
//
//  Created by 李鑫 on 14-12-15.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


//结构体类型为非负整数
enum TempType: NSUInteger
{
    TempTypeCelcius  = 0,
    TempTypeFahrenheit
};

//协议
@protocol sendValue <NSObject>

-(void)sendCondition:(NSString *)condition;

@end

@protocol windspeed <NSObject>

-(void)windspeed:(NSString*)windspeed;
@end

@protocol deg <NSObject>

-(void)deg:(NSString *)deg;

@end
@protocol humidity <NSObject>

-(void)humidity:(NSString*)humidity;

@end

@protocol pastValue <NSObject>

-(void)pastCondition:(NSString *)condition1;
@end


@interface weatherview : UIView<CLLocationManagerDelegate>


@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *conditionsLabel;
@property (nonatomic, strong) UILabel *tempLabel;

@property(nonatomic,strong) NSString *windspeed;
@property(nonatomic,strong) NSString *sealevel;
@property(nonatomic,strong) NSString *windpalce;
@property(nonatomic,strong) NSString *humidity;
@property(nonatomic,strong) NSString *deg;

@property (nonatomic) enum TempType tempType;

@property (nonatomic) BOOL canChangeTempType;
@property (nonatomic) BOOL showsTempType;
@property (nonatomic) BOOL showsActivityIndicator;

@property NSDictionary *weatherDate;
@property UIAlertView *alert;

@property (nonatomic,assign) id <sendValue>delegate;
@property(nonatomic,assign) id <pastValue>delegate3;
@property(nonatomic,assign) id <windspeed>deledate2;
@property(nonatomic,assign) id <deg>delegate5;
@property(nonatomic,assign)id <humidity>delegate6;
@end
