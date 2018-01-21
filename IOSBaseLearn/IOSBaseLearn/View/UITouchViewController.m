//
//  UITouchViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/9.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UITouchViewController.h"

@interface UITouchViewController ()

@property (nonatomic, assign) CGPoint lastPoint;
@end

@implementation UITouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image = [UIImage imageNamed:@"guide01.jpg"];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(50, 60, 130, 200);
    imageView.tag = 101;
    
    [self.view addSubview:imageView];
}

// 这几个方法是UIResponder的方法, 所以自定义view也可以用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    UITouch * touch = [touches anyObject];
    if (touch.tapCount == 1) {
        NSLog(@"单击");
    } else if (touch.tapCount == 2) {
        NSLog(@"双击");
    }
    
    self.lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    NSLog(@"touchesMoved, x=%f, y=%f", point.x, point.y);
    
    CGFloat offsetX = point.x - self.lastPoint.x;
    CGFloat offsetY = point.y - self.lastPoint.y;
    
    self.lastPoint = point;
    
    UIImageView * imageView = [self.view viewWithTag:101];
    imageView.frame = CGRectMake(imageView.frame.origin.x + offsetX , imageView.frame.origin.y + offsetY, imageView.frame.size.width, imageView.frame.size.height);
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
}

// 正在玩游戏的时候，突然来电话的情况，可在这时保存数据
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled");
}
@end
