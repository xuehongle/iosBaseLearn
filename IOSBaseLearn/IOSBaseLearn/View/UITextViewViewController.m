//
//  UITextViewViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/13.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UITextViewViewController.h"

@interface UITextViewViewController ()

@end

@implementation UITextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView * textView = [[UITextView alloc]init];
    textView.frame = CGRectMake(10, 70, 250, 200);
    textView.backgroundColor = [UIColor darkGrayColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont fontWithName:@"Helvetica-Light" size:20];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.contentInset = UIEdgeInsetsMake(-50, -5, -15, -5); // 边距
    textView.text = @"阿拉斯加的法律倒萨大开的房间立刻";
    textView.keyboardType = UIKeyboardTypeDefault;
    textView.returnKeyType = UIReturnKeyDefault;
    textView.editable = YES;
    textView.selectable = YES;
    
    [self.view addSubview:textView];
}

@end
