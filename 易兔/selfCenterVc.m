//
//  selfCenterVc.m
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "selfCenterVc.h"
#import "WriteSelfInfo.h"
#import "AppStatus.h"
#import "salaInfo.h"
#import "serviceInfo.h"
#import "UIImageView+AFNetworking.h"
#import "HeaderImage.h"


@interface selfCenterVc ()

{

    NSArray *_array;
    NSDictionary *dic;
    NSDictionary *_user;


}

@end

@implementation selfCenterVc

-(void)saveit
{

    _save1 = YES;


}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dic = [AppStatus shareInstance].UserInfo;
    _user = dic[@"data"][@"user"];
    NSLog(@"%@",_user);
   
    self.title = @"个人中心";
    
    [UIColor groupTableViewBackgroundColor];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(saveit) name:@"save" object:nil];
    
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

-(void)initData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"SelfCenter" ofType:@"plist"];
    _array = [NSArray arrayWithContentsOfFile:path];

}

- (void)viewDidLoad
{
    
    
    [self setOverView:self.myOverView];
    [self initData];

    
}

- (UIView *)myOverView
{
    UIView *view = [[UIView alloc] initWithFrame:self.overView.bounds];
    
    //Add an example imageView
    NSDictionary *User = [AppStatus shareInstance].UserInfo[@"data"][@"user"];

    //NSURL *userImageUrl = [NSURL URLWithString:User[@"icon"]];
    
    _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(view.center.x-60.0, view.center.y-50.0, 120.0, 120.0)];
    [_headerImage setContentMode:UIViewContentModeScaleAspectFill];
    [_headerImage setClipsToBounds:YES];
     _headerImage.image = [HeaderImage shareInstance].image;
    [_headerImage.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_headerImage.layer setBorderWidth:2.0];
    [_headerImage.layer setCornerRadius:_headerImage.frame.size.width/2.0];
    
    //Add an example label
    _namelabel = [[UILabel alloc] initWithFrame:CGRectMake(view.center.x-120.0, view.center.y+65.0, 240.0, 50.0)];
    _namelabel.text = User[@"username"];
    _namelabel.adjustsFontSizeToFitWidth = YES;
    [_namelabel setFont:[UIFont boldSystemFontOfSize:25.0]];
    _namelabel.font = [UIFont fontWithName:@"Heiti SC" size:25.0];
    [_namelabel setTextAlignment:NSTextAlignmentCenter];
    [_namelabel setTextColor:[UIColor whiteColor]];
    
    _schoolLabel = [[UILabel alloc] initWithFrame:CGRectMake(view.center.x-120.0, view.center.y+100.0, 240.0, 30.0)];
    [_schoolLabel setText:@"北京科技大学"];
    [_schoolLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    _schoolLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    [_schoolLabel setTextAlignment:NSTextAlignmentCenter];
    [_schoolLabel setTextColor:[UIColor whiteColor]];
    
    
    [view addSubview:_headerImage];
    [view addSubview:_namelabel];
    [view addSubview:_schoolLabel];
    
   
    return view;
}

#pragma mark - UITableView Delegate & Datasource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return [super tableView:tableView viewForHeaderInSection:section];
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return [super tableView:tableView heightForHeaderInSection:section];
    
    return 0.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger mySections = 1;
    
    return mySections + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 1)
        return 3;
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 82.5;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell.textLabel setTextColor:[UIColor darkGrayColor]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [_array[indexPath.row] valueForKeyPath:@"detailText"];
    cell.detailTextLabel.text = [_array[indexPath.row] valueForKeyPath:@"text"];
    cell.imageView.image = [UIImage imageNamed:[_array[indexPath.row] valueForKeyPath:@"profileImageUrl"]];
    
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    
    
  
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        
        if (_save1 == YES)
        {
            
            
            WriteSelfInfo *write = [[WriteSelfInfo alloc]init];
            write.headImage.image = [HeaderImage shareInstance].image;
            write.save = YES;
            [self.navigationController pushViewController:write animated:YES];
    
            
        }
        
        else if (_save1 == NO)
        {
        
            WriteSelfInfo *write = [[WriteSelfInfo alloc]init];
            write.headImage.image = [HeaderImage shareInstance].image;
           [self.navigationController pushViewController:write animated:YES];

            
        
        }
        
        
    }
    
    if (indexPath.row == 1)
    {
        salaInfo *sale = [[salaInfo alloc]init];
        sale.post = [[Post alloc]init];
        sale.post.DataUrl = @"http://120.27.101.247/Web/api/?url=user/list";
        sale.post.fid = 100;
        sale.post.uid = [AppStatus shareInstance].UserInfo[@"data"][@"user"][@"uid"];
        sale.post.sxtimes = 1;
        sale.post.did = @"0";
        sale.post.fid1 = @"10";
        [self.navigationController pushViewController:sale animated:YES];
    
    
    
    }
    
    if (indexPath.row == 2)
    {
        serviceInfo *service = [[serviceInfo alloc]init];
        [self.navigationController pushViewController:service animated:YES];
        
    }

    NSLog(@"%ld",(long)indexPath.row);


}

@end
