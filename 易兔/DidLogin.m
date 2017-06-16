//
//  DidLogin.m
//  易兔
//
//  Created by 李鑫 on 15/4/10.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "DidLogin.h"
#import "ChangePassWord.h"


@interface DidLogin ()

@end

@implementation DidLogin

-(id)init
{

    self = [super init];
    if (self)
    {
        
        
        _changePassWord = [UIButton buttonWithType:UIButtonTypeCustom];
        _changePassWord.frame = CGRectMake(0, 0, 80, 40);
        [_changePassWord setTitle:@"修改密码" forState:UIControlStateNormal];
        [_changePassWord setTintColor:[UIColor whiteColor]];
        _changePassWord.titleLabel.font = [UIFont systemFontOfSize:19];
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_changePassWord];
        [_changePassWord addTarget:self
                        action:@selector(changeWord) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = rightItem;
        

        
        _loginout = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _loginout.frame = CGRectMake(self.view.frame.size.width/2-60,self.view.frame.size.height/2-60, 120, 120);
        _loginout.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        _loginout.layer.cornerRadius = _loginout.frame.size.width/2;
        _loginout.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginout.layer.borderWidth = 2;
        [_loginout setTitle:@"注销" forState:UIControlStateNormal];
        _loginout.titleLabel.font = [UIFont systemFontOfSize:20];
        [_loginout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginout  addTarget:self
                         action:@selector(Loginoutview)
               forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_loginout];
        
        
    }
    return self;


}
-(void)changeWord
{

    ChangePassWord *change = [[ChangePassWord alloc]init];
    [self.navigationController pushViewController:change animated:YES];



}

-(void)Loginoutview
{

    _alertview = [[UIAlertView alloc]initWithTitle:@"提示"
                                           message:@"你要离开我么"
                                          delegate:self
                                 cancelButtonTitle:@"是的"
                                 otherButtonTitles:@"不是",nil];
    _alertview.delegate = self;
    [self.view addSubview:_alertview];
    [_alertview show];
    





}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == _alertview)
    {
        if (buttonIndex == 0)
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
            NSNotification *reset = [NSNotification notificationWithName:@"logout" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:reset];
            
        }
        
        
        
    }
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"登陆信息";
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.hidden = YES;



}

-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
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
