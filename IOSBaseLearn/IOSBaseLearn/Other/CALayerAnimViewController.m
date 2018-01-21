//
//  CALayerAnimViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CALayerAnimViewController.h"

@interface CALayerAnimViewController ()

@property (nonatomic, strong) CALayer *layer;
@end

@implementation CALayerAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 70, 120, 40);
    [btn setTitle:@"隐式动画" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
//    所有的非Root Layer，也就是手动创建的CALayer对象，都存在着隐式动画
//    什么是隐式动画？当对非Root Layer的部分属性进行修改时，默认会自动产生一些动画效果 而这些属性称为Animatable Properties(可动画属性)
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.frame = CGRectMake(20, 100, 100, 100);
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
}

- (void) btnClick {
    // 关闭隐式动画
    //    [CATransaction begin];
    //    [CATransaction setDisableActions:YES];
    
    // 隐式动画
    //    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    //    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    self.layer.position = CGPointMake(200, 200);
    //    self.layer.position // 如何查看CALayer的某个属性是否支持隐式动画, 查看头文件是否有 Animatable
    
    //    [CATransaction commit];
}


@end
