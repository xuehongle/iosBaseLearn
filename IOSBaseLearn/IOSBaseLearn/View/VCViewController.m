//
//  VCViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/6.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "VCViewController.h"
#import "UILabelViewController.h"

@interface VCViewController ()

@end

@implementation VCViewController

- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 100, 200, 40);
    [btn setTitle:@"跳转 查看生命周期" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __FUNCTION__);
}

- (void) btnClick {
    UIViewController * vc = [[UILabelViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
