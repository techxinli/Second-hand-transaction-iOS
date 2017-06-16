//
//  LeeAlertView.m
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "LeeAlertView.h"

@implementation LeeAlertView


-(id)initWithFrame:(CGRect)frame
{

    self = [super init];
    
    if (self)
    {
        _title.frame =CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:_title];
        
    }
    
    return self;


}

-(void)AlertViewShow
{





}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
