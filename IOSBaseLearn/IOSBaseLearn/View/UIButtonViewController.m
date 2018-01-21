//
//  UIButtonViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/6.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIButtonViewController.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 120, 40);
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"普通按钮" forState:UIControlStateNormal];
    [btn setTitle:@"按钮按下了" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
//    btn.titleLabel.text = @"aaaabbbbbcccccc"; //这个没用，因为titleLabel没设置frame,而且hidden is true
    btn.tintColor = [UIColor redColor]; //风格颜色的设置，没写setTitleColor的话，会用这个color
    
    [self.view addSubview:btn];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 200, 100, 100);
    [btn1 setImage:[UIImage imageNamed:@"btnbg01.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"btnbg00.png"] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"image" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 330, 100, 100);
    [btn2 setBackgroundImage:[UIImage imageNamed:@"btnbg01.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"btnbg01.png"] forState:UIControlStateNormal];
    [btn2 setTitle:@"background" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:btn2];
    
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, 450, 40, 40);
    [btn3 setTitle:@"点击" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor greenColor];
    [btn3 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn3];
    
}

- (void) btnClick {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:@"点击了"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
