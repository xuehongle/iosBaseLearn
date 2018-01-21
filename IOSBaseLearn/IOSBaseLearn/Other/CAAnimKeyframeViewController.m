//
//  CAAnimKeyframeViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CAAnimKeyframeViewController.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface CAAnimKeyframeViewController ()

@property (nonatomic, strong) UIView * customView;
@property (nonatomic, strong) UIImageView * iconView;
@end

@implementation CAAnimKeyframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customView = [[UIView alloc]initWithFrame:CGRectMake(70, 120, 100, 100)];
    self.customView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.customView];
    
    self.iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tom3"]];
    self.iconView.frame = CGRectMake(100, 400, 100, 50);
    [self.view addSubview:self.iconView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
    //    [self test1];
    [self test2];
}

- (void)test1
{
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    // 1.1告诉系统执行什么动画
    keyAnima.keyPath = @"position";
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 100, 200, 200));
    
    keyAnima.path = path;
    CGPathRelease(path);
    
    // 1.2保存执行完之后的状态
    // 1.2.1执行完之后不删除动画
    keyAnima.removedOnCompletion = NO;
    // 1.2.2执行完之后保存最新的状态
    keyAnima.fillMode = kCAFillModeForwards;
    
    // 1.3设置动画时间
    keyAnima.duration = 2;
    // 2.观察动画什么时候开始执行, 以及什么时候执行完毕
    keyAnima.delegate = self;
    // 3.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:@"abc"];
}

- (IBAction)btnClick:(id)sender {
    
    // 停止动画
    [self.customView.layer removeAnimationForKey:@"abc"];
}


- (void)test
{
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    // 1.1告诉系统执行什么动画
    keyAnima.keyPath = @"position";
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(120, 170)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(220, 170)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(220, 270)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(120, 270)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(120, 170)];
    
    keyAnima.values = @[v1, v2, v3, v4, v5];
    
    // 设置每一个关键帧对应的时间点
    keyAnima.keyTimes = @[@(0.01) ,@(0.1) ,@(0.2), @(0.8),  @(0.9)];
    
    //    keyAnima.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // 1.2保存执行完之后的状态
    // 1.2.1执行完之后不删除动画
    keyAnima.removedOnCompletion = NO;
    // 1.2.2执行完之后保存最新的状态
    keyAnima.fillMode = kCAFillModeForwards;
    
    // 1.3设置动画时间
    keyAnima.duration = 2;
    
    // 2.观察动画什么时候开始执行, 以及什么时候执行完毕
    keyAnima.delegate = self;
    
    
    // 2.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

// 图片抖动效果
- (void) test2 {
    // 1.创建核心动画
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    // 度数 / 180 * M_PI
    keyAnima.values = @[@(-angle2Radian(4)), @(angle2Radian(4)), @(-angle2Radian(4))];
    
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 1.0;
    
    // 设置动画重复的次数
    keyAnima.repeatCount = MAXFLOAT;
    
    // 2.添加核心动画
    [self.iconView.layer addAnimation:keyAnima forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
}

@end
