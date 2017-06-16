//
//  nextOfPostInfo.m
//  易兔
//
//  Created by 李鑫 on 15/4/12.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "nextOfPostInfo.h"
#import "DataPicker.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "PostInfo.h"
#import "JGProgressHUD.h"
#import "AppStatus.h"

@interface nextOfPostInfo ()<PickerViewDelegate,postInfo>

{
    NSArray *_goodTypeArray;
    DataPicker *_dataPicker;
    NSArray *info;
    JGProgressHUD *_hud;
    NSDictionary *dic1;
    NSDictionary *User;
    NSDictionary *dic;
    
  

}

@end

@implementation nextOfPostInfo



-(void)setinfoArray:(NSArray *)infoArray
{

    _infoArray = infoArray;



}

-(void)postInfo:(NSArray *)postArray
{

    
    _infoArray = [[NSArray alloc]init];
    
    _infoArray = postArray;
    
    


}

-(id)init
{
    self = [super init];
    if (self)
        
    {
        dic1 = [AppStatus shareInstance].UserInfo[@"data"];
        User = [dic1 valueForKeyPath:@"user"];
        

        _hud = [[JGProgressHUD alloc]initWithStyle:JGProgressHUDStyleDark];
        _postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _postButton.frame = CGRectMake(0, 0, 40, 40);
        [_postButton setTitle:@"发布" forState:UIControlStateNormal];
        [_postButton setTintColor:[UIColor whiteColor]];
        _postButton.titleLabel.font = [UIFont systemFontOfSize:19];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_postButton];
        [_postButton addTarget:self
                        action:@selector(PostInfo) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = rightItem;
        
        
        _headerView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), self.view.frame.size.height-64)];
        _headerView1.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];

        [self.view addSubview:_headerView1];
        
        _goodType = [[UITextField alloc]initWithFrame:CGRectMake(_headerView1.frame.size.width/2-75, 30, 150, 40)];
        _goodType.layer.cornerRadius = 16;
        _goodType.placeholder =@"选择分类";
        _goodType.font = [UIFont boldSystemFontOfSize:20];
        _goodType.font = [UIFont fontWithName:@"Heiti SC" size:20];
        _goodType.layer.borderWidth = 2;
        _goodType.layer.borderColor =[UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1].CGColor;
        _goodType.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        _goodType.textAlignment = NSTextAlignmentCenter;
        
        [_headerView1 addSubview:_goodType];
        
        _pickTypeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pickTypeButton.frame = CGRectMake(_headerView1.frame.size.width/2-75, 30, 150, 40);
        _pickTypeButton.layer.cornerRadius = 16;
        
        
        [_pickTypeButton addTarget:self
                            action:@selector(pickgoodType)
                  forControlEvents:UIControlEventTouchUpInside];
        
        [_headerView1 addSubview:_pickTypeButton];
        
        _PlaceLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headerView1.frame.size.width/2-50, CGRectGetMaxY(_pickTypeButton.frame)+20, 100, 40)];
        _PlaceLabel.text = @"交易地点";
        _PlaceLabel.textAlignment = NSTextAlignmentCenter;
        _PlaceLabel.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _PlaceLabel.font = [UIFont boldSystemFontOfSize:16];
        _PlaceLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        [_headerView1 addSubview:_PlaceLabel];
        
        _placeTextfield = [[UITextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_PlaceLabel.frame)+10, _headerView1.frame.size.width-80, 30)];
        _placeTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _placeTextfield.textAlignment = NSTextAlignmentCenter;
        _placeTextfield.font = [UIFont systemFontOfSize:14];
        _placeTextfield.borderStyle = UITextBorderStyleNone;
        _placeTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18];
        _placeTextfield.textColor = [UIColor darkGrayColor];
        [_headerView1 addSubview:_placeTextfield];

        
        _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_placeTextfield.frame), _headerView1.frame.size.width-40, 1.0)];
        _underline1.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        [_headerView1 addSubview:_underline1];
        
        _PhoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headerView1.frame.size.width/2-50, CGRectGetMaxY(_underline1.frame)+20, 100, 40)];
        _PhoneLabel.text = @"手机号码";
        _PhoneLabel.textAlignment = NSTextAlignmentCenter;
        _PhoneLabel.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _PhoneLabel.font = [UIFont boldSystemFontOfSize:20];
        _PhoneLabel.font = [UIFont fontWithName:@"Heiti SC" size:18];
       
        [_headerView1 addSubview:_PhoneLabel];
        
        _PhoneTextfield = [[UITextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_PhoneLabel.frame)+10, _headerView1.frame.size.width-80, 30)];
        _PhoneTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _PhoneTextfield.textAlignment = NSTextAlignmentCenter;
        _PhoneTextfield.font = [UIFont systemFontOfSize:14];
        _PhoneTextfield.borderStyle = UITextBorderStyleNone;
        _PhoneTextfield.keyboardType = UIKeyboardTypeNumberPad;
        _PhoneTextfield.font = [UIFont fontWithName:@"Heiti SC" size:20];
        _PhoneTextfield.textColor = [UIColor darkGrayColor];
        [_headerView1 addSubview:_PhoneTextfield];
        
        _underline2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_PhoneTextfield.frame), _headerView1.frame.size.width-40, 1.0)];
        _underline2.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        [_headerView1 addSubview:_underline2];

        
        

        
        

        
        

        
        
        

        
        

    }
    
    return self;
   

}

-(void)pickgoodType
{
   
    [_dataPicker hidePicker];
    [_goodType resignFirstResponder];
    [_PhoneTextfield resignFirstResponder];
    
    _dataPicker = [[DataPicker alloc]initWithDataArray:_goodTypeArray
                                                 rowHeight:50
                                                  delegate:self
                                              delegeteView:self.view];
        
        [_dataPicker pushPicker];

        
    
}

-(void)pickerViewDidClickConfirm:(NSString *)confirmString
{
    
        _goodType.text = confirmString;
        [_dataPicker hidePicker];
    

}

-(void)pickerRow:(NSInteger)row
{
    
    switch (row) {
        case 0:
            _fid = [NSString stringWithFormat:@"%d",178];
            break;
            
        case 1:
            _fid = [NSString stringWithFormat:@"%d",174];
            break;
            
        case 2:
            _fid = [NSString stringWithFormat:@"%d",208];
            break;
            
        case 3:
            _fid = [NSString stringWithFormat:@"%d",26];
            break;
            
        case 4:
            _fid = [NSString stringWithFormat:@"%d",173];
            break;
            
        case 5:
            _fid = [NSString stringWithFormat:@"%d",30];
            break;

        case 6:
            _fid = [NSString stringWithFormat:@"%d",43];
            break;
            
        case 7:
            _fid = [NSString stringWithFormat:@"%d",207];
            break;

        case 8:
            _fid = [NSString stringWithFormat:@"%d",341];
            break;

            
        default:
            break;
    }


}


-(void)PostInfo
{
     [_hud showInView:_headerView1];
    [_placeTextfield resignFirstResponder];
    [_PhoneTextfield resignFirstResponder];
    [_dataPicker hidePicker];
    
    if (_goodType.text.length>0&&_placeTextfield.text.length>0&&_PhoneTextfield.text.length==11)
    {
        
        
        NSDictionary *infoDic = @{@"uid":User[@"uid"],@"fid":_fid,@"username":User[@"username"],@"title":_infoArray[1],@"jiage":_infoArray[2],@"content":_infoArray[3],@"test":_infoArray[0],@"mobphone":_PhoneTextfield.text,@"address":User[@"address"],@"cityid":@"1"
                                  };
        //NSLog(@"%@",infoDic);
       
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager POST:@"http://120.27.101.247/Web/api/?url=post"
           parameters:infoDic success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            
            NSData *message = responseObject;
            NSDictionary *_str;
            NSString *success;
            int number;
            dic = [NSJSONSerialization JSONObjectWithData:message
                                                  options:NSJSONReadingMutableContainers
                                                    error:nil];
            _str = [dic valueForKeyPath:@"status"];
            success = _str[@"succeed"];
            number =[success intValue];
            
            
            if(number == 1)
            {
                
                [_hud dismiss];
                
                [self.navigationController popToRootViewControllerAnimated:YES];
            
                
                _alertview=[[UIAlertView alloc]initWithTitle:@"提示"
                                                     message:@"发布成功"
                                                    delegate:self
                                           cancelButtonTitle:@"好的"
                                           otherButtonTitles:nil];
                [self.view addSubview:_alertview];
                [_alertview show];
                
                
                
                
                
            }
            
            else
            {
                [_hud dismiss];
                _alertview=[[UIAlertView alloc]initWithTitle:@"提示"
                                                     message:@"发布错误"
                                                    delegate:self
                                           cancelButtonTitle:@"好的"
                                           otherButtonTitles:nil];
                [self.view addSubview:_alertview];
                [_alertview show];
                
            }
            
            

            
           // NSLog(@"%@",responseObject);
            
           
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             
             [_hud dismiss];

        
         }];

        
    }
    
    if (_goodType.text.length>0&&_placeTextfield.text.length>0&&_PhoneTextfield.text.length<11)
    {
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:@"请输入正确的手机位数"
                                                      delegate:self
                                             cancelButtonTitle:@"好的"
                                             otherButtonTitles: nil];
        [self.view addSubview:alert];
        [alert show];
        [_hud dismiss];

    
    
    
    }
    
    else if(_goodType.text.length==0||_placeTextfield.text.length==0||_PhoneTextfield.text.length==0)
    {
        [_hud dismiss];
       _alertview = [[UIAlertView alloc]initWithTitle:@"提示"
    message:@"请完善信息"
    delegate:self
    cancelButtonTitle:@"好的"
                                    otherButtonTitles: nil];
        [self.view addSubview:_alertview];
        [_alertview show];
        
    
    
    }

    
//    if (_goodType.text.length>0||_placeTextfield.text.length>0||_PhoneTextfield.text.length==0)
//        
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
//                                                       message:@"请完善商品信息"
//                                                      delegate:self
//                                             cancelButtonTitle:@"好的"
//                                             otherButtonTitles: nil];
//        [self.view addSubview:alert];
//        [alert show];
//        [_hud dismiss];
//        
//        
//    }

    
    
    
   }


-(void)postTo
{
  

//   NSDictionary *infoDic = @{@"imagedata":_infoArray[0],@"title":_infoArray[1],@"price":_infoArray[2],@"detail":_infoArray[3],@"goodType":_goodType.text,@"saleplace":_placeTextfield.text,@"phone":_PhoneTextfield.text};
//    NSLog(@"%@",infoDic);
//    
//    [_hud dismiss];
    


}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_dataPicker hidePicker];
    [_placeTextfield resignFirstResponder];
    [_PhoneTextfield resignFirstResponder];


}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
        
    
    NSString *string = [[NSBundle  mainBundle]pathForResource:@"goodsType" ofType:@"plist"];
    
    _goodTypeArray = [NSArray arrayWithContentsOfFile:string];
    
    
    
    self.title = @"商品信息";
    
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
