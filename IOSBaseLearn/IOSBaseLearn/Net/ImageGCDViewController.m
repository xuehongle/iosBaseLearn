//
//  ImageGCDViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/16.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageGCDViewController.h"

@interface ImageGCDViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIImage *image;

@end

@implementation ImageGCDViewController

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
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502861524253&di=7669119116ea2858bd7a3086a6b762ff&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F960a304e251f95ca9eccc614c1177f3e67095252.jpg"];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            [self.imageView sizeToFit];
            self.scrollView.contentSize = image.size;
        });
    });
}


@end
