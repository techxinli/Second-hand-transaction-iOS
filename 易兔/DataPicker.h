//
//  DataPicker.h
//  易兔
//
//  Created by 李鑫 on 15/4/11.
//  Copyright (c) 2015年 Miracle Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PickerViewDelegate <NSObject>

-(void)pickerViewDidClickConfirm:(NSString *)confirmString;
-(void)pickerRow:(NSInteger)row;

@end

@interface DataPicker : NSObject<UIPickerViewDataSource,UIPickerViewDelegate>

{

    NSArray *_dataArray;
    
    NSInteger _rowHeight;
    
    UIView *_pickerView;
    UIPickerView *_picker;
    UIButton *_ConfigureBtn;
    UILabel *_PickerLabel;
    


}

@property (nonatomic,weak) id<PickerViewDelegate> delegate;



-(id)initWithDataArray:(NSArray *)dataArray  rowHeight:(NSInteger)rowHeight delegate:(id<PickerViewDelegate>)delegate  delegeteView:(UIView *)view;

-(void)pushPicker;

-(void)hidePicker;


@end
