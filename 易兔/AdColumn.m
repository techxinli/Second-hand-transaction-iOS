//
//  AdColumn.m
//  CollectionView
//
//  Created by 李鑫 on 15/4/6.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "AdColumn.h"

@implementation AdColumn

-(id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _scrollView.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        
        //_scrollView.backgroundColor = [UIColor redColor];

        
        _scrollView.delegate = self;
        
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
       // _scrollView.scrollEnabled = NO;
        
        
        _scrollView.pagingEnabled = YES;
        
        [self addSubview:_scrollView];
        
        
        UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)+44, CGRectGetWidth(self.frame), 20)];
        containerView.backgroundColor = [UIColor clearColor];
        [self addSubview:containerView];
        
        UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame))];
        alphaView.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.7];;
        
        [containerView addSubview:alphaView];
        
        //分页控制
        
        _pageController = [[UIPageControl alloc]initWithFrame:CGRectMake(10, 0, CGRectGetWidth(containerView.frame)-20, 20)];
        _pageController.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _pageController.currentPage = 0;
        [containerView addSubview:_pageController];
        
        
        _imageNum = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, CGRectGetWidth(containerView.frame)-20, 20)];
        
        _imageNum.font = [UIFont fontWithName:@"Heiti SC" size:16];
        
        _imageNum.textColor = [UIColor darkGrayColor];
        
        _imageNum.textAlignment = NSTextAlignmentRight;
        [containerView addSubview:_imageNum];
        
        //配置定时器
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self
                                                selector:@selector(timerAction:) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:_timer
                                     forMode:NSDefaultRunLoopMode];
        
         [_timer setFireDate:[NSDate distantFuture]];
        //关闭定时器
        
        
        
    }
    return self;

}


-(void)timerAction: (NSTimer *)timer
{

    if (_totalNum>1)
    {
        CGPoint newOffset = _scrollView.contentOffset;
        newOffset.x = newOffset.x + CGRectGetWidth(_scrollView.frame);
        if (newOffset.x > (CGRectGetWidth(_scrollView.frame))*(_totalNum-1))
        {
            newOffset.x = 0;
        }
        //当前是第几个视图
        int index = newOffset.x / CGRectGetWidth(_scrollView.frame);
        newOffset.x = index * CGRectGetWidth(_scrollView.frame);
        _imageNum.text = [NSString stringWithFormat:@"%d / %ld",index+1,(long)_totalNum];
        [_scrollView setContentOffset:newOffset animated:YES];
        
        
    }
    else
    {
       [_timer setFireDate:[NSDate distantFuture]];//关闭定时器
    }
    
}


#pragma mark - pageControl绑定ScrollView

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if ([scrollView isMemberOfClass:[UITableView class]])
    {
        
    }
    
    else
    {
        int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
        
        //当前第几个视图
        
        
        _pageController.currentPage = index;
        for (UIView *view in scrollView.subviews)
        {
            if (view.tag == index)
            {
                
            }
            
            else
            {
            
            
            }
            
        }
        
    }


}

-(void)setArray:(NSMutableArray *)imageArray
{
    NSLog(@"%lu",(unsigned long)imageArray.count);

    _totalNum = [imageArray count];
    if (_totalNum>0)
    {
        for (int i = 0;i<_totalNum; i++ )
        {
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(_scrollView.frame),-64, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame))];
            NSLog(@"%f,%f,%f,%f",img.frame.size.height,img.frame.size.width,img.frame.origin.x,img.frame.origin.y);
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.image = imageArray[i];
            //img.backgroundColor = [UIColor redColor];
            [img setTag:i];
            [_scrollView addSubview:img];
            
        }
        
        _imageNum.text = [NSString stringWithFormat:@"%lddld",
                          
                          _pageController.currentPage+1,(long)_totalNum];
        _pageController.numberOfPages = _totalNum;
        
        
        CGRect frame;
        frame = _pageController.frame;
        frame.size.width = 15 * _totalNum;
        _pageController.frame = frame;
        
        
    }
    
    else
    {
    
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame))];
        img.image = [UIImage imageNamed:@"comment_gray"];
        img.userInteractionEnabled = YES;
        [_scrollView addSubview:img];
        _imageNum.text = @"无数据";
        
        
    
    }

    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame)*_totalNum,0);

}

-(void)openTimer
{

    [_timer setFireDate:[NSDate distantPast]];//开启定时器


}

-(void)closeTimer
{

    [_timer setFireDate:[NSDate distantFuture]];//关闭定时器



}











@end
