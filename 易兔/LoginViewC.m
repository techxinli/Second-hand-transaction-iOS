//
//  profileViewC.m
//  易兔
//
//  Created by 李鑫 on 15/4/9.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "LoginViewC.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"
#import "RegistionVC.h"
#import "JGProgressHUD.h"
#import "selfCenterVc.h"
#import "AppStatus.h"
#import "HeaderImage.h"
#import "Reachability.h"


@interface LoginViewC ()
{
    JGProgressHUD *hud;
    JGProgressHUD *hud2;
    NSDictionary *dic1;
    NSDictionary *User;


}

@end

@implementation LoginViewC

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







-(void)changeContentViewPosition:(NSNotification *)notification
{
    
    
    
    _headerView.image = [UIImage imageNamed:@"login2"];
    
    
}
-(void)keyboardhide:(NSNotification *)notification
{
    
    _headerView.image = [UIImage imageNamed:@"login"];
    
    
    
}



-(id)init
{
    self = [super init];
    if (self)
    {
        //_LoginType = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeContentViewPosition:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(pushLogin)
                                                    name:@"pushlogin"
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]  addObserver:self
                                                  selector:@selector(keyboardhide:) name:UIKeyboardWillHideNotification object:nil];

        
        _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,64, CGRectGetWidth(self.view.frame),0.5)];
        _underline1.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline1];
        
        _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_underline1.frame), CGRectGetWidth(self.view.frame), 95)];
        _headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _headerView.image = [UIImage imageNamed:@"login"];
        [self.view addSubview:_headerView];
        
        _underline2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), CGRectGetWidth(self.view.frame), 0.5)];
        _underline2.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline2];
        
        _loginView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline2.frame), CGRectGetWidth(self.view.frame), 100)];
        _loginView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_loginView];
        
        _underline3 = [[UIImageView alloc]initWithFrame:CGRectMake(15,_loginView.frame.size.height/2, self.view.frame.size.width-30, 0.5)];
        _underline3.image = [UIImage imageNamed:@"login_bt_back"];
        [self.loginView addSubview:_underline3];
        
        
        _userImage = [[UIImageView alloc]initWithFrame:CGRectMake(20,15,20, 20)];
        _userImage.image = [UIImage imageNamed:@"login_username"];
        [self.loginView addSubview:_userImage];
        
        _passWordImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 65, 20, 20)];
        _passWordImage.image = [UIImage imageNamed:@"login_password"];
        [self.loginView addSubview:_passWordImage];
        
        _userName = [[UITextField alloc]initWithFrame:CGRectMake(60, 15, 250, 20)];
        _userName.textColor = [UIColor darkGrayColor];
        _userName.font = [UIFont systemFontOfSize:15];
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.borderStyle = UITextBorderStyleNone;
        _userName.placeholder = @"在这里输入手机号或者邮箱";
        _userName.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userName.keyboardType = UIKeyboardTypeEmailAddress;
        //_userName.text = @"12345@qq.com";
        _userName.font = [UIFont fontWithName:@"Heiti SC" size:18];
        [_userName addTarget:self
                      action:@selector(changeButton:) forControlEvents:UIControlEventEditingChanged];
        [self.loginView addSubview:_userName];
        
        _passWord = [[UITextField alloc]initWithFrame:CGRectMake(60, 65, 250, 20)];
        _passWord.textColor = [UIColor darkGrayColor];
        _passWord.font = [UIFont systemFontOfSize:15];
        _passWord.textAlignment = NSTextAlignmentLeft;
        _passWord.borderStyle = UITextBorderStyleNone;
        _passWord.placeholder = @"请输入密码";
        _passWord.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passWord.keyboardType = UIKeyboardTypeAlphabet;
        //_passWord.text = @"12345678";
        _passWord.secureTextEntry = YES;
        [_passWord addTarget:self
                      action:@selector(changeButton:) forControlEvents:UIControlEventEditingChanged];
        [self.loginView addSubview:_passWord];
        
        _underline4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_loginView.frame), CGRectGetWidth(self.view.frame), 0.5)];
        _underline4.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline4];
        
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _loginButton.frame = CGRectMake(10, CGRectGetMaxY(_underline4.frame)+5, 300, 45);
        _loginButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _loginButton.layer.cornerRadius = 4;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self
                         action:@selector(LoginIn:)
               forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_loginButton];
        

        
        
        
                                             
        
    }
    
    return self;



}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];

}

-(void)changeButton:(UITextField*)textfield
{
    
    

    if (textfield == _userName)
    {
        
        
    }
    
    else if (textfield == _passWord)
    {
    
        
    
    }



}

-(void)pushLogin
{
   
    _LoginType = NO;



}


-(void)LoginIn:(UIButton *)btn
{
    
        if (_passWord.text.length == 0 && _userName.text.length > 0)
        {
            
            _alertView = [[UIAlertView alloc]initWithTitle:@"请输入密码"
                                                   message:@""
                                                  delegate:self
                                         cancelButtonTitle:@"好的"
                                         otherButtonTitles: nil];
            
            
            [self.view addSubview:_alertView];
            
            [_alertView show];
            

            
        }
        
        
        else if (_passWord.text.length == 0 && _userName.text.length == 0)
        {
            
            _alertView = [[UIAlertView alloc]initWithTitle:@"请输入你的信息"
                                                   message:@""
                                                  delegate:self
                                         cancelButtonTitle:@"好的"
                                         otherButtonTitles: nil];
            
            [self.view addSubview:_alertView];
            
            [_alertView show];

            
        }
        
        else if (_userName.text.length== 0&&_passWord.text.length > 0)
        {
            _alertView = [[UIAlertView alloc]initWithTitle:@"请输入账号"
                                                   message:@""
                                                  delegate:self
                                         cancelButtonTitle:@"好的"
                                         otherButtonTitles: nil];
            
            [self.view addSubview:_alertView];
            
            [_alertView show];

        
            
            
        }
    
       else if(_userName.text.length > 0 &&_passWord.text.length > 0)
           
       {
           
            hud = [[JGProgressHUD alloc]initWithStyle:JGProgressHUDStyleLight];
        
           [hud showInView:self.view animated:YES];
           
           
           [self postLogin];
       
       
       
       }
    
        
}
    

-(void)postLogin
{
    if (_LoginType == YES)
    {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSDictionary *dict = @{@"name":_userName.text,@"password":_passWord.text};
        [manager POST:@"http://120.27.101.247/Web/api/?url=user/signin" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSData *message = responseObject;
            
            NSDictionary *_dic;
            NSDictionary *_str;
            NSString *success;
            int number;
            
            _dic = [NSJSONSerialization JSONObjectWithData:message
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
          
            NSLog(@"%@",message);
            _str = _dic[@"status"];
            success = _str[@"succeed"];
            number =[success intValue];
            
            if (number==1)
            {
                [hud dismiss];
                [_underline1 removeFromSuperview];
                [_headerView removeFromSuperview];
                [_underline2 removeFromSuperview];
                [_loginView removeFromSuperview];
                [_underline3 removeFromSuperview];
                [_underline4 removeFromSuperview];
                [_userImage removeFromSuperview];
                [_userName removeFromSuperview];
                [_passWord removeFromSuperview];
                [_passWordImage removeFromSuperview];
                [_loginButton removeFromSuperview];
                self.view.backgroundColor = [UIColor whiteColor];
                
                [self.navigationController popToRootViewControllerAnimated:YES];
                
                
                NSNotification *didLogin = [NSNotification notificationWithName:@"didLogin"
                                                                         object:nil];
                [[NSNotificationCenter defaultCenter] postNotification:didLogin];
                
                
                
            }
            
            else
            {
                [hud dismiss];
                _alertView=[[UIAlertView alloc]initWithTitle:@"提示"
                                                     message:@"用户名或密码不正确"
                                                    delegate:self
                                           cancelButtonTitle:@"好的"
                                           otherButtonTitles:nil];
                [self.view addSubview:_alertView];
                [_alertView show];
                
            }
            
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         
         {
             
             
         }];
        

        
    }
    
    if (_LoginType == NO)
    {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSDictionary *dict = @{@"name":_userName.text,@"password":_passWord.text};
        [manager POST:@"http://120.27.101.247/Web/api/?url=user/signin" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSData *message = responseObject;
            
            NSDictionary *_dic;
            NSDictionary *_str;
            NSString *success;
            int number;
            
            _dic = [NSJSONSerialization JSONObjectWithData:message
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
           
            
           
            NSLog(@"%@",_dic);
            [AppStatus shareInstance].UserInfo = _dic;
            
            
            _str = _dic[@"status"];
            success = _str[@"succeed"];
            number =[success intValue];
           
            
            
            
            if (number==1)
            {
                
                dic1 = [AppStatus shareInstance].UserInfo[@"data"];
                User = [dic1 valueForKeyPath:@"user"];
                NSURL *userUrl = [NSURL URLWithString:User[@"icon"]];
                NSLog(@"%@",userUrl);
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
                                                                 NSLog(@"dsf");
                                                                 [HeaderImage shareInstance].image=image;
                                                                 NSLog(@"%@",[HeaderImage shareInstance].image);
                                                                 
                                                             });
                                                             // [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
                                                             
                                                         }
                                                     }
                                                 }];
                
                [task resume];

                
                NSArray *dataArray = @[_userName.text,_passWord.text];
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
                NSString *plistPath = [paths objectAtIndex:0];
                NSString *fileName = [plistPath stringByAppendingString:@"text.plist"];
                NSLog(@"%@",fileName);
                
                [dataArray writeToFile:fileName atomically:YES];

                
                NSNotification *didPush = [NSNotification notificationWithName:@"didPush" object:nil];
                [[NSNotificationCenter defaultCenter]postNotification:didPush];
                
                NSNotification *selfcenter = [NSNotification notificationWithName:@"selfcenter" object:nil];
                
                
                [[NSNotificationCenter defaultCenter]postNotification:selfcenter];
                
                NSNotification *image = [NSNotification notificationWithName:@"image" object:nil];
                [[NSNotificationCenter defaultCenter]postNotification:image];

                [hud dismiss];
                [_underline1 removeFromSuperview];
                [_headerView removeFromSuperview];
                [_underline2 removeFromSuperview];
                [_loginView removeFromSuperview];
                [_underline3 removeFromSuperview];
                [_underline4 removeFromSuperview];
                [_userImage removeFromSuperview];
                [_userName removeFromSuperview];
                [_passWord removeFromSuperview];
                [_passWordImage removeFromSuperview];
                [_loginButton removeFromSuperview];
                self.view.backgroundColor = [UIColor whiteColor];
                
                
                [self.navigationController popToRootViewControllerAnimated:YES];
                
                
                
                
                NSNotification *didLogin = [NSNotification notificationWithName:@"didLogin"
                                                                         object:nil];
                [[NSNotificationCenter defaultCenter] postNotification:didLogin];

             
                
                
                
                
            }
            
            else
            {
                [hud dismiss];
                _alertView=[[UIAlertView alloc]initWithTitle:@"提示"
                                                     message:@"用户名或密码不正确"
                                                    delegate:self
                                           cancelButtonTitle:@"好的"
                                           otherButtonTitles:nil];
                [self.view addSubview:_alertView];
                [_alertView show];
                
            }
            
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         
         {
             
             
         }];

        
    }
    
    }



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *plistPath = [paths objectAtIndex:0];
    NSString *fileName = [plistPath stringByAppendingString:@"text.plist"];
    NSLog(@"%@",fileName);
    
    NSArray *data = [NSArray arrayWithContentsOfFile:fileName];
    
    _userName.text = data[0];
    _passWord.text = data[1];

    
    self.title = @"登陆";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
