//
//  ImageThreadViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/16.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageThreadViewController.h"

@interface ImageThreadViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIImage *image;

@end

@implementation ImageThreadViewController

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)loadView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2;
    _scrollView.delegate = self;
    self.view = _scrollView;
    
    UIImageView *iv = [[UIImageView alloc] init];
    _imageView = iv;
    [self.view addSubview:iv];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSThread * t = [[NSThread alloc]initWithTarget:self selector:@selector(downloadWebImage) object:nil];
    [t start];
}

#pragma mark - 下载网络图片
- (void)downloadWebImage {
    
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502861524253&di=7669119116ea2858bd7a3086a6b762ff&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F960a304e251f95ca9eccc614c1177f3e67095252.jpg"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];

    UIImage *image = [UIImage imageWithData:data];

    // "线程间通讯" - 将数据从一个线程传递给另外一个线程，最常见的应用场景，就是后台下载数据，完成之后，在主线程更新UI
    // 更新UI - 提示：不是所有的在后台线程更新UI都会出问题！
    // 但是：一定记住在主线程更新UI，否则会有时候出现很奇怪的现象
    
//    self.image = image;
    [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.scrollView.contentSize = image.size;
}


@end
