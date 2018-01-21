//
//  CATransitionViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CATransitionViewController.h"
#import "UILabelViewController.h"

@interface CATransitionViewController ()

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(50, 100, 180, 40);
    label.text = @"点击屏幕跳转";
    [self.view addSubview:label];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CATransition * transition = [CATransition animation];
    transition.duration = 2;
//    transition.type = kCATransitionPush;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    UIViewController * vc = [[UILabelViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
