//
//  ChangePassWord.m
//  易兔
//
//  Created by 李鑫 on 15/4/19.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "ChangePassWord.h"
#import "JGProgressHUD.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "AppStatus.h"

@interface ChangePassWord ()
{


    JGProgressHUD *hud;

}

@end

@implementation ChangePassWord

-(id)init
{
    self = [super init];
    if (self)
    {
        _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,64, CGRectGetWidth(self.view.frame),0.5)];
        _underline1.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline1];
        
        _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_underline1.frame), CGRectGetWidth(self.view.frame), 95)];
        _headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
        _userImage.image = [UIImage imageNamed:@"login_password"];
        [self.loginView addSubview:_userImage];
        
        _passWordImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 65, 20, 20)];
        _passWordImage.image = [UIImage imageNamed:@"login_password"];
        [self.loginView addSubview:_passWordImage];
        
        _userName = [[UITextField alloc]initWithFrame:CGRectMake(60, 15, 250, 20)];
        _userName.textColor = [UIColor darkGrayColor];
        _userName.font = [UIFont systemFontOfSize:18];
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.borderStyle = UITextBorderStyleNone;
        _userName.placeholder = @"旧密码";
        _userName.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userName.keyboardType = UIKeyboardTypeEmailAddress;
        _userName.font = [UIFont fontWithName:@"Heiti SC" size:15];
        //_userName.text = @"12345@qq.com";
        [self.loginView addSubview:_userName];
        
        _passWord = [[UITextField alloc]initWithFrame:CGRectMake(60, 65, 250, 20)];
        _passWord.textColor = [UIColor darkGrayColor];
        _passWord.font = [UIFont systemFontOfSize:15];
        _passWord.textAlignment = NSTextAlignmentLeft;
        _passWord.borderStyle = UITextBorderStyleNone;
        _passWord.placeholder = @"新密码";
        _passWord.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passWord.keyboardType = UIKeyboardTypeAlphabet;
        
        //_passWord.text = @"12345678";
        _passWord.secureTextEntry = YES;
        [self.loginView addSubview:_passWord];
        
        _underline4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_loginView.frame), CGRectGetWidth(self.view.frame), 0.5)];
        _underline4.image = [UIImage imageNamed:@"login_bt_back"];
        [self.view addSubview:_underline4];
        
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _loginButton.frame = CGRectMake(10, CGRectGetMaxY(_underline4.frame)+5, 300, 45);
        _loginButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _loginButton.layer.cornerRadius = 4;
        [_loginButton setTitle:@"提交" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self
                         action:@selector(changepass)
               forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_loginButton];
        
        
        
        

        
    }

    return self;


}

-(void)changepass
{

    if (_passWord.text.length == 0 && _userName.text.length > 0)
    {
        
        _alertView = [[UIAlertView alloc]initWithTitle:@"请输入新密码"
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
        _alertView = [[UIAlertView alloc]initWithTitle:@"请输入旧密码"
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
        
        
        [self postPass];
        
        
        
    }




}

-(void)postPass
{

    NSDictionary *dic = [AppStatus shareInstance].UserInfo[@"data"];
    NSDictionary *User = [dic valueForKeyPath:@"user"];
    NSLog(@"%@",User);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *dict = @{@"uid":User[@"uid"],@"username":User[@"username"],@"old_password":_userName.text,@"password":_passWord.text};
    [manager POST:@"http://120.27.101.247/Web/api/?url=user/gpw" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSData *message = responseObject;
        
        NSDictionary *_dic;
        NSDictionary *_str;
        NSString *success;
        int number;
        
        _dic = [NSJSONSerialization JSONObjectWithData:message
                                               options:NSJSONReadingMutableContainers
                                                 error:nil];
        
        
        
        _str = _dic[@"status"];
        success = _str[@"succeed"];
        number =[success intValue];
        
        
        
        
        if (number==1)
        {
            
            
            
            [hud dismiss];
            
            NSNotification *changePassword = [NSNotification notificationWithName:@"password" object:nil];
            [[NSNotificationCenter defaultCenter]postNotification:changePassword];
            
            _alertView=[[UIAlertView alloc]initWithTitle:@"提示"
                                                 message:@"修改成功"
                                                delegate:self
                                       cancelButtonTitle:@"好的"
                                       otherButtonTitles:nil];
            [self.view addSubview:_alertView];
            [_alertView show];
            

            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            
            
            
            
            
            
            
        }
        
        else
        {
            [hud dismiss];
            _alertView=[[UIAlertView alloc]initWithTitle:@"提示"
                                                 message:@"密码不正确"
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


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"修改密码";
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.hidden = YES;
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];


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
