//
//  AutoResizingViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/11.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "AutoResizingViewController.h"

@interface AutoResizingViewController ()

@property (nonatomic, strong) UIView * superView;
@property (nonatomic, strong) UILabel * label0;
@property (nonatomic, strong) UILabel * label1;
@property (nonatomic, strong) UILabel * label2;
@property (nonatomic, strong) UILabel * label3;
@property (nonatomic, strong) UIView * centerView;
@end

@implementation AutoResizingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // autoResizing是6根线，4根表示上下左右是否固定，2根表示当其父控件宽高变化，是否按比例变化
    self.superView = [[UIView alloc]init];
    self.superView.frame = CGRectMake(20, 80, 200, 300);
    self.superView.backgroundColor = [UIColor blueColor];
    
    self.label0 = [[UILabel alloc]init];
    self.label0.frame = CGRectMake(0, 0, 40, 40);
    self.label0.text = @"0";
    self.label0.backgroundColor = [UIColor orangeColor];
    
    self.label1 = [[UILabel alloc]init];
    self.label1.frame = CGRectMake(self.superView.bounds.size.width - 40, 0, 40, 40);
    self.label1.text = @"1";
    self.label1.backgroundColor = [UIColor orangeColor];
    
    self.label2 = [[UILabel alloc]init];
    self.label2.frame = CGRectMake(0, self.superView.bounds.size.height - 40, 40, 40);
    self.label2.text = @"2";
    self.label2.backgroundColor = [UIColor orangeColor];
    
    self.label3 = [[UILabel alloc]init];
    self.label3.frame = CGRectMake(self.superView.bounds.size.width - 40, self.superView.bounds.size.height - 40, 40, 40);
    self.label3.text = @"3";
    self.label3.backgroundColor = [UIColor orangeColor];
    
    self.centerView = [[UIView alloc]init];
    self.centerView.frame = CGRectMake(0, 0, self.superView.bounds.size.width, 40);
    self.centerView.center = CGPointMake(self.superView.bounds.size.width / 2, self.superView.bounds.size.height / 2);
    self.centerView.backgroundColor = [UIColor orangeColor];
    
    self.label1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    self.label2.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    self.label3.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    self.centerView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    [self.superView addSubview:self.label0];
    [self.superView addSubview:self.label1];
    [self.superView addSubview:self.label2];
    [self.superView addSubview:self.label3];
    [self.superView addSubview:self.centerView];
    
    [self.view addSubview:self.superView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL isLarge = NO;
    if (isLarge == NO) {
        self.superView.frame = CGRectMake(10, 70, 300, 400);
    } else {
        self.superView.frame = CGRectMake(20, 80, 200, 300);
    }
    isLarge = !isLarge;
}


@end
