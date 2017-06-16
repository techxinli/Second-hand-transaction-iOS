//
//  RegistionVC.m
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "RegistionVC.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"
#import "JGProgressHUD.h"
#import "profileView.h"
#import "Reachability.h"

static RegistionVC *_instance = nil;

@interface RegistionVC ()
{
   
    JGProgressHUD *hud;

  

}

@end

@implementation RegistionVC

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









-(id)init
{
    self = [super init];
    
    if (self)
    {
        _change = NO;
        _headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,64,CGRectGetWidth(self.view.frame),50)];
        _headerLabel.textColor = [UIColor darkGrayColor];
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        _headerLabel.adjustsFontSizeToFitWidth = YES;
        _headerLabel.font = [UIFont systemFontOfSize:20];
        
        [self.view addSubview:_headerLabel];
        
        _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerLabel.frame), CGRectGetWidth(self.view.frame), 0.5)];
        _underline1.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline1];
        
        _userView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline1.frame), CGRectGetWidth(self.view.frame), 48)];
        _userView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_userView];
        
        _userNameImage = [[UIImageView alloc]initWithFrame: CGRectMake(20, 10, 30, 30)];
        _userNameImage.image = [UIImage imageNamed:@"手机号"];
        [_userView addSubview:_userNameImage];
        
        _userName = [[UITextField alloc]initWithFrame:CGRectMake(60, 14, 250, 20)];
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.borderStyle = UITextBorderStyleNone;
        _userName.placeholder = @"请输入邮箱或手机号";
        _userName.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userName.textColor = [UIColor darkGrayColor];
        _userName.font = [UIFont fontWithName:@"Heiti SC" size:18];
        [_userView addSubview:_userName];
        
        _underline2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_userView.frame), CGRectGetWidth(self.view.frame)-40, 0.5)];
        _underline2.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline2];
        
        
        _passWordView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline2.frame), CGRectGetWidth(self.view.frame), 48)];
        _passWordView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_passWordView];
        
        _passWordImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
        _passWordImage.image = [UIImage imageNamed:@"钥匙"];
        [_passWordView addSubview:_passWordImage];
        
        _passWord = [[UITextField alloc]initWithFrame:CGRectMake(60, 14, 250, 20)];
        _passWord.textAlignment = NSTextAlignmentLeft;
        _passWord.borderStyle = UITextBorderStyleNone;
        _passWord.placeholder = @"请输入密码";
        _passWord.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passWord.secureTextEntry = YES;
        _passWord.textColor = [UIColor darkGrayColor];
        [_passWordView addSubview:_passWord];
        
        
        _underline3 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_passWordView.frame), CGRectGetWidth(self.view.frame)-40, 0.5)];
        _underline3.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline3];
        
        _configureView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline3.frame), CGRectGetWidth(self.view.frame), 48)];
        _configureView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_configureView];
        
        _ConfigureImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
        _ConfigureImage.image = [UIImage imageNamed:@"钥匙确认"];
        [self.configureView addSubview:_ConfigureImage];
        
        _Configure = [[UITextField alloc]initWithFrame:CGRectMake(60, 14, 250, 20)];
        _Configure.textAlignment = NSTextAlignmentLeft;
        _Configure.borderStyle = UITextBorderStyleNone;
        _Configure.placeholder = @"请确认密码";
        _Configure.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _Configure.clearButtonMode = UITextFieldViewModeWhileEditing;
        _Configure.textColor = [UIColor darkGrayColor];
        _Configure.secureTextEntry = YES;
        [_configureView addSubview:_Configure];
        
        _underline4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_configureView.frame), CGRectGetWidth(self.view.frame), 0.5)];
        _underline4.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline4];
        
        _registionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _registionBtn.frame = CGRectMake(10, CGRectGetMaxY(_underline4.frame)+5,300, 45);
        _registionBtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _registionBtn.layer.cornerRadius = 4;
        [_registionBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registionBtn addTarget:self
                          action:@selector(registion)
                forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_registionBtn];
        
        
        
        
        

    }
    
    return self;
   


}

-(void)registion
{

    if (_userName.text.length==0)
    {
        
        
        __alertView1 =[[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"请输入你的用户名"
                                              delegate:self
                                     cancelButtonTitle:@"好的"
                                     otherButtonTitles:nil, nil];
        
        [self.view addSubview:__alertView1];
        [__alertView1 show];
        
    }
    
    else if  (_passWord.text.length==0)
    {
        
        
        __alertView1 =[[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"请输入你的密码"
                                              delegate:self
                                     cancelButtonTitle:@"好的"
                                     otherButtonTitles:nil, nil];
        
        [self.view addSubview:__alertView1];
        [__alertView1 show];
        
    }
    
    
    else if (_Configure.text.length==0)
    {
        
        
        
        __alertView1 =[[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"请确认你的密码"
                                              delegate:self
                                     cancelButtonTitle:@"好的"
                                     otherButtonTitles:nil, nil];
        
        [self.view addSubview:__alertView1];
         [__alertView1 show];
        
    }
    
        else if (![_passWord.text isEqualToString:_Configure.text])
    {
        
        
        __alertView1 =[[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"两次密码输入不正确"
                                              delegate:self
                                     cancelButtonTitle:@"好的"
                                     otherButtonTitles:nil, nil];
        
        [self.view addSubview:__alertView1];
        [__alertView1 show];
        
    }
    
    else if (_passWord.text.length==0&&_userName.text.length==0)
    {
    
        __alertView1 =[[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"请输入你信息"
                                              delegate:self
                                     cancelButtonTitle:@"好的"
                                     otherButtonTitles:nil, nil];
        
      [self.view addSubview:__alertView1];
       [__alertView1 show];
        
        
    }
    
    else if(_passWord.text.length>0&&_userName.text.length>0&&_Configure.text.length>0)
        
    {
        hud = [[JGProgressHUD alloc]initWithStyle:JGProgressHUDStyleLight];
        
        [hud showInView:self.view animated:YES];

        [self postSignup];
        
    }
    



}

- (void)postSignup
{
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSDictionary *dict =@{@"email":_userName.text,@"password":_passWord.text};
    [manager POST:@"http://120.27.101.247/Web/api/?url=user/signup" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSData *message=responseObject;
        
        
        
        NSDictionary *_dic1;
        NSDictionary *_str1;
        NSString *_success1;
        int number;
        
        _dic1=[NSJSONSerialization JSONObjectWithData:message
                                              options:NSJSONReadingMutableContainers
                                                error:nil];
        
        _str1=_dic1[@"status"];
        _success1=_str1[@"succeed"];
        number =[_success1 intValue];
      
        
        if (number==1)
        {
            [hud dismiss];
            
            
                
            _change = YES;

            __alertView1=[[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:@"注册成功"
                                                 delegate:self
                                        cancelButtonTitle:@"好的"
                                        otherButtonTitles:nil];
            [self.view addSubview:__alertView1];
            [__alertView1 show];
            
            
            
            
        }
        
        else
        {
            [hud dismiss];
            __alertView1=[[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:@"用户名被占用或邮箱被注册"
                                                 delegate:self
                                        cancelButtonTitle:@"好的"
                                        otherButtonTitles:nil];
            [self.view addSubview:__alertView1];
            [__alertView1 show];
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
    [_Configure resignFirstResponder];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
 
    
    self.title = @"注册";
    
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
    [self isConnectionAvailable];
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == __alertView1)
    {
        if (buttonIndex == 0&&_change == YES)
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
            
//            NSNotification *didRe = [NSNotification notificationWithName:@"didRe"
//                                                                     object:nil];
//            [[NSNotificationCenter defaultCenter] postNotification:didRe];
            
            

            
        }
        
        
        
    }
    
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
