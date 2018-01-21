//
//  UILabelViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/6.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UILabelViewController.h"

@interface UILabelViewController ()

@end

@implementation UILabelViewController

- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidLoad];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 160, 130);
    label.backgroundColor = [UIColor greenColor];
    label.text = @"frame是个CGRect, 是个结构体";
    label.textColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:23];
    label.shadowColor = [UIColor grayColor];
    label.shadowOffset = CGSizeMake(3, 3);
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0; //默认是1，假若有3行，设置成5的话，也还是3行
    //TODO X label 高度应该不固定吧
    
    [self.view addSubview:label];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"%s", __FUNCTION__);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    NSLog(@"%s", __FUNCTION__);
    [super didReceiveMemoryWarning];
}

@end
