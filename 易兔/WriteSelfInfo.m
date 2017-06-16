//
//  WriteSelfInfo.m
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "WriteSelfInfo.h"
#import "DataPicker.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "JGProgressHUD.h"
#import "AppStatus.h"
#import "HeaderImage.h"

@interface WriteSelfInfo ()<PickerViewDelegate>
{
    DataPicker *pickerView;
    NSArray *_schoolArray;
    NSArray *_sexArray;
    JGProgressHUD *hud;
    NSDictionary *dic;
    NSDictionary *dic1;
    NSDictionary *User;

}

@end

@implementation WriteSelfInfo




#pragma mark - chooseImage

-(void)chooseImage
{
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
    //_headImage.image = [UIImage imageNamed:@""];
    image=[info objectForKey:UIImagePickerControllerOriginalImage];
    _headImage.image = image;
    self.tabBarController.tabBar.hidden=YES;
    [_chooseButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


-(id)init
{
    self = [super init];
    if (self)
    {
        
        
        
        
        dic1 = [AppStatus shareInstance].UserInfo;
        User = dic1[@"data"][@"user"];
        
        NSLog(@"%@",User);
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 100)];
        _headerView.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.2];
        [self.view addSubview:_headerView];
        
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(_headerView.frame.size.width/2 -40,10, 80, 80)];
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        _headImage.clipsToBounds = YES;
        _headImage.layer.borderWidth = 2;
        _headImage.layer.borderColor = [UIColor whiteColor].CGColor;
        _headImage.image = [HeaderImage shareInstance].image;
        _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
        [_headerView addSubview:_headImage];

        
        //self.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.95 alpha:0.4];
//
//        NSString *string = [[NSBundle mainBundle]pathForResource:@"School" ofType:@"plist"];
//        _schoolArray = [NSArray arrayWithContentsOfFile:string];
//        
//        _sexArray = @[@"男",@"女"];
//
//        
//
//        
//        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 100)];
//        _headerView.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:0.2];
//        [self.view addSubview:_headerView];
//        
//        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(_headerView.frame.size.width/2 -40,10, 80, 80)];
//        _headImage.contentMode = UIViewContentModeScaleAspectFill;
//        _headImage.clipsToBounds = YES;
//        _headImage.image = [UIImage imageNamed:@"example"];
//        _headImage.layer.borderWidth = 2;
//        _headImage.layer.borderColor = [UIColor whiteColor].CGColor;
//        _headImage.layer.cornerRadius = 6;
//        [_headerView addSubview:_headImage];
//        
//        _chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _chooseButton.frame = CGRectMake(_headerView.frame.size.width/2 -40,10, 80, 80);
//        
//        [_chooseButton addTarget:self
//                          action:@selector(chooseImage)
//                forControlEvents:UIControlEventTouchUpInside];
//        [_headerView addSubview:_chooseButton];
//        
//
//        
//        
//        _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), CGRectGetWidth(self.view.frame), 0.5)];
//        _underline1.image = [UIImage imageNamed:@"login_bt_back"];
//        [self.view addSubview:_underline1];
//        
//        _InfoView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline1.frame), CGRectGetWidth(self.view.frame), 200)];
//        _InfoView.backgroundColor = [UIColor whiteColor];
//        [self.view addSubview:_InfoView];
//        
//        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(42, 15, 50, 20)];
//        _nameLabel.text = @"昵  称";
//        
//        _nameLabel.textAlignment = NSTextAlignmentLeft;
//        _nameLabel.font = [UIFont systemFontOfSize:18];
//        _nameLabel.textColor = [UIColor darkGrayColor];
//        [_InfoView addSubview:_nameLabel];
//        
//        _nameTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, 15, 200, 20)];
//        _nameTextfield.textColor = [UIColor darkGrayColor];
//        _nameTextfield.font = [UIFont systemFontOfSize:18];
//        _nameTextfield.textAlignment = NSTextAlignmentLeft;
//        _nameTextfield.borderStyle = UITextBorderStyleNone;
//        _nameTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
//        _nameTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _nameTextfield.text = User[@"truename"];
//        [self.InfoView addSubview:_nameTextfield];
//        
//        _underline2 = [[UIImageView alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(_nameTextfield.frame)+15, CGRectGetWidth(self.view.frame)-32, 0.5)];
//        _underline2.image = [UIImage imageNamed:@"login_bt_back"];
//        [self.InfoView addSubview:_underline2];
//        
//        _sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(44, CGRectGetMaxY(_underline2.frame)+15, 50, 20)];
//        _sexLabel.text =@"性  别";
//        _sexLabel.textAlignment = NSTextAlignmentLeft;
//        _sexLabel.font = [UIFont systemFontOfSize:18];
//        _sexLabel.textColor = [UIColor darkGrayColor];
//        [_InfoView addSubview:_sexLabel];
//        
//        _sexTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, self.underline2.frame.origin.y +15 , 200, 20)];
//        _sexTextfield.textColor = [UIColor darkGrayColor];
//        _sexTextfield.font = [UIFont systemFontOfSize:18];
//        _sexTextfield.textAlignment = NSTextAlignmentLeft;
//        _sexTextfield.borderStyle = UITextBorderStyleNone;
//        _sexTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
//        _sexTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _sexTextfield.keyboardType = UIKeyboardTypeNumberPad;
//        [self.InfoView addSubview:_sexTextfield];
//
//        
//        _sexButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _sexButton.frame = CGRectMake(100, self.underline2.frame.origin.y +15 , 200, 20);
//        
//        [_sexButton addTarget:self
//                          action:@selector(pickSex) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        
//        [self.InfoView addSubview:_sexButton];
//        
//
//        
//        _underline3 = [[UIImageView alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(_sexLabel.frame)+15, CGRectGetWidth(self.view.frame)-32, 0.5)];
//        _underline3.image = [UIImage imageNamed:@"login_bt_back"];
//        [self.InfoView addSubview:_underline3];
//        
//        _phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(44, CGRectGetMaxY(_underline3.frame)+15, 50, 20)];
//        _phoneNumber.text =@"电  话";
//        _phoneNumber.textAlignment = NSTextAlignmentLeft;
//        _phoneNumber.font = [UIFont systemFontOfSize:18];
//        _phoneNumber.textColor = [UIColor darkGrayColor];
//        [_InfoView addSubview:_phoneNumber];
//        
//        _phoneTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, self.underline3.frame.origin.y +15 , 200, 20)];
//        _phoneTextfield.textColor = [UIColor darkGrayColor];
//        _phoneTextfield.font = [UIFont systemFontOfSize:18];
//        _phoneTextfield.textAlignment = NSTextAlignmentLeft;
//        _phoneTextfield.borderStyle = UITextBorderStyleNone;
//        _phoneTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
//        _phoneTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _phoneTextfield.text = User[@"mobphone"];
//        _phoneTextfield.keyboardType = UIKeyboardTypeNumberPad;
//        [self.InfoView addSubview:_phoneTextfield];
//        
//        _underline4 = [[UIImageView alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(_phoneNumber.frame)+15, CGRectGetWidth(self.view.frame)-32, 0.5)];
//        _underline4.image = [UIImage imageNamed:@"login_bt_back"];
//        [self.InfoView addSubview:_underline4];
//        
//        _schoolLabel = [[UILabel alloc]initWithFrame:CGRectMake(44, CGRectGetMaxY(_underline4.frame)+15, 50, 20)];
//        _schoolLabel.text =@"学  校";
//        _schoolLabel.textAlignment = NSTextAlignmentLeft;
//        _schoolLabel.font = [UIFont systemFontOfSize:18];
//        _schoolLabel.textColor = [UIColor darkGrayColor];
//        [_InfoView addSubview:_schoolLabel];
//        
//        _underline5 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_InfoView.frame), CGRectGetWidth(self.view.frame), 0.5)];
//        _underline5.image = [UIImage imageNamed:@"login_bt_back"];
//        [self.view addSubview:_underline5];
//        
//        
//        _schoolTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, self.underline4.frame.origin.y +15 , 200, 20)];
//        _schoolTextfield.textColor = [UIColor darkGrayColor];
//        _schoolTextfield.font = [UIFont systemFontOfSize:18];
//        _schoolTextfield.textAlignment = NSTextAlignmentLeft;
//        _schoolTextfield.borderStyle = UITextBorderStyleNone;
//        _schoolTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
//        _schoolTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _schoolTextfield.keyboardType = UIKeyboardTypeNumberPad;
//    
//        [self.InfoView addSubview:_schoolTextfield];
//        
//        _schoolButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _schoolButton.frame = CGRectMake(100, self.underline4.frame.origin.y +15 , 200, 20);
//        
//        [_schoolButton addTarget:self
//                          action:@selector(pickSchool) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        
//        [self.InfoView addSubview:_schoolButton];
//
//     
//        
//        
//        _nameCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _nameCbutton.frame = CGRectMake(16, 15, 20, 20);
//        _nameCbutton.backgroundColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
//        [_nameCbutton.layer setCornerRadius:_nameCbutton.frame.size.width/2.0];
//        _nameCbutton.enabled = NO;
//        
//        [self.InfoView addSubview:_nameCbutton];
//        
//        _sexCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _sexCbutton.frame = CGRectMake(16,CGRectGetMaxY(_underline2.frame)+15, 20, 20);
//        _sexCbutton.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1];
//        [_sexCbutton.layer setCornerRadius:_sexCbutton.frame.size.width/2.0];
//        _sexCbutton.enabled = NO;
//        
//        [self.InfoView addSubview:_sexCbutton];
//        
//        _phoneCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _phoneCbutton.frame = CGRectMake(16,  CGRectGetMaxY(_underline3.frame)+15, 20, 20);
//        _phoneCbutton.backgroundColor = [UIColor colorWithRed:0.8 green:0.6 blue:0.8 alpha:1];
//        [_phoneCbutton.layer setCornerRadius:_phoneCbutton.frame.size.width/2.0];
//        _phoneCbutton.enabled = NO;
//        
//        [self.InfoView addSubview:_phoneCbutton];
//        
//        
//        _schoolCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _schoolCbutton.frame = CGRectMake(16, CGRectGetMaxY(_underline4.frame)+15, 20, 20);
//        _schoolCbutton.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:0.4 alpha:1];
//        [_schoolCbutton.layer setCornerRadius:_schoolCbutton.frame.size.width/2.0];
//        _schoolCbutton.enabled = NO;
//        
//        [self.InfoView addSubview:_schoolCbutton];
//        
//        
//
//        
//        
        
        
        
    }
    
    return self;



}
-(void)pickSex
{
    [pickerView hidePicker];
    [_nameTextfield resignFirstResponder];
    [_phoneTextfield resignFirstResponder];
    
    NSNotification *sex = [NSNotification notificationWithName:@"sex" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:sex];
    
    
    pickerView = [[DataPicker alloc]initWithDataArray:_sexArray
                                            rowHeight:50
                                             delegate:self
                                         delegeteView:self.view];
    [pickerView pushPicker];



}

-(void)pickerViewDidClickConfirm:(NSString *)confirmString
{
    
    if (_choose == YES)
    {
         _sexTextfield.text = confirmString;
        
    }
    
    else if (_choose == NO)
    {
    _schoolTextfield.text = confirmString;
   
    }

}


-(void)pickSchool
{
    [pickerView hidePicker];
    [_nameTextfield resignFirstResponder];
    [_phoneTextfield resignFirstResponder];
    
     NSNotification *school = [NSNotification notificationWithName:@"school" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:school];
    

    pickerView = [[DataPicker alloc]initWithDataArray:_schoolArray
                                            rowHeight:50
                                             delegate:self
                                         delegeteView:self.view];
    [pickerView pushPicker];


}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_nameTextfield resignFirstResponder];
    [_phoneTextfield resignFirstResponder];
    [pickerView hidePicker];


}

-(void)sex
{

    _choose = YES;


}

-(void)school
{

    _choose = NO;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_save == YES)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *plistPath = [paths objectAtIndex:0];
        NSString *fileName = [plistPath stringByAppendingString:@"dic.plist"];
        NSLog(@"%@",fileName);
        
        NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:fileName];
        NSLog(@"%@",data);
        dic1 = data[@"data"];
        User = [dic1 valueForKeyPath:@"user"];
        NSLog(@"%@",data);
        
        
    }
    
    
    

    
    
    NSString *string = [[NSBundle mainBundle]pathForResource:@"School" ofType:@"plist"];
    _schoolArray = [NSArray arrayWithContentsOfFile:string];
    
    _sexArray = @[@"男",@"女"];
    
    
    
    
    
    _chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _chooseButton.frame = CGRectMake(_headerView.frame.size.width/2 -40,10, 80, 80);
    
    [_chooseButton addTarget:self
                      action:@selector(chooseImage)
            forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:_chooseButton];
    
    
    
    
    _underline1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), CGRectGetWidth(self.view.frame), 0.5)];
    _underline1.image = [UIImage imageNamed:@"login_bt_back"];
    [self.view addSubview:_underline1];
    
    _InfoView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_underline1.frame), CGRectGetWidth(self.view.frame), 200)];
    _InfoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_InfoView];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(42, 15, 50, 20)];
    _nameLabel.text = @"昵  称";
    
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:18];
    _nameLabel.textColor = [UIColor darkGrayColor];
    _nameLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    [_InfoView addSubview:_nameLabel];
    
    _nameTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, 15, 200, 20)];
    _nameTextfield.textColor = [UIColor darkGrayColor];
    _nameTextfield.font = [UIFont systemFontOfSize:18];
    _nameTextfield.textAlignment = NSTextAlignmentLeft;
    _nameTextfield.borderStyle = UITextBorderStyleNone;
    _nameTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    _nameTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    _nameTextfield.text = User[@"truename"];
    [self.InfoView addSubview:_nameTextfield];
    
    _underline2 = [[UIImageView alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(_nameTextfield.frame)+15, CGRectGetWidth(self.view.frame)-32, 0.5)];
    _underline2.image = [UIImage imageNamed:@"login_bt_back"];
    [self.InfoView addSubview:_underline2];
    
    _sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(44, CGRectGetMaxY(_underline2.frame)+15, 50, 20)];
    _sexLabel.text =@"性  别";
    _sexLabel.textAlignment = NSTextAlignmentLeft;
    _sexLabel.font = [UIFont systemFontOfSize:18];
    _sexLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    _sexLabel.textColor = [UIColor darkGrayColor];
    [_InfoView addSubview:_sexLabel];
    
    _sexTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, self.underline2.frame.origin.y +15 , 200, 20)];
    _sexTextfield.textColor = [UIColor darkGrayColor];
    _sexTextfield.font = [UIFont systemFontOfSize:18];
    _sexTextfield.textAlignment = NSTextAlignmentLeft;
    _sexTextfield.borderStyle = UITextBorderStyleNone;
    _sexTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    _sexTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _sexTextfield.keyboardType = UIKeyboardTypeNumberPad;
    NSInteger sexnum;
    sexnum = [User[@"sex"] integerValue];
    
    switch (sexnum)
    {
        case 1:
             _sexTextfield.text = @"男";
        
            break;
            
        case 2:
             _sexTextfield.text = @"女" ;
            
        default:
            break;
    }
    
    

    
   

    _sexTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    [self.InfoView addSubview:_sexTextfield];
    
    
    _sexButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sexButton.frame = CGRectMake(100, self.underline2.frame.origin.y +15 , 200, 20);
    
    [_sexButton addTarget:self
                   action:@selector(pickSex) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.InfoView addSubview:_sexButton];
    
    
    
    _underline3 = [[UIImageView alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(_sexLabel.frame)+15, CGRectGetWidth(self.view.frame)-32, 0.5)];
    _underline3.image = [UIImage imageNamed:@"login_bt_back"];
    [self.InfoView addSubview:_underline3];
    
    _phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(44, CGRectGetMaxY(_underline3.frame)+15, 50, 20)];
    _phoneNumber.text =@"电  话";
    _phoneNumber.textAlignment = NSTextAlignmentLeft;
    _phoneNumber.font = [UIFont systemFontOfSize:18];
    _phoneNumber.textColor = [UIColor darkGrayColor];
    _phoneNumber.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    [_InfoView addSubview:_phoneNumber];
    
    _phoneTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, self.underline3.frame.origin.y +15 , 200, 20)];
    _phoneTextfield.textColor = [UIColor darkGrayColor];
    _phoneTextfield.font = [UIFont systemFontOfSize:18];
    _phoneTextfield.textAlignment = NSTextAlignmentLeft;
    _phoneTextfield.borderStyle = UITextBorderStyleNone;
    _phoneTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    _phoneTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTextfield.text = User[@"mobphone"];
    _phoneTextfield.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    [self.InfoView addSubview:_phoneTextfield];
    
    _underline4 = [[UIImageView alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(_phoneNumber.frame)+15, CGRectGetWidth(self.view.frame)-32, 0.5)];
    _underline4.image = [UIImage imageNamed:@"login_bt_back"];
    [self.InfoView addSubview:_underline4];
    
    _schoolLabel = [[UILabel alloc]initWithFrame:CGRectMake(44, CGRectGetMaxY(_underline4.frame)+15, 50, 20)];
    _schoolLabel.text =@"学  校";
    _schoolLabel.textAlignment = NSTextAlignmentLeft;
    _schoolLabel.font = [UIFont systemFontOfSize:18];
    _schoolLabel.textColor = [UIColor darkGrayColor];
    _schoolLabel.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    [_InfoView addSubview:_schoolLabel];
    
    _underline5 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_InfoView.frame), CGRectGetWidth(self.view.frame), 0.5)];
    _underline5.image = [UIImage imageNamed:@"login_bt_back"];
    [self.view addSubview:_underline5];
    
    
    _schoolTextfield = [[UITextField alloc]initWithFrame:CGRectMake(100, self.underline4.frame.origin.y +15 , 200, 20)];
    _schoolTextfield.textColor = [UIColor darkGrayColor];
    _schoolTextfield.font = [UIFont systemFontOfSize:18];
    _schoolTextfield.textAlignment = NSTextAlignmentLeft;
    _schoolTextfield.borderStyle = UITextBorderStyleNone;
    _schoolTextfield.tintColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    _schoolTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _schoolTextfield.keyboardType = UIKeyboardTypeNumberPad;
    _schoolTextfield.text = @"北京科技大学";
    _schoolTextfield.font = [UIFont fontWithName:@"Heiti SC" size:18.0];
    
    [self.InfoView addSubview:_schoolTextfield];
    
    _schoolButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _schoolButton.frame = CGRectMake(100, self.underline4.frame.origin.y +15 , 200, 20);
    
    [_schoolButton addTarget:self
                      action:@selector(pickSchool) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.InfoView addSubview:_schoolButton];
    
    
    
    
    _nameCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nameCbutton.frame = CGRectMake(16, 15, 20, 20);
    _nameCbutton.backgroundColor = [UIColor colorWithRed:0.f/255.0f green:191.0f/255.0f blue:255.0f/255.0f alpha:0.6];
    [_nameCbutton.layer setCornerRadius:_nameCbutton.frame.size.width/2.0];
    _nameCbutton.enabled = NO;
    
    [self.InfoView addSubview:_nameCbutton];
    
    _sexCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sexCbutton.frame = CGRectMake(16,CGRectGetMaxY(_underline2.frame)+15, 20, 20);
    _sexCbutton.backgroundColor = [UIColor colorWithRed:127.f/255.0f green:255.0f/255.0f blue:212.0f/255.0f alpha:0.6];
    [_sexCbutton.layer setCornerRadius:_sexCbutton.frame.size.width/2.0];
    _sexCbutton.enabled = NO;
    
    [self.InfoView addSubview:_sexCbutton];
    
    _phoneCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _phoneCbutton.frame = CGRectMake(16,  CGRectGetMaxY(_underline3.frame)+15, 20, 20);
    _phoneCbutton.backgroundColor = [UIColor colorWithRed:64.f/255.0f green:224.0f/255.0f blue:208.0f/255.0f alpha:0.6];
    [_phoneCbutton.layer setCornerRadius:_phoneCbutton.frame.size.width/2.0];
    _phoneCbutton.enabled = NO;
    
    [self.InfoView addSubview:_phoneCbutton];
    
    
    _schoolCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _schoolCbutton.frame = CGRectMake(16, CGRectGetMaxY(_underline4.frame)+15, 20, 20);
    _schoolCbutton.backgroundColor = [UIColor colorWithRed:152.f/255.0f green:245.0f/255.0f blue:255.0f/255.0f alpha:0.6];
    [_schoolCbutton.layer setCornerRadius:_schoolCbutton.frame.size.width/2.0];
    _schoolCbutton.enabled = NO;
    
    [self.InfoView addSubview:_schoolCbutton];
    
    
    
    
    
    

    
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self
selector:@selector(sex)
name:@"sex"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
selector:@selector(school)
name:@"school"
                                              object:nil];
    
    

   
    self.title = @"个人信息";
    

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton setTintColor:[UIColor whiteColor]];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:19];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    [rightButton addTarget:self
                    action:@selector(SaveInfo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.tabBarController.tabBar.hidden = YES;



}

-(void)pickerRow:(NSInteger)row
{



}

#pragma mark - SaveInfo
-(void)SaveInfo
{
    hud = [[JGProgressHUD alloc]initWithStyle:JGProgressHUDStyleDark];
    [hud showInView:self.view];
    NSData *infoData = UIImageJPEGRepresentation(_headImage.image, 0.5);
    NSString *Imagedata = [NSString stringWithFormat:@"%@",infoData];
    if (Imagedata.length>0)
    {
        //NSDictionary *user = dic1[@"data"][@"user"];
        
        
        NSDictionary *selfInfo = @{@"uid":User[@"uid"],@"username":User[@"username"],@"mobphone":_phoneTextfield.text,@"truename":_nameTextfield.text,@"cityid":User[@"cityid"],@"sex":_sexTextfield.text,@"address":_schoolTextfield.text,@"touxiang":infoData};
    
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager POST:@"http://120.27.101.247/Web/api/?url=user/userinfo" parameters:selfInfo
              success:^(AFHTTPRequestOperation *operation, id responseObject)
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
             NSLog(@"%@",dic);

            if(number == 1)
             {
                 NSDictionary *dicInfo = dic;
                 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
                 NSString *plistPath = [paths objectAtIndex:0];
                 NSString *fileName = [plistPath stringByAppendingString:@"dic.plist"];
                // NSLog(@"%@",fileName);
                 
                 [dicInfo writeToFile:fileName atomically:YES];
                 
                 NSDictionary *userRefresh = [[NSDictionary alloc]init];
                 
                 userRefresh = dic[@"data"][@"user"];
                 
                 NSURL *userUrl = [NSURL URLWithString:userRefresh[@"icon"]];
                 NSLog(@"%@",userRefresh);
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
                                                                  [HeaderImage shareInstance].image=image;
                                                                  
                                                                  
                                                              });
                                                              // [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
                                                              
                                                          }
                                                      }
                                                  }];
                 
                 [task resume];
                 

                 
                
                 NSNotification *notification = [NSNotification notificationWithName:@"save" object:nil];
                 [[NSNotificationCenter defaultCenter]postNotification:notification];
                 
                 
                 
                 
                 

                 
                [hud dismiss];
                 
                 _alertview=[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"保存成功"
                                                     delegate:self
                                            cancelButtonTitle:@"好的"
                                            otherButtonTitles:nil];
                 [self.view addSubview:_alertview];
                 [_alertview show];
                 

             
             }
             
             else
             {
                 [hud dismiss];
                 _alertview=[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"用户名或密码不正确"
                                                     delegate:self
                                            cancelButtonTitle:@"好的"
                                            otherButtonTitles:nil];
                 [self.view addSubview:_alertview];
                 [_alertview show];
                 
             }

             
             
            
        }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
            
            [hud dismiss];

            
        }];
        
        
        
    }
    
   else if (Imagedata==nil)
    {
        
        NSDictionary *user = dic1[@"user"];
        
        
        NSDictionary *selfInfo = @{@"uid":user[@"uid"],@"username":user[@"username"],@"mobphone":_phoneTextfield.text,@"truename":_nameTextfield.text,@"sex":_sexTextfield.text,@"address":_schoolTextfield.text};
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager POST:@"http://120.27.101.247/2/api/?url=user/userinfo" parameters:selfInfo
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSData *message = responseObject;
             
             NSDictionary *_str;
             NSString *success;
             int number;

             
             dic = [NSJSONSerialization JSONObjectWithData:message
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
            
        
             _str = dic[@"status"];
             success = _str[@"succeed"];
             number =[success intValue];
             
             if (number == 1)
             {
                 
                 NSDictionary *dicInfo = dic;
                 
                 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
                 NSString *plistPath = [paths objectAtIndex:0];
                 NSString *fileName = [plistPath stringByAppendingString:@"dic.plist"];
                 NSLog(@"%@",fileName);
                 
                 [dicInfo writeToFile:fileName atomically:YES];
                 _save = YES;

                 
                 
                 NSNotification *change = [NSNotification notificationWithName:@"change"
                                                                        object:nil];
                 
                 [[NSNotificationCenter defaultCenter]postNotification:change];

                  [hud dismiss];
                 _alertview=[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"保存成功"
                                                     delegate:self
                                            cancelButtonTitle:@"好的"
                                            otherButtonTitles:nil];
                 [self.view addSubview:_alertview];
                 [_alertview show];
                 
             }
             else
             {
                 [hud dismiss];
                 _alertview=[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"用户名或密码不正确"
                                                     delegate:self
                                            cancelButtonTitle:@"好的"
                                            otherButtonTitles:nil];
                 [self.view addSubview:_alertview];
                 [_alertview show];
                 
             }

             
             

             
            
             
             
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             
             [hud dismiss];
             
             
         }];
        

        
    }
    

    
    
    


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
