//
//  ChooseTypeVc.m
//  易兔
//
//  Created by 李鑫 on 15/4/20.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "ChooseTypeVc.h"
#import "ChooseType.h"

@interface ChooseTypeVc ()
{

ChooseType *_chooseType;
    
}

@end

@implementation ChooseTypeVc


-(id)init
{
    self = [super init];
    if (self)
    {
        
                _chooseType = [[ChooseType alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 1800)];
                NSString *path = [[NSBundle mainBundle]pathForResource:@"ChooseType" ofType:@"plist"];
                NSArray *array1= [NSArray arrayWithContentsOfFile:path];
        
                [_chooseType setArray:array1];
        
                [self.view addSubview:_chooseType];
        
    
        
    }
    
    return self;



}


-(void)viewWillAppear:(BOOL)animated

{
    [super viewWillAppear:animated];
    self.title = @"类型选择";
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.hidden = YES;
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    


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
