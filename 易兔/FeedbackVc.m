//
//  FeedbackVc.m
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "FeedbackVc.h"
#import "JGProgressHUD.h"
#import "UIKit+AFNetworking.h"
#include "AFNetworking.h"


@interface FeedbackVc ()

{

    JGProgressHUD *_hud;


}

@end

@implementation FeedbackVc

-(id)init
{
    self = [super init];
    if (self)
        
    {
        
        _FeedbackLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 120)];
        _FeedbackLabel.textAlignment = NSTextAlignmentCenter;
        _FeedbackLabel.text = @"请输入你宝贵的意见";
        _FeedbackLabel.textColor =  self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _FeedbackLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        [self.view addSubview:_FeedbackLabel];
        
        _FeedbackTextfield = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_FeedbackLabel.frame), CGRectGetWidth(self.view.frame)-40, 200)];
        _FeedbackTextfield.textAlignment = NSTextAlignmentLeft;
        _FeedbackTextfield.font = [UIFont systemFontOfSize:15];
        _FeedbackTextfield.textColor = [UIColor darkGrayColor];
        _FeedbackTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _FeedbackTextfield.layer.cornerRadius = 4;
        _FeedbackTextfield.layer.borderWidth = 1;
        _FeedbackTextfield.layer.borderColor = _FeedbackButton.layer.borderColor = [UIColor colorWithRed:242.0f/255.0f green:238.0f/255.0f blue:234.0f/255.0f alpha:1].CGColor;
        _FeedbackTextfield.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_FeedbackTextfield];
        
        
        _FeedbackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_FeedbackButton setTitle:@"发送" forState:UIControlStateNormal];
        _FeedbackButton.titleLabel.textColor = [UIColor whiteColor];
        _FeedbackButton.titleLabel.font = [UIFont systemFontOfSize:19];
        _FeedbackButton.titleLabel.textAlignment = NSTextAlignmentRight;
        _FeedbackButton.frame = CGRectMake(0,0, 40, 40);
        [_FeedbackButton addTarget:self
    action:@selector(PostAdvice)
                  forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc]initWithCustomView:_FeedbackButton];
        self.navigationItem.rightBarButtonItem = leftButton;

        
    }
    
    return self;


}

-(void)PostAdvice
{
    _hud = [[JGProgressHUD alloc]initWithStyle:JGProgressHUDStyleDark];
    [_hud showInView:self.view animated:YES];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:@"http://120.27.101.247/Web/api/?url=user/advice" parameters:_FeedbackTextfield.text success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        
        [_hud dismiss];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [_hud dismiss];
        
    }];




}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [_FeedbackTextfield resignFirstResponder];

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"意见反馈";
    
    
    
    
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
