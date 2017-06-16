//
//  BezierView.m
//  易兔
//
//  Created by 李鑫 on 15/4/25.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect

{
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    UIColor *color = [UIColor whiteColor];
    [color set]; //设置线条颜色
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 20, 20, 20);
    button.layer.cornerRadius = button.frame.size.width/2;
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 3.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(0, 50)];
    
    [aPath addCurveToPoint:CGPointMake(320, 50) controlPoint1:CGPointMake(160, 0) controlPoint2:CGPointMake(180, 100)];
    
    [aPath stroke];
    
    
}


@end
