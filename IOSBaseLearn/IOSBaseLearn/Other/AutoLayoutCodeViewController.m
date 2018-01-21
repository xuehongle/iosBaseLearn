//
//  AutoLayoutCodeViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/21.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "AutoLayoutCodeViewController.h"

@interface AutoLayoutCodeViewController ()

@end

@implementation AutoLayoutCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * blueView = [[UIView alloc]init];
//    blueView.frame = CGRectMake(30, 90, 100, 50);
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView * redView = [[UIView alloc]init];
//    redView.frame = CGRectMake(30, 150, 100, 50);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 禁用autoresizing
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
//    obj1.property1 =（obj2.property2 * multiplier）+ constant value
    NSLayoutConstraint * blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [blueView addConstraint:blueHeight];
    NSLayoutConstraint * blueLeft = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:blueLeft];
    NSLayoutConstraint * blueBottom = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:blueBottom];
    NSLayoutConstraint * blueRight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-20];
    [self.view addConstraint:blueRight];
    NSLayoutConstraint * blueWidth = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:blueWidth];
    
    NSLayoutConstraint * redHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:redHeight];
    NSLayoutConstraint * redBottom = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:redBottom];
    NSLayoutConstraint * redRight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:redRight];

    
}


@end
