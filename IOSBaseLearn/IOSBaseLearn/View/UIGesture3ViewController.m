//
//  UIGesture3ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/10.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIGesture3ViewController.h"

@interface UIGesture3ViewController ()

@end

@implementation UIGesture3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide01.jpg"]];
    imageView.frame = CGRectMake(50, 100, 220, 350);
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
//    [imageView addGestureRecognizer:pan];
    
    UISwipeGestureRecognizer * swipLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swip:)];
    swipLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer * swipRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swip:)];
    swipRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [imageView addGestureRecognizer:swipLeft];
    [imageView addGestureRecognizer:swipRight];
    
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    longPress.minimumPressDuration = 0.5; //默认0.5秒算长按
    [imageView addGestureRecognizer:longPress];
    
}

- (void) pan: (UIPanGestureRecognizer *) pan {
    CGPoint pt = [pan translationInView:self.view]; //位移
    CGPoint pv = [pan velocityInView:self.view]; //速度
    NSLog(@"pt.x = %f, pt.y = %f", pt.x, pt.y);
    NSLog(@"pv.x = %f, pv.y = %f", pv.x, pv.y);
    
}

- (void) swip: (UISwipeGestureRecognizer *) swip {
    if (swip.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"向左滑动!");
    } else if (swip.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右滑动!");
    }
}

- (void) longPress: (UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
         NSLog(@"长按 开始执行");
    } else if (longPress.state == UIGestureRecognizerStateEnded) {
        NSLog(@"长按 手指抬起时执行");
    }
   
}
@end
