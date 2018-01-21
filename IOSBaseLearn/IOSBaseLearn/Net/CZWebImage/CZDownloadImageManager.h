//
//  CZDownloadImageManager.h
//  02-自定义NSOpeation(掌握)
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 负责全局的所有图片下载工作，单例！
 
 职责：
 1. 管理所有的下载操作！
 2. 管理所有的下载操作缓存！
 3. 管理所有下载完成的图像缓存！
 
 4. 应该提供一个下载接口！
 */
@interface CZDownloadImageManager : NSObject

+ (instancetype)sharedDownloadImageManager;

/**
 下载指定 URL 的图像
 */
- (void)downloadImageOpeartionWithURLString:(NSString *)urlString successed:(void (^) (UIImage *image))successed;

/**
 取消指定 URL 的图像下载
 */
- (void)cancelDownloadWithURLString:(NSString *)urlString;

/**
 内存清理工作 
 */
- (void)clearMemory;

@end
