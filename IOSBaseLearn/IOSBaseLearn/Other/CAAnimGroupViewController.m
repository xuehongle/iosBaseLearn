//
//  CAAnimGroupViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/2.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CAAnimGroupViewController.h"

@interface CAAnimGroupViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *penguinImageView;

@end

@implementation CAAnimGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建组动画
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3;
    animationGroup.repeatCount = MAXFLOAT;
    animationGroup.removedOnCompletion = NO;
    /* beginTime 可以分别设置每个动画的beginTime来控制组动画中每个动画的触发时间，时间不能够超过动画的时间，默认都为0.f */
    
    //缩放动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation1.values = @[[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:1.0]];
    animation1.beginTime = 0.f;
    
    //按照圆弧移动动画
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(300, 200)];
    [bezierPath addQuadCurveToPoint:CGPointMake(200, 300) controlPoint:CGPointMake(300, 300)];
    [bezierPath addQuadCurveToPoint:CGPointMake(100, 200) controlPoint:CGPointMake(100, 300)];
    [bezierPath addQuadCurveToPoint:CGPointMake(200, 100) controlPoint:CGPointMake(100, 100)];
    [bezierPath addQuadCurveToPoint:CGPointMake(300, 200) controlPoint:CGPointMake(300, 100)];
    animation2.path = bezierPath.CGPath;
    animation2.beginTime = 0.f;
    
    //透明度动画
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation3.fromValue = [NSNumber numberWithDouble:0.0];
    animation3.toValue = [NSNumber numberWithDouble:1.0];
    animation3.beginTime = 0.f;
    
    //添加组动画
    animationGroup.animations = @[animation1, animation2,animation3];
    [_penguinImageView.layer addAnimation:animationGroup forKey:nil];

}


@end
