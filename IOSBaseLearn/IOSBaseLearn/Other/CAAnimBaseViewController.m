//
//  CAAnimBaseViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CAAnimBaseViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface CAAnimBaseViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *fengcheImageView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

@end

@implementation CAAnimBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //心脏缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"]; //选中的这个keyPath就是缩放
    scaleAnimation.fromValue = [NSNumber numberWithDouble:0.5]; //一开始时是0.5的大小
    scaleAnimation.toValue = [NSNumber numberWithDouble:1.5];  //结束时是1.5的大小
    scaleAnimation.duration = 1; //设置时间
    scaleAnimation.repeatCount = MAXFLOAT; //重复次数
    // 1.2 设置动画执行完毕之后不删除动画
    scaleAnimation.removedOnCompletion = NO;
    // 1.3 设置保存动画的最新状态
    scaleAnimation.fillMode = kCAFillModeForwards;
    [_heartImageView.layer addAnimation:scaleAnimation forKey:nil]; //添加动画
    
    //风车旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithDouble:0.f];
    rotationAnimation.toValue = [NSNumber numberWithDouble:2 * M_PI];
    rotationAnimation.duration = 2.f;
    rotationAnimation.repeatCount = MAXFLOAT;
    [_fengcheImageView.layer addAnimation:rotationAnimation forKey:nil];
    
    //平移动画
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    positionAnimation.fromValue = [NSNumber numberWithDouble:0.f];
    positionAnimation.toValue = [NSNumber numberWithDouble:SCREEN_WIDTH];
    positionAnimation.duration = 2;
    positionAnimation.repeatCount = MAXFLOAT;
    [_arrowImageView.layer addAnimation:positionAnimation forKey:nil];
    
}


@end
