//
//  UIViewAnimationViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIViewAnimationViewController.h"

@interface UIViewAnimationViewController ()

@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation UIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tom3.png"]];
    _imageView.frame = CGRectMake(30, 100, 100, 100);
    [self.view addSubview:_imageView];
    
    UIButton * btn0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn0.frame = CGRectMake(30, 210, 80, 40);
    [btn0 setTitle:@"frame" forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(frameClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn0];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(30, 260, 80, 40);
    [btn1 setTitle:@"scale" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(scaleClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void) frameClick {
//    Block动画
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _imageView.frame = CGRectMake(100, 200, 100, 100);
    } completion:^(BOOL finished) {
        NSLog(@"移动结束!");
    }];
}

- (void) scaleClick {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finish)]; //设置代理后，才能用
    _imageView.frame = CGRectMake(_imageView.frame.origin.x, _imageView.frame.origin.y, 200, 200);
    [UIView commitAnimations];
    
}

- (void) finish {
    NSLog(@"缩放结束!");
}

@end
