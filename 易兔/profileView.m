//
//  LoginView.m
//  易兔
//
//  Created by 李鑫 on 15/4/10.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "profileView.h"
#import "LoginViewC.h"
#import "RegistionVC.h"
#import "DidLogin.h"
#import "FeedbackVc.h"
#import "selfCenterVc.h"
#import "SphereMenu.h"
#import "RootViewController.h"
#import "AppStatus.h"
#import "UIImageView+AFNetworking.h"
#import "HeaderImage.h"




@interface profileView ()<SphereMenuDelegate>

@end

@implementation profileView

-(void)imageDownload

{

    NSDictionary *dic = [AppStatus shareInstance].UserInfo[@"data"];
    NSDictionary *User = [dic valueForKeyPath:@"user"];
    NSURL *userUrl = [NSURL URLWithString:User[@"icon"]];
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
                                                     self.image = image;
                                                 });
                                                 // [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
                                                 
                                             }
                                         }
                                     }];
    
    [task resume];
    



}


-(id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(imageDownload) name:@"image" object:nil];
        
        _selfcenter = NO;
        self.title = @"个人";
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(changeView) name:@"didLogin" object:nil];
        
        UIImage *selectedImage=[UIImage imageNamed: @"个人二态"];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
        self.tabBarItem.image = [UIImage imageNamed:@"个人"];
        self.tabBarItem.selectedImage = selectedImage;
        

        [[NSNotificationCenter defaultCenter]addObserver:self
    selector:@selector(didPush)
    name:@"didPush"
    object:nil];
        
        _ChangeView = YES;
        
        _save = NO;
        
        _loginView = [[UIView alloc]initWithFrame:CGRectMake(8, 72, CGRectGetWidth(self.view.frame)-16, 70)];
        _loginView.layer.cornerRadius = 6;
        
        _loginView.layer.borderWidth = 0.15;
        
        _loginView.backgroundColor = [UIColor whiteColor];
        
        _loginView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
        [self.view addSubview:_loginView];
        
        _loginImage = [[UIImageView alloc]initWithFrame:CGRectMake(17.5, 7.5, 55, 55)];
        _loginImage.layer.cornerRadius = _loginImage.frame.size.width/2;
        _loginImage.clipsToBounds = YES;
        _loginImage.layer.borderWidth = 1.5;
        _loginImage.layer.borderColor = [UIColor colorWithRed:152.f/255.0f green:245.0f/255.0f blue:255.0f/255.0f alpha:1.0].CGColor;
        _loginImage.image = [UIImage imageNamed:@"登陆"];
        [_loginView addSubview:_loginImage];
        
        _loginLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(90, 15, 100, 25)];
        _loginLabel1.textAlignment = NSTextAlignmentLeft;
        _loginLabel1.text = @"登录";
        _loginLabel1.font = [UIFont systemFontOfSize:18];
        _loginLabel1.textColor = [UIColor darkGrayColor];
        _loginLabel1.font = [UIFont fontWithName:@"Heiti SC" size:18];
        [_loginView addSubview:_loginLabel1];
        
        
        _loginLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(90, CGRectGetMaxY(_loginLabel1.frame), 200, 15)];
        _loginLabel2.textAlignment = NSTextAlignmentLeft;
        _loginLabel2.text = @"快来获得更多体验吧!";
        _loginLabel2.textColor = [UIColor darkGrayColor];
        _loginLabel2.font = [UIFont systemFontOfSize:11];
        [_loginView addSubview:_loginLabel2];
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _loginButton.frame =CGRectMake(8, 72, CGRectGetWidth(self.view.frame)-16, 70);
        _loginButton.layer.cornerRadius = 4;
        _loginButton.layer.borderWidth = 1;
        _loginButton.layer.borderColor = [UIColor colorWithRed:242.0f/255.0f green:238.0f/255.0f blue:234.0f/255.0f alpha:1].CGColor;        [_loginButton addTarget:self
                         action:@selector(Login:)
               forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        
        
        _registionView = [[UIView alloc]initWithFrame:CGRectMake(8,CGRectGetMaxY(_loginView.frame)+8, CGRectGetWidth(self.view.frame)-16, 70)];
        
        _registionView.layer.cornerRadius = 6;
        
        _registionView.layer.borderWidth = 0.15;
        
        _registionView.backgroundColor = [UIColor whiteColor];
        
        _registionView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        
        [self.view addSubview:_registionView];
        
        _registionImage = [[UIImageView alloc]initWithFrame:CGRectMake(17.5, 7.5, 55, 55)];
        _registionImage.layer.cornerRadius = _loginImage.frame.size.width/2;
        _registionImage.clipsToBounds = YES;
        _registionImage.layer.borderWidth = 1.5;
        _registionImage.layer.borderColor = [UIColor colorWithRed:64.f/255.0f green:224.0f/255.0f blue:208.0f/255.0f alpha:0.6].CGColor;
        _registionImage.image = [UIImage imageNamed:@"注册"];
        [_registionView addSubview:_registionImage];
        
        _registionLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(90, 15, 100, 25)];
        _registionLabel1.textAlignment = NSTextAlignmentLeft;
        _registionLabel1.text = @"注册";
        _registionLabel1.font = [UIFont systemFontOfSize:18];
        _registionLabel1.textColor = [UIColor darkGrayColor];
        [_registionView addSubview:_registionLabel1];
        
        
        _registionLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(90, CGRectGetMaxY(_loginLabel1.frame), 200, 15)];
        _registionLabel2.textAlignment = NSTextAlignmentLeft;
        _registionLabel2.text = @"还没有账号?赶快注册来加入我们吧!";
        _registionLabel2.numberOfLines = 2;
        _registionLabel2.textColor = [UIColor darkGrayColor];
        _registionLabel2.font = [UIFont systemFontOfSize:11];
        [_registionView addSubview:_registionLabel2];
        
        _registionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _registionButton.frame =CGRectMake(8,CGRectGetMaxY(_loginView.frame)+8, CGRectGetWidth(self.view.frame)-16, 70);
        _registionButton.layer.cornerRadius = 4;
        _registionButton.layer.borderWidth = 1;
        _registionButton.layer.borderColor = [UIColor colorWithRed:242.0f/255.0f green:238.0f/255.0f blue:234.0f/255.0f alpha:1].CGColor;;
        [_registionButton addTarget:self
                             action:@selector(registion:)
               forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_registionButton];
        
        _selfView = [[UIView alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(_registionView.frame)+8, 90, 90)];
        _selfView.backgroundColor = [UIColor whiteColor];
        _selfView.layer.cornerRadius = 6;
        [self.view addSubview:_selfView];
        
        _selfImageView = [[UIImageView alloc]initWithFrame:CGRectMake(17.5, 8.5, 55, 55)];
        _selfImageView.layer.cornerRadius = _loginImage.frame.size.width/2;
        _selfImageView.clipsToBounds = YES;
        _selfImageView.image = [UIImage imageNamed:@"个人中心"];
        _selfImageView.layer.borderWidth = 1.5;
        _selfImageView.layer.borderColor = [UIColor colorWithRed:127.f/255.0f green:255.0f/255.0f blue:212.0f/255.0f alpha:0.6].CGColor;

        [_selfView addSubview:_selfImageView];
        
        _selfLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,CGRectGetMaxY(_selfImageView.frame)+5, 80, 10)];
        _selfLabel.textAlignment = NSTextAlignmentCenter;
        _selfLabel.font = [UIFont systemFontOfSize:15];
        _selfLabel.text = @"个人中心";
        _selfLabel.textColor = [UIColor darkGrayColor];
        [_selfView addSubview:_selfLabel];
        
        _selfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _selfButton.frame =CGRectMake(8, CGRectGetMaxY(_registionView.frame)+8, 90, 90);
        _selfButton.layer.cornerRadius = 6;
        _selfButton.layer.borderWidth = 1;
        _selfButton.layer.borderColor = [UIColor colorWithRed:242.0f/255.0f green:238.0f/255.0f blue:234.0f/255.0f alpha:1].CGColor;;
        [_selfButton addTarget:self
                             action:@selector(SelfVc)
                   forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_selfButton];
        
        _FeedbackView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_selfView.frame)+7, CGRectGetMaxY(_registionView.frame)+8, 90, 90)];
        _FeedbackView.backgroundColor = [UIColor whiteColor];
        _FeedbackView.layer.cornerRadius = 6;
        [self.view addSubview:_FeedbackView];
        
        _FeedbackImage = [[UIImageView alloc]initWithFrame:CGRectMake(17.5, 8.5, 55, 55)];
        _FeedbackImage.image = [UIImage imageNamed:@"反馈"];
        _FeedbackImage.layer.cornerRadius = _loginImage.frame.size.width/2;
        _FeedbackImage.clipsToBounds = YES;
        _FeedbackImage.layer.borderWidth = 1.5;
        _FeedbackImage.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.65].CGColor;

        [_FeedbackView addSubview:_FeedbackImage];
        
        _FeedbackLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,CGRectGetMaxY(_FeedbackImage.frame)+5, 80, 10)];
        _FeedbackLabel.textAlignment = NSTextAlignmentCenter;
        _FeedbackLabel.font = [UIFont systemFontOfSize:15];
        _FeedbackLabel.text = @"意见反馈";
        _FeedbackLabel.textColor = [UIColor darkGrayColor];
        [_FeedbackView addSubview:_FeedbackLabel];
        
        _FeedbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _FeedbackButton.frame =CGRectMake(CGRectGetMaxX(_selfView.frame)+7, CGRectGetMaxY(_registionView.frame)+8, 90, 90);
        _FeedbackButton.layer.cornerRadius = 6;
        _FeedbackButton.layer.borderWidth = 1;
        _FeedbackButton.layer.borderColor = [UIColor colorWithRed:242.0f/255.0f green:238.0f/255.0f blue:234.0f/255.0f alpha:1.0].CGColor;
        [_FeedbackButton addTarget:self
                        action:@selector(Feedback)
              forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_FeedbackButton];
        
        
        UIImage *startImage = [UIImage imageNamed:@"start"];
        
        UIImage *image1 = [UIImage imageNamed:@"icon-twitter"];
        UIImage *image2 = [UIImage imageNamed:@"icon-email"];
        UIImage *image3 = [UIImage imageNamed:@"icon-facebook"];
        NSArray *images = @[image1, image2, image3];
        SphereMenu *sphereMenu = [[SphereMenu alloc] initWithStartPoint:CGPointMake(self.view.frame.size.width-self.view.frame.size.width/6, self.view.frame.size.height-self.view.frame.size.height/5.5)
                                                             startImage:startImage
                                                          submenuImages:images];
        sphereMenu.delegate = self;
        [self.view addSubview:sphereMenu];

        
        

        
        
        
    }
    
    return self;


}

- (void)sphereDidSelected:(int)index
{
    if (index == 0)
    {
        RootViewController * root = [[RootViewController alloc]init];
        NSNotification *notification = [NSNotification notificationWithName:@"update" object:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        [self.navigationController pushViewController:root animated:YES];
//        _alertview1 = [[UIAlertView alloc]initWithTitle:@"提示"
//                                               message:@"敬请期待"
//                                              delegate:self
//                                     cancelButtonTitle:@"好的"
//                                     otherButtonTitles: nil];
//        [self.view addSubview:_alertview1];
//        [_alertview1 show];

        
    }
    
    else if (index == 1)
    {
      _alertview1 = [[UIAlertView alloc]initWithTitle:@"提示"
    message:@"敬请期待"
    delegate:self
    cancelButtonTitle:@"好的"
                                   otherButtonTitles: nil];
        [self.view addSubview:_alertview1];
        [_alertview1 show];
        
    }
    
    else if (index == 2)
    {
        _alertview1 = [[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"敬请期待"
                                              delegate:self
                                     cancelButtonTitle:@"好的"
                                     otherButtonTitles: nil];
        [self.view addSubview:_alertview1];
        [_alertview1 show];

    
    }
}


-(void)Feedback
{

    FeedbackVc *feedBack = [[FeedbackVc alloc]init];
    [self.navigationController pushViewController:feedBack
                                         animated:YES];
    


}

-(void)SelfVc
{
    if (_selfcenter == YES &&_save == NO)
    {
        if ([HeaderImage shareInstance].image == nil)
        {
            _selfVc = [[selfCenterVc alloc]initWithMainImage:[UIImage imageNamed:@"example"]];
            [self.navigationController pushViewController:_selfVc
                                                 animated:YES];
            
        }
        
        else
        {
        
        _selfVc = [[selfCenterVc alloc]initWithMainImage:[HeaderImage shareInstance].image];
        [self.navigationController pushViewController:_selfVc
                                             animated:YES];
       
        }
        
    }
    
    
    if (_selfcenter == YES&&_save == YES)
    {
        //NSDictionary *dic = [AppStatus shareInstance].UserInfo[@"data"];
       // NSDictionary *User = [dic valueForKeyPath:@"user"];
        
        
        if ([HeaderImage shareInstance].image == nil)
        {
           
            _selfVc = [[selfCenterVc alloc]initWithMainImage:[UIImage imageNamed:@"example"]];
            _selfVc.save1 = YES;
            [self.navigationController pushViewController:_selfVc
                                                 animated:YES];
            
        }
        
        else
        {
            
            _selfVc = [[selfCenterVc alloc]initWithMainImage:[HeaderImage shareInstance].image];
            _selfVc.save1 = YES;
            [self.navigationController pushViewController:_selfVc
                                                 animated:YES];
            
        }
        

        
//        _selfVc = [[selfCenterVc alloc]initWithMainImage:[HeaderImage shareInstance].image];
//         _selfVc.save1 = YES;
//        [self.navigationController pushViewController:_selfVc animated:YES];
//
        
        
        
        
    }

    
    
    if (_selfcenter == NO)
    {
        
        _alertview = [[UIAlertView alloc]initWithTitle:@"提示"
                                           message:@"请登录后操作"
                                          delegate:self
                                 cancelButtonTitle:@"好的"
                                 otherButtonTitles: nil];
        _alertview.delegate = self;
        [self.view addSubview:_alertview];
        [_alertview show];

    }

    

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == _alertview)
    {
        if (buttonIndex == 0)
        {
            [self Login:_loginButton];
        }
        
        
        
    }
    
}


-(void)Login:(UIButton *)btn
{
    
    if (btn == _loginButton&& _ChangeView == YES)
    {
        LoginViewC *profile = [[LoginViewC alloc]init];
        [self.navigationController pushViewController:profile
                                             animated:YES];
       
        
    }

    else if(btn == _loginButton && _ChangeView == NO)
    {
    
        DidLogin *didlogin = [[DidLogin alloc]init];
        [self.navigationController pushViewController:didlogin
                                             animated:YES];
      
    
    }

}


-(void)registion:(UIButton *)btn
{

    if (btn == _registionButton)
    {
        RegistionVC *regis = [[RegistionVC alloc]init];
        [self.navigationController pushViewController:regis
                                             animated:YES];
        
    }
    
    



}

-(void)saveit
{

    _save = YES;


}

-(void)viewWillAppear:(BOOL)animated
{
    

    [super viewWillAppear:animated];
    
    
    
//    [[NSNotificationCenter defaultCenter]addObserver:self
//selector:@selector(loginView1)
//name:@"didRe"
//                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(saveit) name:@"save" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changepass) name:@"password" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(selfcentershow) name:@"selfcenter" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
selector:@selector(logout)
name:@"logout"
                                              object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self
//                                            selector:@selector(pushLogin)
//                                                name:@"pushlogin"
//                                              object:nil];
//    

    
    
    
    
    self.title = @"个人";

}

-(void)changepass
{

    _ChangeView = YES;
    _selfcenter = NO;

}

-(void)logout
{

    _selfcenter = NO;
    _ChangeView = YES;


}

-(void)selfcentershow
{


    _selfcenter = YES;


}

//-(void)loginView1
//{
//
//
//    [self Login:_loginButton];
//
//
//}

-(void)changeView
{
     _ChangeView = NO;
    _selfcenter = YES;
    

}

-(void)didPush
{

    _ChangeView = NO;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
