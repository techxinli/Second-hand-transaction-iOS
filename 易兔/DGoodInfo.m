//
//  DGoodInfo.m
//  易兔
//
//  Created by 李鑫 on 15/4/15.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "DGoodInfo.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "AdColumn.h"
#import "Post.h"
#import "CollectionViewCell.h"
#import "MainViewC.h"
#import "MJRefresh.h"
#import "GoodDetail.h"
#import "Reachability.h"



@interface DGoodInfo ()

{

   
    


}

@end


@implementation DGoodInfo

@synthesize delegate = _delegate;


-(BOOL) isConnectionAvailable{
    
    
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
    }
    
    
    if (!isExistenceNetwork) {
        
        
        _alert =[[UIAlertView alloc]initWithTitle:@"无法连接到网络" message:@"请检查网络设置" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [self.view addSubview:_alert];
        [_alert show];
        
        return NO;
    }
    
    return isExistenceNetwork;
}








-(void)reloadData
{

    [_post infoPostsWithBlock:^(NSMutableArray *posts, NSError *error) {
        
        if (!error)
        {
            
            [self.collectionView.header beginRefreshing];
            _posts = posts;
            [self.collectionView reloadData];
            
            
        }
        
        
    }];
    
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self isConnectionAvailable];
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.hidden = YES;
    
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), self.view.frame.size.height+49) collectionViewLayout:flowlayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.collectionView];
    
    
    __weak typeof(self) weakSelf = self;
    
    // 下拉刷新
    [self.collectionView addLegendHeaderWithRefreshingBlock:^{
        
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            
            [weakSelf.collectionView reloadData];
            
            // 结束刷新
            [weakSelf.collectionView.header endRefreshing];
        });
    }];
    [self.collectionView.header beginRefreshing];
    
    // 上拉刷新
    [self.collectionView addLegendFooterWithRefreshingBlock:^{
        // 增加5条假数据
        weakSelf.post.sxtimes += 1;
        NSLog(@"%ld",(long)weakSelf.post.sxtimes);
        [weakSelf.post infoPostsWithBlock:^(NSMutableArray *posts, NSError *error)
         {
             
             if (!error)
             {
                 
                 for (int i = 0;i<posts.count;i++)
                 {
                     [weakSelf.posts addObject:posts[i]];
                     NSLog(@"%lu",(unsigned long)weakSelf.posts.count);
                 }
                 
                 
             }
             
         }];

        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            
            [weakSelf.collectionView reloadData];
            
            // 结束刷新
            [weakSelf.collectionView.footer endRefreshing];
        });
    }];
    // 默认先隐藏footer
    self.collectionView.footer.hidden = YES;
    
    
    
    [self reloadData];
    
    
    
    
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    

}

#pragma mark - dataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{


    self.collectionView.footer.hidden = _posts.count == 0;
    return _posts.count;


}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{


    return 1;
    



}



-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Post *post = _posts[indexPath.row];
    //NSLog(@"%@",_posts);
    static NSString *identify = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell)
    {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    cell.priceLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)post.money];
//  cell.timeLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)post.posttime];
    cell.labelLabel.text = post.title;
    cell.timeLabel.text = post.posttime;
    NSString *url = [NSString stringWithFormat:@"%@",post.picUrl];
    NSString *touxiang = [NSString stringWithFormat:@"%@",post.touxiang];
    
    if (url.length>0)
    {
        [cell.goodImageView setImageWithURL:post.picUrl
                           placeholderImage:[UIImage imageNamed:@"image"]];
    }
    else
    {
        cell.goodImageView.image = [UIImage imageNamed:@"1"];
   
    }
    
    if (touxiang.length>0)
    {
         [cell.headerView setImageWithURL:post.touxiang placeholderImage:[UIImage imageNamed:@"touxiang"]];
        
    }
    else
    {
    
        cell.headerView.image = [UIImage imageNamed:@"example"];
    
    }
   

   // NSLog(@"%lu",(unsigned long)post.cityid);
    
    
    return cell;
    
    

}
-(CGSize)collectionView:(UICollectionView*)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{


    return CGSizeMake(CGRectGetWidth(self.view.frame), 250);



}

-(CGFloat)collectionView:(UICollectionView*)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{

    return 0;


}


//Cell被选中

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"%ld",(long)indexPath.row);
    GoodDetail *detail = [[GoodDetail alloc]init];
    self.delegate = detail;
    [_delegate post:_posts[indexPath.row]];
    
    [self.navigationController pushViewController:detail animated:YES];
    
    
    



}

//刷新






    @end
