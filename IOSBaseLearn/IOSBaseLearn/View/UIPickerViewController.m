//
//  UIPickerViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/12.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIPickerViewController.h"

@interface UIPickerViewController ()

@end

@implementation UIPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView * pickerView = [[UIPickerView alloc]init];
    pickerView.frame = CGRectMake(10, 100, 300, 200);
    pickerView.delegate = self;
    [pickerView selectRow:2 inComponent:1 animated:YES];
    [self.view addSubview:pickerView];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 400, 320, 30);
    label.text = @"pickerView可自定义每行view";
    [self.view addSubview:label];
}


#pragma mark: - delegate
//多少组
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// 每组多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 5;
    } else if (component == 1) {
        return 10;
    } else {
        return 20;
    }
}

// 显示的文字
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * str = [NSString stringWithFormat:@"%ld组%ld行", component, row];
    return str;
}

//行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 60;
}
//TODO X 两个pickerView的话，viewForRow只用于其中一个，怎么弄
//每行显示的view
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btnbg00.png"]];
//    imageView.frame = CGRectMake(0, 0, 40, 40);
//    return imageView;
//}
@end
