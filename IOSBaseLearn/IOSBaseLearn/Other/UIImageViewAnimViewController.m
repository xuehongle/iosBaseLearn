//
//  UIImageViewAnimViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/11/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIImageViewAnimViewController.h"

@interface UIImageViewAnimViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation UIImageViewAnimViewController

NSArray* images;

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个NSArray集合，其中集合元素都是UIImage对象
    images = [NSArray arrayWithObjects:
              [UIImage imageNamed:@"guide01.jpg"],
              [UIImage imageNamed:@"guide02.jpg"],
              [UIImage imageNamed:@"guide03.jpg"], nil];
    // 设置iv控件需要动画显示的图片为images集合元素
    self.imageView.animationImages = images;
    // 设置动画持续时间
    self.imageView.animationDuration = 3;
    // 设置动画重复次数
    self.imageView.animationRepeatCount = 999999;
    // 让iv控件开始播放动画
    [self.imageView startAnimating];
}

@end
