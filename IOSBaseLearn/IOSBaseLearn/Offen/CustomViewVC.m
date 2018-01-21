//
//  CustomViewVC.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2018/1/4.
//  Copyright © 2018年 xue. All rights reserved.
//

#import "CustomViewVC.h"
#import "CustomView.h"

@interface CustomViewVC ()

@end

@implementation CustomViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomView *cutomView = [[[NSBundle mainBundle]loadNibNamed:@"CustomView" owner:nil options:nil]lastObject];
    [self.view addSubview:cutomView];
    [cutomView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(10);
        make.right.equalTo(self.view.right).offset(-10);
        make.top.equalTo(self.view.top).offset(64);
        make.height.equalTo(50);
    }];
    
}

@end
