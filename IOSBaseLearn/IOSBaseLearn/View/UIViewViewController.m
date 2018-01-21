//
//  UIViewViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/6.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIViewViewController.h"

@interface UIViewViewController ()

@property (nonatomic, strong) UIView * view0;
@property (nonatomic, strong) UIView * view1;
@property (nonatomic, strong) UIView * view2;
@end

@implementation UIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view0 = [[UIView alloc]init];
    self.view0.frame = CGRectMake(100, 100, 150, 150);
    self.view0.backgroundColor = [UIColor blueColor];
    
    self.view1 = [[UIView alloc]init];
    self.view1.frame = CGRectMake(125, 125, 150, 150);
    self.view1.backgroundColor = [UIColor redColor];
    
    self.view2 = [[UIView alloc]init];
    self.view2.frame = CGRectMake(150, 150, 150, 150);
    self.view2.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.view0];
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    
    UIButton * btn0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn0.frame = CGRectMake(0, 65, 100, 30);
    [btn0 setTitle:@"view0提前" forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(view0Front) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(120, 65, 100, 30);
    [btn1 setTitle:@"view2提前" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(view1Front) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(240, 65, 120, 30);
    [btn2 setTitle:@"view2放到最后" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(view2Front) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(0, 320, 120, 30);
    [btn3 setTitle:@"Transform平移" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(move) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame = CGRectMake(130, 320, 100, 30);
    [btn4 setTitle:@"旋转" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(rotate) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.frame = CGRectMake(240, 320, 120, 30);
    [btn5 setTitle:@"缩放" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(scale) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.frame = CGRectMake(0, 360, 120, 30);
    [btn6 setTitle:@"Transform还原" forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn0];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    [self.view addSubview:btn5];
    [self.view addSubview:btn6];
    
}

-(void) view0Front {
    [self.view bringSubviewToFront:self.view0];
}

-(void) view1Front {
    [self.view bringSubviewToFront:self.view2];
}

-(void) view2Front {
    [self.view sendSubviewToBack:self.view2];
}

- (void) move {
    self.view0.transform = CGAffineTransformTranslate(self.view0.transform, 0, 50);
}

- (void) rotate {
    [UIView animateWithDuration:2.5 animations:^{
        self.view0.transform = CGAffineTransformRotate(self.view0.transform, -M_PI_4);
    }];
}

- (void) scale {
    self.view0.transform = CGAffineTransformScale(self.view0.transform, 1.5, 1.5);
}

- (void) goBack {
    self.view0.transform = CGAffineTransformIdentity;
}

@end
