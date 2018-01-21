//
//  ImageViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/16.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIImage *image;

@end

@implementation ImageViewController

#pragma mark - UIScrollViewDelegate
// "告诉" scrollView 缩放哪一个视图，就应该有"返回值"
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

/**
 加载视图，和 storyboard & xib 等价的，一旦写了这个方法 storyboard & xib 会实效
 
 创建界面上所有子视图的层次结构！
 */
- (void)loadView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 设置缩放比例
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2;
    // 设置代理
    _scrollView.delegate = self;
    
    self.view = _scrollView;
    
    UIImageView *iv = [[UIImageView alloc] init];
    _imageView = iv;
    [self.view addSubview:iv];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadWebImage];
}

#pragma mark - 下载网络图片
- (void)downloadWebImage {
    
//    “App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app’s Info.plist file”
//    1、在Info.plist中添加 NSAppTransportSecurity 类型 Dictionary ;
//    2、在 NSAppTransportSecurity 下添加 NSAllowsArbitraryLoads 类型Boolean ,值设为 YES;
    // 确定网络上唯一的资源
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502861524253&di=7669119116ea2858bd7a3086a6b762ff&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F960a304e251f95ca9eccc614c1177f3e67095252.jpg"];
    
    // 加载图片数据->所有网络上传输的都是"二进制数据"
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // 将二进制数据转换成图像
    UIImage *image = [UIImage imageWithData:data];
    
    // 更新UI
    self.image = image;
}

- (void)setImage:(UIImage *)image {
    // 设置图像视图
    self.imageView.image = image;
    // 调整图像视图大小和image一样
    [self.imageView sizeToFit];
    
    // 指定滚动视图的范围
    self.scrollView.contentSize = image.size;
}

@end
