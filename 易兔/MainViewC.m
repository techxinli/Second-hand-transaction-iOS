//
//  MainViewC.m
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

// imageView:80*80  headerImage 320*95


#import "MainViewC.h"
#import "AdColumn.h"
#import "ChooseType.h"
#import "DGoodInfo.h"
#import "Post.h"
#import "CollectionViewCell.h"
#import "GoodDetail.h"
#import "ChooseTypeVc.h"
#import "Reachability.h"
#import "AMBlurView.h"
#import "sys/sysctl.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"






static const NSString *BookUrl = @"http://120.27.101.247/Web/api/?url=listdb";



@interface MainViewC ()
{
    AdColumn *_headerView;
    ChooseType *_chooseType;
    NSMutableArray *imagearray;
    NSString *appstoreUrlString;
    NSURL *url;
    


}

@end

@implementation MainViewC

-(void)menuButtonClicked:(NSInteger)index
{
    
    NSLog(@"%ld",(long)index);
    

    switch (index) {
        case 0:
            
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=991622114&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"]];
            
            break;
            
            case 1:
            
            break;
            
            case 2:
            
            break;
            
            case 3:
            
            break;
            
        default:
            break;
    }


}


-(id)init
{
    
   
    
    self = [super init];
    if (self)
        
        
    {
        
        
        
        
        
        imagearray = [[NSMutableArray alloc]init];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager POST:@"http://120.27.101.247/Web/api/?url=ad" parameters:nil
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSData *message = responseObject;
             NSDictionary *dic = [[NSDictionary alloc]init];
             dic = [NSJSONSerialization JSONObjectWithData:message
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
             NSMutableArray *imageArray;
             
             NSLog(@"%@",dic);
             
             imageArray = dic[@"data"];
             for (int i = 0;i<imageArray.count;i++)
             {
                 NSURL *userUrl = [NSURL URLWithString:imageArray[i][@"dzimg"]];
                 NSLog(@"%@",imageArray[i][@"dzimg"]);
                 NSURLRequest *urlRequest=[NSURLRequest requestWithURL:userUrl];
                 NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
                 NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration];
                 NSURLSessionDownloadTask *task =[session downloadTaskWithRequest:urlRequest
                                                                completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error)
                                                  {
                                                      if (!error)
                                                      {
                                                          if ([urlRequest.URL isEqual:userUrl])
                                                          {
                                                              UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  
                                                                  
                                                                  //NSLog(@"%@",image);
                                                                  
                                                                  
                                                                  [imagearray addObject:image];
                                                                  
                                                                  NSLog(@"asdsa%lu",(unsigned long)imagearray.count);
                                                                  
                                                                  
                                                                  [_headerView setArray:imagearray];
                                                                  
                                                                  
                                                                  
                                                              });
                                                              // [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
                                                              
                                                          }
                                                      }
                                                  }];
                 
                 [task resume];
                 
                 
                 
                 
                 
             }
             
             
             
             
             
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             
             
         }];
       
        size_t size;
        
    
        int nR = sysctlbyname("hw.machine",NULL, &size, NULL,0);
        
        char*machine = (char*)malloc(size);
        
        nR = sysctlbyname("hw.machine", machine, &size,NULL, 0);
        
        
        _platform = [NSString
                              stringWithCString:machine encoding:NSUTF8StringEncoding];
        
        
        free(machine);
        //NSLog(@"%@",_platform);
       
    
    
    
        
        _headerView = [[AdColumn alloc]initWithFrame:CGRectMake(0,0, CGRectGetWidth(self.view.frame), self.view.frame.size.height/2.5)];
        NSLog(@"%f",self.view.frame.size.height/2.5);
        _headerView.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        _headerView.backgroundColor = [UIColor yellowColor];
        
        
        
        [self.view addSubview:_headerView];
        
        
        _underline = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_headerView.frame)+64, CGRectGetWidth(self.view.frame), 0.5)];
        _underline.image = [UIImage imageNamed:@"login_bt_back"];
        _underline.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:182.0f/255.0f blue:193.0f/255.0f alpha:0.6];
        [self.view addSubview:_underline];
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        
        _scrollView.delegate = self;
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor colorWithRed:0.f/255.0f green:191.0f/255.0f blue:255.0f/255.0f alpha:0.2];
        
        if ([_platform isEqualToString:@"iPhone4,1"])
        {
            _schoolImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_underline.frame), self.view.frame.size.width, self.view.frame.size.height/20)];
            
        }
        
        else
        {
        _schoolImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_underline.frame), self.view.frame.size.width, self.view.frame.size.height/13.0)];
        
        }
        
        //_schoolImage.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _schoolImage.userInteractionEnabled = YES;
        _schoolImage.image = [UIImage imageNamed:@"最新发布"];
        [self.view addSubview:_schoolImage];
        
        _schoolButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //_schoolButton.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:232.0/255.0 blue:170.0/255.0 alpha:0.9];
        _schoolButton.frame = CGRectMake(0, 0, _schoolImage.frame.size.width, _schoolImage.frame.size.height);
        [_schoolButton addTarget:self action:@selector(newest) forControlEvents:UIControlEventTouchUpInside];
        //[_schoolButton setTitle:@"最新发布      ➣" forState:UIControlStateNormal];
        [_schoolButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _schoolButton.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        _schoolButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_schoolImage addSubview:_schoolButton];
        NSLog(@"%f",_schoolButton.frame.size.height);

        _typeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_schoolImage.frame), self.view.frame.size.width,self.view.frame.size.height/3.1)];
        _typeView.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        [self.view addSubview:_typeView];
        
        ChooseType *choose = [[ChooseType alloc]initWithFrame:CGRectMake(0, 0, _typeView.frame.size.width, _typeView.frame.size.height)];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"ChooseType" ofType:@"plist"];
        NSArray *array1= [NSArray arrayWithContentsOfFile:path];
        [choose setArray:array1];

        [_typeView addSubview:choose];
        
        
        
        
        
        
//        UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
//        background.image = [UIImage imageNamed:@"background"];
//        [_scrollView addSubview:background];
        
//        AMBlurView *back = [[AMBlurView alloc]initWithFrame:CGRectMake(0, 0, background.frame.size.width, background.frame.size.height)];
//        back.alpha = 0.8;
//        [background addSubview:back];
        
//        [self.view addSubview:_scrollView];
//        
//       
//
//        _typeView = [[AMBlurView alloc]initWithFrame:CGRectMake(15,15, 135, 135)];
//        //_typeView.backgroundColor = [UIColor colorWithRed:0.f/255.0f green:191.0f/255.0f blue:255.0f/255.0f alpha:0.4];
//        _typeView.alpha = 0.8;
//        _typeView.layer.cornerRadius = _typeView.frame.size.width/2;
//        _typeView.layer.borderWidth = 1;
//        _typeView.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:191.0/255.0 blue:212.0/255.0 alpha:0.6].CGColor;
//        
//        
//        [self.scrollView addSubview:_typeView];
//        
//        _typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, _typeView.frame.size.width, _typeView.frame.size.height)];
//        _typeLabel.layer.cornerRadius = _typeLabel.frame.size.width/2;
//        _typeLabel.textAlignment = NSTextAlignmentCenter;
//        _typeLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:191.0/255.0 blue:212.0/255.0 alpha:0.6];
//        _typeLabel.font = [UIFont boldSystemFontOfSize:25];
//        _typeLabel.text =@"分类列表";
//        _typeLabel.font = [UIFont fontWithName:@"Heiti SC" size:25];
//        [_typeView addSubview:_typeLabel];
//        
//        _typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _typeButton.frame = CGRectMake(0,0, self.typeView.frame.size.width, self.typeView.frame.size.height);
//        [_typeButton addTarget:self action:@selector(typeChoose) forControlEvents:UIControlEventTouchUpInside];
//        [self.typeView addSubview:_typeButton];
//        
//        
//    
//        _visitView = [[AMBlurView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_typeView.frame)+30, 23, 125, 125)];
//        //_visitView.backgroundColor = [UIColor colorWithRed:64.0/255.0 green:224.0/255.0 blue:208.0/255.0 alpha:0.55];
//        _visitView.alpha = 0.8;
//        _visitView.layer.cornerRadius = _visitView.frame.size.width/2;
//        _visitView.layer.borderWidth = 1;
//        _visitView.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.60].CGColor;
//        
//        [self.scrollView addSubview:_visitView];
//        
//        _visitLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _visitView.frame.size.width, _visitView.frame.size.height)];
//        _visitLabel.layer.cornerRadius  = _visitLabel.frame.size.width/2;
//        _visitLabel.textAlignment = NSTextAlignmentCenter;
//        _visitLabel.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.80];
//        _visitLabel.font = [UIFont boldSystemFontOfSize:25];
//        _visitLabel.font = [UIFont fontWithName:@"Heiti SC" size:25];
//        _visitLabel.text =@"随便逛逛";
//        [_visitView addSubview:_visitLabel];
//        
//        _visitButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _visitButton.frame = CGRectMake(0,0, self.visitView.frame.size.width, self.visitView.frame.size.height);
//        [_visitButton addTarget:self action:@selector(visit) forControlEvents:UIControlEventTouchUpInside];
//
//        [self.visitView addSubview:_visitButton];
//
//        
//        
//        _schoolView = [[AMBlurView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-45, CGRectGetMaxY(_visitView.frame)-5, 100, 100)];
//        //_schoolView.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.65];
//        _schoolView.alpha = 0.8;
//        _schoolView.layer.cornerRadius = _schoolView.frame.size.width/2;
//        _schoolView.layer.borderWidth = 1;
//        _schoolView.layer.borderColor = [UIColor colorWithRed:127.0/255.0 green:255.0/255.0 blue:212.0/255.0 alpha:1.0].CGColor;
//        
//
//        
//        [self.scrollView addSubview:_schoolView];
//        
//        _schoolLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, _schoolView.frame.size.width, _schoolView.frame.size.height)];
//        _schoolLabel.layer.cornerRadius = _schoolLabel.frame.size.width/2;
//        _schoolLabel.textAlignment = NSTextAlignmentCenter;
//        _schoolLabel.textColor = [UIColor colorWithRed:64.f/255.0f green:224.0f/255.0f blue:208.0f/255.0f alpha:0.6];
//        _schoolLabel.font = [UIFont boldSystemFontOfSize:15];
//        _schoolLabel.text =@"校园信息";
//        _schoolLabel.font = [UIFont fontWithName:@"Heiti SC" size:22];
//        [_schoolView addSubview:_schoolLabel];
//        
//        _schoolButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _schoolButton.frame = CGRectMake(0,0, self.schoolView.frame.size.width, self.schoolView.frame.size.height);
//        [_schoolButton addTarget:self action:@selector(school) forControlEvents:UIControlEventTouchUpInside];
//
//        [self.schoolView addSubview:_schoolButton];
//        
//        _scrollView.contentSize = CGSizeMake((_scrollView.frame.size.width),_scrollView.frame.size.height + 2);
//        
//        if ([platform isEqualToString:@"iphone3,1"]||[platform isEqualToString:@"4,1"])
//        {
//            _scrollView.contentSize = CGSizeMake((_scrollView.frame.size.width),_scrollView.frame.size.height + 20);
//            
//        }
//
//        //_scrollView.contentSize = CGSizeMake((_scrollView.frame.size.width),_scrollView.frame.size.height*1.15+4);
//

        
        self.tabBarItem.image = [UIImage imageNamed:@"首页"];
        UIImage *selectedImage=[UIImage imageNamed: @"首页二态"];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
        self.tabBarItem.selectedImage = selectedImage;
    
    }
    
    return self;
   


}

-(void)typeChoose
{
    
    ChooseTypeVc *choose = [[ChooseTypeVc alloc]init];
    [self.navigationController pushViewController:choose animated:YES];



}

-(void)visit
{
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"随便看看";
    [self.navigationController pushViewController:infoView animated:YES];


}

-(void)school
{

    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"校园信息";
    [self.navigationController pushViewController:infoView animated:YES];

}


-(void)loadView
{

    [super loadView];
    
    self.title = @"首页";
 
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
  
    
    
    
  

    self.tabBarController.tabBar.hidden = NO;


}

#pragma mark 定时滚动scrollView
-(void)viewDidAppear:(BOOL)animated{//显示窗口
    [super viewDidAppear:animated];
    
   

    
    //    [NSThread sleepForTimeInterval:3.0f];//睡眠，所有操作都不起作用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_headerView openTimer];//开启定时器
    });
}
-(void)viewWillDisappear:(BOOL)animated{//将要隐藏窗口  setModalTransitionStyle=UIModalTransitionStyleCrossDissolve时是不隐藏的，故不执行
    [super viewWillDisappear:animated];
    
   
    //[sideBar insertMenuButtonOnView:self.view forViewController:self];
    
    
    if (_headerView.totalNum>1)
    {
        [_headerView closeTimer];//关闭定时器
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self isConnectionAvailable];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagzeroView) name:@"tagzero" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagoneView) name:@"tagone" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagtwoView) name:@"tagtwo" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagthreeView) name:@"tagthree" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagfourView) name:@"tagfour" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagfiveView) name:@"tagfive" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagsixView) name:@"tagsix" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotagsevenView) name:@"tagseven" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(pushTotageightView) name:@"tageight" object:nil];
    
    
    
    
    
    
    
    
    
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
     NSLog(@"jj%lu",(unsigned long)imagearray.count);
    
    
   
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pushToView

-(void)newest
{
    NSLog(@"asdas");
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"最新发布";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 0;
    [self.navigationController pushViewController:infoView animated:YES];
    



}

-(void)pushTotagzeroView
{

    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"图书教材";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 341;
    [self.navigationController pushViewController:infoView animated:YES];
        
        
    
    

}

-(void)pushTotagoneView
{
    
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"校园代步";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 207;
    [self.navigationController pushViewController:infoView animated:YES];
   
    
    
    
}

-(void)pushTotagtwoView
{
    
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"数码电子";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 43;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

-(void)pushTotagthreeView
{
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"寝室电器";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 30;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

-(void)pushTotagfourView
{
 
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"租赁";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 208;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

-(void)pushTotagfiveView
{
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"休闲娱乐";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 174;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

-(void)pushTotagsixView
{
   
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"衣物鞋帽";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 26;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

-(void)pushTotagsevenView
{
   
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"运动健身";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 173;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

-(void)pushTotageightView
{
    
    DGoodInfo *infoView = [[DGoodInfo alloc]init];
    infoView.title = @"其他宝贝";
    infoView.post = [[Post alloc]init];
    infoView.post.DataUrl = [NSString stringWithFormat:@"%@",BookUrl];
    infoView.post.sxtimes = 1;
    infoView.post.fid = 178;
    [self.navigationController pushViewController:infoView animated:YES];
    
    
    
}

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
