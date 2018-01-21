//
//  CZImageView.m
//  02-自定义NSOpeation(掌握)
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZImageView.h"
#import "CZDownloadImageManager.h"

@interface CZImageView()
@property (nonatomic, copy) NSString *urlString;
@end

@implementation CZImageView

/**
 1. 之前没有下载
 2. 之前有下载，还没有完成
    － 设置了一个不同的 URL -> 应该将之前的下载操作取消！
    - 设置了一个相同的 URL ->
 */
- (void)setImageWithURLString:(NSString *)urlString {
    // 0. 判断给定的 URL 和之前的URL是否一致，如果相同，不做任何操作！
    if ([_urlString isEqualToString:urlString]) {
        NSLog(@"地址一致，等待下载结束");
        return;
    }
    
    // 1. 如果更换地址，取消之前的下载 _urlString之前的下载地址
    if (_urlString) {
        [[CZDownloadImageManager sharedDownloadImageManager] cancelDownloadWithURLString:_urlString];
    }

    // 2. 记录住url
    _urlString = urlString;
    
    // 3. 下载图像
    // 3.1 清空图像
    self.image = nil;
    
    // 3.2 真的下载图像
    [[CZDownloadImageManager sharedDownloadImageManager] downloadImageOpeartionWithURLString:urlString successed:^(UIImage *image) {
        self.image = image;
    }];
}

@end
