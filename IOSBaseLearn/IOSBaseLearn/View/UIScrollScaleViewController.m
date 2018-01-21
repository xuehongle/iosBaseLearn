//
//  UIScrollScaleViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/12/10.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIScrollScaleViewController.h"

@interface UIScrollScaleViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *datuImg;

@end

@implementation UIScrollScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 3.5;
    self.scrollView.minimumZoomScale = 0.5;
}

// 实现缩放方法, 在这个方法中返回要进行缩放的子控件（这个方法在缩放前就会被调用）
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.datuImg;
}

// 即将开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"scrollViewWillBeginZooming");
}

// 正在缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidZoom");
}

// 缩放完毕
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"scrollViewDidEndZooming");
}

@end
