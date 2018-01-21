//
//  ModalViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidLoad];
    
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
    self.view.backgroundColor = [UIColor blueColor];
}

- (void) btnClick {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"关闭modal");
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidDisappear:animated];
}

@end
