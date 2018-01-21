//
//  Block1ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/9.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "Block1ViewController.h"
#import "Block2ViewController.h"

@interface Block1ViewController ()

@property (nonatomic, strong) UILabel *label;
@end

@implementation Block1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc]init];
    self.label.frame = CGRectMake(20, 70, 240, 40);
    self.label.text = @"将会显示下一个页面返回的值";
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(30, 120, 100, 40);
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoNext) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.label];
    [self.view addSubview:btn];
}

- (void) gotoNext {
    /* block & delegate 怎样选择？
    
    －如果回调方法比较少，1～2，最好不要超过3个，这个时候使用block比较合适
    －如果回调方法太多，会让代码显得臃肿，反而不好维护
    
    －如果回调方法非常多，同时又不用每一个方法都必须实现，这个时候用delegate会比较方便！
    */
    Block2ViewController * vc = [[Block2ViewController alloc] init];
    vc.complete = ^(NSString *text) {
        self.label.text = text;
    };
    [self.navigationController pushViewController:vc animated:YES];
}

@end
