//
//  salaInfo.m
//  易兔
//
//  Created by 李鑫 on 15/4/19.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "salaInfo.h"
#import "GoodDetail.h"
#import "Post.h"
#import "DGoodInfo.h"

@interface salaInfo ()
{

    NSMutableArray *_posts;

}

@end

@implementation salaInfo



-(void)reloadData
{
   [_post infoPostsWithBlock:^(NSMutableArray *posts, NSError *error)
   {
       if (!error)
       {
           _posts = posts;
           NSLog(@"%@",posts);
           NSLog(@"%lu",(unsigned long)_posts.count);
           [self.tableView reloadData];
           
       }
        
       
   }];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"我的发布";
    
    self.view.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.hidden = YES;
    
  
    
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _posts.count;
    // Return the number of rows in the section.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    
    Post *post = _posts[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
    }
    [cell.imageView setImageWithURL:post.picUrl placeholderImage:[UIImage imageNamed:@"image"]];
    cell.textLabel.text = post.title;
    cell.textLabel.font = [UIFont fontWithName:@"Heiti SC" size:14];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.detailTextLabel.frame = CGRectMake(cell.textLabel.frame.origin.x, CGRectGetMaxY(cell.textLabel.frame)+10, cell.textLabel.frame.size.width, cell.textLabel.frame.size.height);
    cell.detailTextLabel.text = post.posttime;
    cell.detailTextLabel.font = [UIFont fontWithName:@"Heiti SC" size:12];
    cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
     
    
    
    return cell;



}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 82.5;


}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GoodDetail *detail = [[GoodDetail alloc]init];
    DGoodInfo *info = [[DGoodInfo alloc]init];
    info.delegate = detail;
    [info.delegate post:_posts[indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];

    NSLog(@"%ld",(long)indexPath.row);



}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView setEditing:YES animated:YES];
    return UITableViewCellEditingStyleDelete;



}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Post *post = _posts[indexPath.row];
    _post.fid1 = post.fid1;
    _post.did = post.did;
    [_posts removeObject:_posts[indexPath.row]];
    [_post infoPostsWithBlock:^(NSMutableArray *posts, NSError *error)
     {
         if (!error)
         {
             _posts = posts;
             
         }
        
    }];
    
    
    

   
    [tableView setEditing:NO animated:YES];
    
    [tableView reloadData];



}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{


return @"删除";

}

@end
