//
//  UISwitchViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UISwitchViewController.h"

@interface UISwitchViewController ()

@property (nonatomic, strong) UISwitch * sw;
@end

UILabel * label;

@implementation UISwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sw = [[UISwitch alloc]init];
    // uiswitch的宽高设置并没有用
    self.sw.frame = CGRectMake(100, 100, 130, 40);
    self.sw.on = YES;
    [self.sw addTarget:self action:@selector(swChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.sw];
    
    UISwitch * sw1 = [[UISwitch alloc]init];
    sw1.frame = CGRectMake(100, 200, 130, 40);
    [sw1 setOn:YES animated:NO];
    [sw1 setOnTintColor:[UIColor blueColor]];
    [sw1 setTintColor:[UIColor purpleColor]];
    [sw1 setThumbTintColor:[UIColor greenColor]];
    
    [self.view addSubview:sw1];
    
    label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 300, 50, 40);
    [self.view addSubview:label];
}

- (void) swChanged: (UISwitch *) sw {
    if (sw.on) {
        label.text = @"打开";
    } else {
        label.text = @"关闭";
    }
}

@end
