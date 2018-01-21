//
//  MasonryViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/11.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MasonryViewController.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

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
    
    int padding = 20;
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blueView.superview.left).offset(padding);
        make.bottom.equalTo(blueView.superview.bottom).offset(-padding);
        make.right.equalTo(redView.left).offset(-padding);
//        make.width.equalTo(redView.width);
        make.height.equalTo(50);
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(blueView.height);
        make.width.equalTo(blueView.width).multipliedBy(2);
        make.right.equalTo(redView.superview.right).offset(-padding);
        make.bottom.equalTo(redView.superview.bottom).offset(-padding);
    }];
    
}


@end
