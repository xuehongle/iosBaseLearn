//
//  UITextFieldViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UITextFieldViewController.h"

@interface UITextFieldViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField * tf;
@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO X 只能输入和显示单行，多行怎么办
    //TODO X 设置背景
    self.tf = [[UITextField alloc]init];
    self.tf.frame = CGRectMake(10, 100, 300, 40);
    self.tf.placeholder = @"默认风格默认键盘可收回键盘";
    self.tf.borderStyle = UITextBorderStyleRoundedRect;
    self.tf.keyboardType = UIKeyboardTypeDefault;
    
    self.tf.delegate = self;
    
    [self.view addSubview:self.tf];
    
    UITextField *tf1 = [[UITextField alloc]init];
    tf1.frame = CGRectMake(10, 150, 180, 40);
    tf1.borderStyle = UITextBorderStyleLine;
    tf1.textColor = [UIColor blueColor];
    tf1.font = [UIFont systemFontOfSize:15];
    tf1.text = @"line风格 电话键盘";
    tf1.keyboardType = UIKeyboardTypePhonePad;
    
    [self.view addSubview:tf1];
    
    UITextField *tf2 = [[UITextField alloc]init];
    tf2.frame = CGRectMake(10, 200, 180, 50);
    tf2.borderStyle = UITextBorderStyleBezel;
    tf2.text = @"Bezel风格 数字键盘";
    tf2.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.view addSubview:tf2];
    
    UITextField *tf3 = [[UITextField alloc]init];
    tf3.frame = CGRectMake(10, 260, 180, 50);
    tf3.borderStyle = UITextBorderStyleNone;
    tf3.text = @"None风格";
    tf3.textColor = [UIColor blackColor];
    
    [self.view addSubview:tf3];
    
    UITextField *tf4 = [[UITextField alloc]init];
    tf4.frame = CGRectMake(10, 320, 180, 50);
    tf4.borderStyle = UITextBorderStyleRoundedRect;
    tf4.text = @"密码";
    tf4.secureTextEntry = YES;
    tf4.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.view addSubview:tf4];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tf resignFirstResponder];
}

#pragma mark - delegate
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"开始编辑了");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"结束编辑了");
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES; // return NO 就不能调键盘编辑了
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES; // return NO 不能关闭键盘，比方说密码至少6位的时候
}


@end
