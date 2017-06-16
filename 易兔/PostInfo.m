//
//  PostInfo.m
//  易兔
//
//  Created by 李鑫 on 15/4/12.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "PostInfo.h"
#import "DataPicker.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "nextOfPostInfo.h"



@interface PostInfo ()<PickerViewDelegate>
{
    DataPicker *pickerView;
    NSArray *_schoolArray;
    NSArray *_goodArray;
    NSArray *_saleArray;

}

@end

@implementation PostInfo

@synthesize delegate = _delegate;

-(void)changeContentViewPosition:(NSNotification *)notification
{
    
        NSDictionary *userInfo=[notification userInfo];
        _duration =[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        
        
        
        [UIView animateWithDuration:_duration.doubleValue
                         animations:^{
                             
                             _headerView.frame =  CGRectMake(0, -140, CGRectGetWidth(self.view.frame), self.view.frame.size.height);
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        
}


-(void)keyboardhide:(NSNotification *)notification
{
    
    [UIView animateWithDuration:_duration.doubleValue
                     animations:^{
                         
                         _headerView.frame =  CGRectMake(0, 0, CGRectGetWidth(self.view.frame), self.view.frame.size.height);
                       
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
    
    
    
}


    
    





-(id)init
{
    self = [super init];
    if (self)
        
    {
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeContentViewPosition:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter]  addObserver:self
                                                  selector:@selector(keyboardhide:) name:UIKeyboardWillHideNotification object:nil];

        
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(0, 0, 60, 40);
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextButton setTintColor:[UIColor whiteColor]];
        _nextButton.titleLabel.font = [UIFont systemFontOfSize:19];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_nextButton];
        [_nextButton addTarget:self
                        action:@selector(NextPostInfo) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = rightItem;
        
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), self.view.frame.size.height)];
        _headerView.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1];

        [self.view addSubview:_headerView];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_headerView.frame.size.width/2-50, 90, 100, 100)];
        _imageView.layer.borderWidth = 2;
        _imageView.layer.borderColor = [UIColor colorWithRed:152.f/255.0f green:245.0f/255.0f blue:255.0f/255.0f alpha:0.6].CGColor;

        _imageView.layer.cornerRadius = _imageView.frame.size.width/2;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.image = [UIImage imageNamed:@"3.png"];
        _pickImage = [UIButton buttonWithType:UIButtonTypeCustom];
        _pickImage.frame = CGRectMake(_headerView.frame.size.width/2-50, 90, 100, 100);
        _pickImage.layer.cornerRadius = _pickImage.frame.size.width/2;
        [_pickImage addTarget:self
                          action:@selector(chooseImage)
                forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:_pickImage];
        [_headerView addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headerView.frame.size.width/2-20, CGRectGetMaxY(_imageView.frame)+10, 40, 40)];
        _titleLabel.text = @"标题";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        [_headerView addSubview:_titleLabel];
        
        _titleTextfield = [[UITextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_titleLabel.frame)+10, _headerView.frame.size.width-80, 30)];
        _titleTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _titleTextfield.textAlignment = NSTextAlignmentCenter;
        _titleTextfield.font = [UIFont systemFontOfSize:18];
        _titleTextfield.borderStyle = UITextBorderStyleNone;
        _titleTextfield.textColor = [UIColor darkGrayColor];
        _titleTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18];
        [_headerView addSubview:_titleTextfield];
        
        _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_titleTextfield.frame), _headerView.frame.size.width-40, 1.0)];
        _underline1.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        [_headerView addSubview:_underline1];
        
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headerView.frame.size.width/2-20, CGRectGetMaxY(_underline1.frame)+5, 40, 40)];
        _priceLabel.text = @"价格";
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _priceLabel.font = [UIFont boldSystemFontOfSize:20];
        _priceLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        [_headerView addSubview:_priceLabel];
        
        _priceTextfield = [[UITextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_priceLabel.frame)+10, _headerView.frame.size.width-80, 30)];
        _priceTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _priceTextfield.textAlignment = NSTextAlignmentCenter;
        _priceTextfield.font = [UIFont systemFontOfSize:18];
        _priceTextfield.borderStyle = UITextBorderStyleNone;
        _priceTextfield.keyboardType = UIKeyboardTypeNumberPad;
        _priceTextfield.textColor = [UIColor darkGrayColor];
        _priceTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18];
        [_headerView addSubview:_priceTextfield];
        
        _underline2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_priceTextfield.frame), _headerView.frame.size.width-40, 1.0)];
        _underline2.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        [_headerView addSubview:_underline2];
        
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headerView.frame.size.width/2-20, CGRectGetMaxY(_underline2.frame)+5, 40, 40)];
        _detailLabel.text = @"描述";
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _detailLabel.font = [UIFont boldSystemFontOfSize:20];
        _detailLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        [_headerView addSubview:_detailLabel];
        
        _detailTextfield = [[UITextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_detailLabel.frame)+10, _headerView.frame.size.width-80, 30)];
        _detailTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
        _detailTextfield.textAlignment = NSTextAlignmentCenter;
        _detailTextfield.font = [UIFont systemFontOfSize:18];
        _detailTextfield.borderStyle = UITextBorderStyleNone;
        _detailTextfield.textColor = [UIColor darkGrayColor];
        _detailTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18];
        [_headerView addSubview:_detailTextfield];
        
        
        _underline3 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_detailTextfield.frame), _headerView.frame.size.width-40, 1.0)];
        _underline3.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.8];
        [_headerView addSubview:_underline3];

        


        
        
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        

        
    }

    return self;

}

-(void)chooseImage
{

    [_titleTextfield resignFirstResponder];
    [_priceTextfield resignFirstResponder];
    [_detailTextfield resignFirstResponder];
    UIActionSheet *sheet;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sheet =[[UIActionSheet alloc]initWithTitle:@"选择"
                                          delegate:self
                                 cancelButtonTitle:@"取消"
                            destructiveButtonTitle:nil
                                 otherButtonTitles:@"拍照",@"从相册选择", nil];
        
    }
    
    else
    {
        
        sheet =[[UIActionSheet alloc]initWithTitle:@"选择"
                                          delegate:self
                                 cancelButtonTitle:@"取消"
                            destructiveButtonTitle:nil
                                 otherButtonTitles:@"从相册选择", nil];
        
        
    }
    
    sheet.tag=250;
    [sheet showInView:self.view];
    
    
    
    
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (actionSheet.tag==250) {
        
        NSUInteger sourceType=0;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    
                case 1:
                    sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                    
                case 2:
                    return;
                    break;
                    
            }
            
        }
        
        else {
            if (buttonIndex==0) {
                
                sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                
            }
            
            else{
                return;
                
            }
            
        }
        
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        
        picker.delegate=self;
        picker.allowsEditing=YES;
        picker.sourceType=sourceType;
        [self presentViewController:picker
                           animated:YES
                         completion:^{
                             
                         }];
        
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image=[[UIImage alloc]init];
    image=nil;
    image=[info objectForKey:UIImagePickerControllerOriginalImage];
    _imageView.image=image;
    self.tabBarController.tabBar.hidden=YES;
    [_pickImage setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [_titleTextfield resignFirstResponder];
    [_priceTextfield resignFirstResponder];
    [_detailTextfield resignFirstResponder];


}

-(void)pickerViewDidClickConfirm:(NSString *)confirmString
{

   
   


}



-(void)NextPostInfo
{
    
    NSData *data = UIImageJPEGRepresentation(_imageView.image,0.5);
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF16StringEncoding];
    
    if (dataString.length>0&&_titleTextfield.text.length>0&&_priceTextfield.text.length>0&&_detailTextfield.text.length>0)
    {
        
        nextOfPostInfo *nextView = [[nextOfPostInfo alloc]init];
        NSArray * infoArray = @[data,_titleTextfield.text,_priceTextfield.text,_detailTextfield.text];
        self.delegate = nextView;
        [_delegate postInfo:infoArray];
        [self.navigationController pushViewController:nextView
                                             animated:YES];
        
               }
    
    else
    
    {
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
    message:@"请完善商品信息"
    delegate:self
    cancelButtonTitle:@"好的"
                                              otherButtonTitles: nil];
        [self.view addSubview:alert];
        [alert show];
    
    
    }
    
    

}

-(void)pickerRow:(NSInteger)row
{


}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:animated];
    
    NSString *string = [[NSBundle mainBundle]pathForResource:@"School" ofType:@"plist"];
    _schoolArray = [NSArray arrayWithContentsOfFile:string];
    
    NSString *string2 = [[NSBundle mainBundle]pathForResource:@"goodsType" ofType:@"plist"];
    _goodArray = [NSArray arrayWithContentsOfFile:string2];
    
    _saleArray = @[@"转让",@"求购"];
    
    
    pickerView.delegate = self;

    self.title = @"商品信息";
    
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

- (void)viewDidLoad
{
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
