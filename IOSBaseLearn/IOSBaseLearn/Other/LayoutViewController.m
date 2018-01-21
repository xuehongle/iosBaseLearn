//
//  LayoutViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/10.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "LayoutViewController.h"
#import "SuperView.h"

@interface LayoutViewController ()

@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SuperView *view = [[SuperView alloc]init];
    view.tag = 101;
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake(40, 70, 200, 300);
    [view createSubViews];
    [self.view addSubview:view];
    
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn0.frame = CGRectMake(260, 330, 40, 30);
    [btn0 addTarget:self action:@selector(fangdaClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn0 setTitle:@"放大" forState:UIControlStateNormal];
    [self.view addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(260, 360, 40, 30);
    [btn1 addTarget:self action:@selector(suoxiaoClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"缩小" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
}

- (void) fangdaClick: (UIButton *) btn {
    SuperView * superView = (SuperView *)[self.view viewWithTag:101];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    superView.frame = CGRectMake(40, 70, 300, 400);
    [UIView commitAnimations];
    
}

- (void) suoxiaoClick: (UIButton *) btn {
    SuperView * superView = (SuperView *)[self.view viewWithTag:101];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    superView.frame = CGRectMake(40, 70, 200, 300);
    [UIView commitAnimations];
}
@end
