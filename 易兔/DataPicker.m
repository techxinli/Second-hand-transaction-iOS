//
//  DataPicker.m
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import "DataPicker.h"

@implementation DataPicker
{
    NSInteger _theRow;
    UIView *_view; //delegate View


}

-(id)initWithDataArray:(NSArray *)dataArray rowHeight:(NSInteger)rowHeight delegate:(id<PickerViewDelegate>)delegate delegeteView:(UIView *)view
{

    self = [super init];
    if (self)
    {
        
        self.delegate = delegate;
        _dataArray = dataArray;
        _rowHeight = rowHeight;
        _view = view;
        
        //Picker make
        
        _pickerView = [[UIView alloc]initWithFrame:CGRectMake(0, view.bounds.size.height, view.bounds.size.width, view.bounds.size.width * 0.42243)];
        
        _pickerView.backgroundColor = [UIColor whiteColor];
        [view addSubview:_pickerView];
        
        _picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, view.bounds.size.height * 0.07042, view.bounds.size.width, 0)];
        
        _picker.dataSource = self;
        _picker.delegate = self;
        [_pickerView addSubview:_picker];
        
        

        _ConfigureBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,view.bounds.size.width, view.bounds.size.height * 0.07042)];
        [_ConfigureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _ConfigureBtn.backgroundColor = [UIColor whiteColor];
        _ConfigureBtn.userInteractionEnabled = YES;
        [_ConfigureBtn addTarget:self
                          action:@selector(endClick) forControlEvents:UIControlEventTouchUpInside];
        [_ConfigureBtn setTitleColor:[UIColor colorWithRed:1.0 green:0.6 blue:0.7 alpha:1] forState:UIControlStateNormal];
        _ConfigureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        
        [_pickerView addSubview:_ConfigureBtn];
    
    }

    
    return self;
  


}

#pragma mark pickerView animation

-(void)pushPicker
{

    [UIView animateWithDuration:0.3
                     animations:^{
                         _pickerView.frame = CGRectMake(0, _view.bounds.size.height - _view.bounds.size.height * 0.42243, _view.bounds.size.width, _view.bounds.size.height*0.4223);
                         
                     }];


}

-(void)hidePicker
{


    [UIView animateWithDuration:0.3
animations:^{
    _pickerView.frame = CGRectMake(0, _view.bounds.size.height , _view.bounds.size.width, _view.bounds.size.height*0.4223);
    
}];


}

#pragma mark pickerViewDelegate

//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{


    return 1;


}

//行数

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return _dataArray.count;


}


//每列显示的内容

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    return [_dataArray objectAtIndex:row];


}

//行高
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{

    return _rowHeight;


}


//选定row

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    _theRow = row;

  

}


//选取确定后返回内容

-(void)endClick
{
   
    [self hidePicker];
    
    [self.delegate pickerViewDidClickConfirm:[_dataArray objectAtIndex:_theRow]];
    [self.delegate pickerRow:_theRow];


}















@end
