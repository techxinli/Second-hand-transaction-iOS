//
//  serviceInfo.m
//  易兔
//
//  Created by 李鑫 on 15/4/19.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "serviceInfo.h"

@interface serviceInfo ()

@end

@implementation serviceInfo

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.title = @"服务条款";
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    _service = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _service.textColor = [UIColor darkGrayColor];
    _service.font = [UIFont fontWithName:@"Heiti SC" size:18];
    _service.textAlignment = NSTextAlignmentLeft;
    
    _service.text =@"易兔是一家为在校学生提供换物、二手货及尾货交易的电子商务平台，为自然人之间进行易物和交流等活动提供信息和服务。另外，易兔还将通过国际互联网、手机客户端(IOS、Android)向用户提供诸多相关服务，包括信息浏览、网上论坛、个性化内容及相关网络应用工具等，易兔不保证所有信息、文本、图形、链接及其它项目的合法性、真实性、准确性和完整性。除非另有明确规定，目前及以后易兔提供的所有新功能、新产品及新服务均无条件地适用本服务协议条款。";
    [self.view addSubview:_service];
    
    
    self.tabBarController.tabBar.hidden = YES;
    
    
    
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
