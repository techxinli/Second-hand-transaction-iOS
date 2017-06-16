//
//  ChooseType.m
//  易兔
//
//  Created by 李鑫 on 15/4/15.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//


#import "ChooseType.h"




@implementation ChooseType
{

    NSArray *_array;

}



-(id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self)
        
    {

        NSString *path = [[NSBundle mainBundle]pathForResource:@"ChooseType" ofType:@"plist"];
        _array = [NSArray arrayWithContentsOfFile:path];
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
       // _scrollView.backgroundColor = [UIColor darkGrayColor];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        
    }
    
    return self;





}

-(void)setArray:(NSArray *)showArray
{
    _totalNum = [showArray count];
    NSLog(@"%ld",(long)_totalNum);
    
    
    
    NSLog(@"%f",_scrollView.contentSize.height);
    
//    _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_scrollView.frame)-5, CGRectGetWidth(self.frame), 1)];
//    _underline1.image = [UIImage imageNamed:@"login_bt_back"];
//    _underline1.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:182.0f/255.0f blue:193.0f/255.0f alpha:1];
//    [self addSubview:_underline1];

    if (_totalNum>0)
    {
        for (int i = 0; i<_totalNum; i++)
        {
            UIView *mainview = [[UIView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(_scrollView.frame)/3+10,0, CGRectGetWidth(_scrollView.frame)/3-20, CGRectGetHeight(_scrollView.frame))];
            mainview.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];

            [_scrollView addSubview:mainview];
            
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(mainview.frame.size.width/2-40,mainview.frame.size.height/2-60, 80, 80)];
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.clipsToBounds = YES;
            img.layer.cornerRadius = img.frame.size.width/2;
            img.layer.borderWidth = 0.5;
            img.layer.borderColor = [UIColor colorWithRed:255.0f/255.0f green:182.0f/255.0f blue:193.0f/255.0f alpha:1].CGColor;
            img.image = [UIImage imageNamed:[_array[i] valueForKeyPath:@"ImageUrl"]];
            img.userInteractionEnabled = YES;
            [mainview addSubview:img];
            
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, img.frame.size.width, img.frame.size.height)];
            view.contentMode = UIViewContentModeScaleAspectFill;
            //view.clipsToBounds = YES;
            //view.layer.cornerRadius = 4;
            //view.layer.borderWidth = 1;
            view.backgroundColor =[UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:0];
            //view.layer.borderColor = [UIColor whiteColor].CGColor;
            [img addSubview:view];
            
            
            UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(mainview.frame.size.width/2-40,CGRectGetMaxY(img.frame)+10, 80, 20)];
            text.textAlignment = NSTextAlignmentCenter;
            text.textColor = [UIColor grayColor];
            text.font = [UIFont boldSystemFontOfSize:13];
            text.text = [NSString stringWithFormat:@"%@",[showArray[i]objectForKey:@"Text"]];
            [mainview addSubview:text];
            
            UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(mainview.frame.size.width/2-40,CGRectGetMaxY(text.frame), 80, 20)];
            detailLabel.textColor = [UIColor grayColor];
            detailLabel.textAlignment = NSTextAlignmentCenter;
            detailLabel.font = [UIFont systemFontOfSize:10];
            detailLabel.text = [NSString stringWithFormat:@"%@",[showArray[i]objectForKey:@"DetailText"]];
            [mainview addSubview:detailLabel];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, img.frame.size.width, img.frame.size.height);            button.contentMode = UIViewContentModeScaleAspectFill;
//            button.clipsToBounds = YES;
//            button.layer.cornerRadius = 4;
//            button.layer.borderWidth = 1;
//            button.layer.borderColor = [UIColor darkGrayColor].CGColor;
            button.tag = i;
            [button addTarget:self
                       action:@selector(SeeMore:) forControlEvents:UIControlEventTouchUpInside];
            [img addSubview:button];
            
            
        }
        
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width/3*_totalNum,100);
        
        
    }
    
    

   
    



}

-(void)SeeMore:(UIButton *)button

{
    
    switch (button.tag)
    {
        case 0:
        {
            
            
        
            NSNotification *tagzero = [NSNotification notificationWithName:@"tagzero" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagzero];
            
            
            
            
        
        }
       
            
           
            break;
            
        case 1:
        {
            
            NSNotification *tagone = [NSNotification notificationWithName:@"tagone" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagone];
            
            
            

        
        
        }
           
            break;
        case 2:
        {
        
            NSNotification *tagtwo = [NSNotification notificationWithName:@"tagtwo" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagtwo];
            
            

        
        }
            
            break;
            
        case 3:
        {
            NSNotification *tagthree = [NSNotification notificationWithName:@"tagthree" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagthree];
            
            
        }
            
            break;
            
        case 4:
        {
        
        
            NSNotification *tagfour = [NSNotification notificationWithName:@"tagfour" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagfour];
            
            

        
        
        
        }
            break;
            
        case 5:
            
        {
            NSNotification *tagfive = [NSNotification notificationWithName:@"tagfive" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagfive];
            
        
        
        }
            break;
            
        case 6:
        {
        
            NSNotification *tagsix = [NSNotification notificationWithName:@"tagsix" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagsix];
            
            

        
        
        }
            break;
            
        case 7:
        {
        
            NSNotification *tagseven = [NSNotification notificationWithName:@"tagseven" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tagseven];
            
            

        
        
        
        }
            break;
            
        case 8:
        {
        
            NSNotification *tageight = [NSNotification notificationWithName:@"tageight" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:tageight];
            
            

        
        
        
        }
            break;
            
            
            
        default:
            break;
    }


}


@end
