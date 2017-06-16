//
//  GoodDetail.m
//  易兔
//
//  Created by 李鑫 on 15/4/18.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "GoodDetail.h"
#import "Post.h"

@interface GoodDetail ()

@end

@implementation GoodDetail

-(id)init
{
    self = [super init];
    if (self)
    {
        
    
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, CGRectGetHeight(_scrollView.frame)*1.1);
        _scrollView.backgroundColor = [UIColor whiteColor];
        
        
        
        
        [self.view addSubview:_scrollView];
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        
        [self.scrollView addSubview:_headerView];
        
        _headerView.backgroundColor = [UIColor whiteColor];
        
        _GoodImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, _headerView.frame.size.width-20, _headerView.frame.size.height-20)];
        _GoodImage.layer.cornerRadius = 6;
        _GoodImage.clipsToBounds = YES;
        _GoodImage.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        [self.headerView addSubview:_GoodImage];
        
        
        _InfoView = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_headerView.frame), self.view.frame.size.width-20, 240)];
        _InfoView.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];
        _InfoView.layer.cornerRadius = 6;
        _InfoView.clipsToBounds = YES;
        [_scrollView addSubview:_InfoView];
        
        _headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-45, CGRectGetMaxY(_GoodImage.frame)-45, 90, 90)];
        _headerImage.layer.cornerRadius = _headerImage.frame.size.width/2;
        _headerImage.clipsToBounds = YES;
        _headerImage.layer.borderWidth = 1;
        _headerImage.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1].CGColor;
        [_scrollView addSubview:_headerImage];
        
        _placeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-140,50, 280, 40)];
        //_placeLabel.backgroundColor = [UIColor blueColor];
        _placeLabel.textColor = [UIColor grayColor];
        _placeLabel.adjustsFontSizeToFitWidth = YES;
        _placeLabel.textAlignment = NSTextAlignmentCenter;
        [_InfoView addSubview:_placeLabel];
        
        _placeImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35, 30, 30)];
        _placeImage.clipsToBounds = YES;
        _placeImage.image = [UIImage imageNamed:@"详情"];
        //_placeImage.layer.borderColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.80].CGColor;
        //_placeImage.layer.borderWidth = 1;
        _placeImage.layer.cornerRadius = _placeImage.frame.size.width/2;
        [_InfoView addSubview:_placeImage];
        
        
        _phoneNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-140,CGRectGetMaxY(_placeLabel.frame)+25, 280, 40)];
        //_phoneNumLabel.backgroundColor = [UIColor blueColor];
        _phoneNumLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        _phoneNumLabel.textColor = [UIColor grayColor];
        _phoneNumLabel.textAlignment = NSTextAlignmentCenter;
        [_InfoView addSubview:_phoneNumLabel];
        
        _phoneNumImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(_placeLabel.frame)+10, 30, 30)];
        _phoneNumImage.clipsToBounds = YES;
        //_phoneNumImage.layer.borderColor = [UIColor orangeColor].CGColor;
        _phoneNumImage.image = [UIImage imageNamed:@"电话"];
        //_phoneNumImage.layer.borderWidth = 1;
        _phoneNumImage.layer.cornerRadius = _phoneNumImage.frame.size.width/2;
        [_InfoView addSubview:_phoneNumImage];
        
        
        
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-125,CGRectGetMaxY(_phoneNumLabel.frame)+25, 70, 40)];
        //_priceLabel.backgroundColor = [UIColor blueColor];
        _priceLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        _priceLabel.textColor = [UIColor grayColor];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        [_InfoView addSubview:_priceLabel];
        
        _priceImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(_phoneNumLabel.frame)+10, 30, 30)];
        _priceImage.clipsToBounds = YES;
       // _priceImage.layer.borderColor = [UIColor greenColor].CGColor;
        _priceImage.image = [UIImage imageNamed:@"价格"];
       //_priceImage.layer.borderWidth = 1;
        _priceImage.layer.cornerRadius = _priceImage.frame.size.width/2;
        [_InfoView addSubview:_priceImage];
        
        _schoolLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_priceLabel.frame)+20,CGRectGetMaxY(_phoneNumLabel.frame)+25, 100, 40)];
        //_schoolLabel.backgroundColor = [UIColor blueColor];
        _schoolLabel.textAlignment = NSTextAlignmentCenter;
        _schoolLabel.font = [UIFont systemFontOfSize:15];
        _schoolLabel.textColor = [UIColor grayColor];
        _schoolLabel.text = @"北京科技大学";
        [_InfoView addSubview:_schoolLabel];
        
        _schoolImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_priceLabel.frame)-10, CGRectGetMaxY(_phoneNumLabel.frame)+10, 30, 30)];
        _schoolImage.clipsToBounds = YES;
        //_schoolImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _schoolImage.image = [UIImage imageNamed:@"学校"];
        //_schoolImage.layer.borderWidth = 1;
        _schoolImage.layer.cornerRadius = _schoolImage.frame.size.width/2;
        [_InfoView addSubview:_schoolImage];
        
        
        _TypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_schoolLabel.frame),CGRectGetMaxY(_phoneNumLabel.frame)+25, 80, 40)];
        //_TypeLabel.backgroundColor = [UIColor blueColor];
        _TypeLabel.font = [UIFont systemFontOfSize:15];
        _TypeLabel.textColor = [UIColor grayColor];
        _TypeLabel.textAlignment = NSTextAlignmentCenter;
        _TypeLabel.text = self.title;
        [_InfoView addSubview:_TypeLabel];
//        
        _TypeImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_schoolLabel.frame)-10, CGRectGetMaxY(_phoneNumLabel.frame)+10, 30, 30)];
        _TypeImage.clipsToBounds = YES;
    // _TypeImage.layer.borderColor = [UIColor grayColor].CGColor;
       // _TypeImage.layer.borderWidth = 1;
        //_TypeImage.image = [UIImage imageNamed:@"类型"];
        _TypeImage.layer.cornerRadius = _TypeImage.frame.size.width/2;
        [_InfoView addSubview:_TypeImage];
        
        _detailText = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_InfoView.frame)+20, self.view.frame.size.width-40, 200)];
        _detailText.allowsEditingTextAttributes = NO;
        _detailText.editable = NO;
        _detailText.font = [UIFont fontWithName:@"Heiti SC" size:20];
        _detailText.textColor = [UIColor grayColor];
        _detailText.textAlignment = NSTextAlignmentCenter;
        
        //_detailText.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:_detailText];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    return self;



}

-(void)post:(Post *)detail
{
    _phoneNumLabel.text = detail.mobPhone;
    _placeLabel.text = detail.title;
   // NSLog(@"%@",detail.mobPhone);
    [_headerImage setImageWithURL:detail.touxiang placeholderImage:[UIImage imageNamed:@"touxiang"]];
    _priceLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)detail.money];
    _detailLabel.text = detail.fname;
    [_GoodImage setImageWithURL:detail.picUrl placeholderImage:[UIImage imageNamed:@"image"]];
    _detailText.text = detail.content;
//    _TypeLabel.text = detail.uid;
//    NSLog(@"%@",detail);
    


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.title = @"商品信息";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.hidden = YES;



}

-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];


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
