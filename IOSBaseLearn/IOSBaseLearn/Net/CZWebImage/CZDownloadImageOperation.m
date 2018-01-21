//
//  CZDownloadImageOperation.m
//  02-自定义NSOpeation(掌握)
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZDownloadImageOperation.h"
#import "NSString+Path.h"

@interface CZDownloadImageOperation()
/**
 下载图像的 url 地址
 */
@property (nonatomic, copy) NSString *urlString;

/**
 成功的回调－不要使用 completionBlock
 */
@property (nonatomic, copy) void (^successed)(UIImage *image);
@end

@implementation CZDownloadImageOperation

+ (instancetype)downloadImageOpeartionWithURLString:(NSString *)urlString successed:(void (^)(UIImage *))successed {
    
    CZDownloadImageOperation *op = [[self alloc] init];
    
    // 记录参数
    op.urlString = urlString;
    // block可以当作参数传递
    op.successed = successed;
    
    return op;
}

- (void)main {
    @autoreleasepool {
        NSLog(@"开始下载: %@", self.urlString);
        [NSThread sleepForTimeInterval:2.0];
        
        // 1. 根据 url 下载图像
        if (self.isCancelled) return;
        
        NSURL *url = [NSURL URLWithString:self.urlString];
        // 获取网络上的“二进制”数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 2. 将图像的二进制数据写入沙盒
        if (self.isCancelled) return;
        [data writeToFile:self.urlString.cacheDir atomically:YES];
        
        // 3. 调用回调方法
        if (self.isCancelled) return;
        if (self.successed) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [UIImage imageWithData:data];
                self.successed(image);
            });
        }
    }
}

@end
