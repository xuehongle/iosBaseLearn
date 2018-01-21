//
//  UIGesture2ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/10.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIGesture2ViewController.h"

@interface UIGesture2ViewController ()

@end

@implementation UIGesture2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * name = [NSString stringWithFormat:@"guide02.jpg"];
    UIImage * image = [UIImage imageNamed:name];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(100, 100, 230, 360);
    imageView.userInteractionEnabled = YES;
    
    [self.view addSubview:imageView];
    
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGes:)];
    [imageView addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer * rot = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotGes:)];
    [imageView addGestureRecognizer:rot];
    
    pinch.delegate = self;
    rot.delegate = self;
}

- (void) pinchGes: (UIPinchGestureRecognizer *) pinch {
    NSLog(@"pinch.scale %f", pinch.scale);
    UIImageView * imageView = (UIImageView *)pinch.view;
    imageView.transform = CGAffineTransformScale(imageView.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}

- (void) rotGes: (UIRotationGestureRecognizer *) rot {
    UIImageView * imageView = (UIImageView *)rot.view;
    imageView.transform = CGAffineTransformRotate(imageView.transform, rot.rotation);
    rot.rotation = 0;
}

#pragma mark:- delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES; //是否允许多个手势同时存在
}

@end
