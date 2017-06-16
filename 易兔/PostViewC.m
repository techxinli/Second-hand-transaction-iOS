//
//  PostViewC.m
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "PostViewC.h"
#import "PostInfo.h"
#import "LoginViewC.h"

@interface PostViewC ()

@end

@implementation PostViewC

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == _alert)
    {
        if (buttonIndex == 0)
        {
            LoginViewC *loginVc = [[LoginViewC alloc]init];
            [self.navigationController pushViewController:loginVc
                                                 animated:YES];
            NSNotification *login = [NSNotification notificationWithName:@"pushlogin" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:login];
            
            
        }
        
        
        
    }
    
}
-(id)init
{
    self = [super init];
    if (self)
        
    {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1]} forState:UIControlStateSelected];
        self.tabBarItem.image = [UIImage imageNamed:@"发布"];
        UIImage *selectedImage=[UIImage imageNamed: @"发布二态"];
         selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
        self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];

        

        _conClick = NO;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changepass) name:@"password" object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
    selector:@selector(canClick)
    name:@"didLogin"
                                                  object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self
    selector:@selector(logout) name:@"logout"
                                                  object:nil];
        
        _PostButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _PostButton.frame = CGRectMake(self.view.frame.size.width/2-60, CGRectGetHeight(self.view.frame)/2-60, 120, 120);
        [_PostButton setBackgroundImage:[UIImage imageNamed:@"纸飞机大按钮-01"] forState:UIControlStateNormal];
        [_PostButton.layer setCornerRadius:_PostButton.frame.size.width/2.0];
        
        [_PostButton addTarget:self
                            action:@selector(PostInfo)
                  forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_PostButton];

        
    }
    
    return self;


}

-(void)changepass
{

    _conClick = NO;

}

-(void)logout
{

    _conClick = NO;

}
-(void)canClick
{

    _conClick = YES;


}


-(void)PostInfo
{
    
    if (_conClick == NO)
    {
        _alert = [[UIAlertView alloc]initWithTitle:@"提示"
    message:@"请登录后操作"
    delegate:self
    cancelButtonTitle:@"好的"
                                 otherButtonTitles: nil];
        _alert.delegate = self;
        [self.view addSubview:_alert];
        [_alert show];
    }
    
    if (_conClick == YES)
    {
        _isUse=YES;
        
        if (_isUse==YES) {
            [UIView animateWithDuration:0.3f
                                  delay:0.0f
                 usingSpringWithDamping:.2f
                  initialSpringVelocity:10.f
                                options:0 animations:^{
                                    _PostButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1                                                                                                               , 1.1);
                                    
                                }
                             completion:^(BOOL finished)
             {
                 
                 _PostButton.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1,1);
                 
                 PostInfo *postInfoVc = [[PostInfo alloc]init];
                 [self.navigationController pushViewController:postInfoVc
                                                      animated:YES];
                 
                 
             }];
            
        }
        

        

        
    }
   
}


-(void)loadView
{
    [super loadView];
    
    self.title = @"发布";
  
    


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;

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
