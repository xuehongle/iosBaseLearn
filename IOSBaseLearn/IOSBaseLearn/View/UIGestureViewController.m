//
//  UIGestureViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/9.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIGestureViewController.h"

@interface UIGestureViewController ()

@end

@implementation UIGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"guide02.jpg"]];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(50, 150, 150, 230);
    [self.view addSubview:imageView];
    
    imageView.userInteractionEnabled = YES; //默认是NO
    
    UITapGestureRecognizer * tapOne = [[UITapGestureRecognizer alloc]init];
    tapOne.numberOfTapsRequired = 1; //默认是1
    tapOne.numberOfTouchesRequired = 1; //默认是1
    [tapOne addTarget:self action:@selector(tapOne:)];
    [imageView addGestureRecognizer:tapOne];
    
    UITapGestureRecognizer * tapTwo = [[UITapGestureRecognizer alloc]init];
    tapTwo.numberOfTapsRequired = 2;
    tapTwo.numberOfTouchesRequired = 1;
    [tapTwo addTarget:self action:@selector(tapTwo:)];
    [imageView addGestureRecognizer:tapTwo];
    
    // 当单击遇到双击时失效，因为一开始点双击的话，会先走一遍单击
    [tapOne requireGestureRecognizerToFail:tapTwo];
}

- (void) tapOne: (UITapGestureRecognizer *) tap {
    NSLog(@"单击");
    UIImageView * imageView = (UIImageView *)tap.view;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    imageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [UIView commitAnimations];
}

- (void) tapTwo: (UITapGestureRecognizer *) tap {
    NSLog(@"双击");
    UIImageView * imageView = (UIImageView *)tap.view;
    [UIView beginAnimations:nil context:nil];
    imageView.frame = CGRectMake(50, 150, 150, 230);
    [UIView commitAnimations];
}

@end
