//
//  CZDownloadImageManager.m
//  02-自定义NSOpeation(掌握)
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZDownloadImageManager.h"
#import "CZDownloadImageOperation.h"
#import "NSString+Path.h"

@interface CZDownloadImageManager()
/**
 *  全局队列，管理所有的下载操作
 */
@property (nonatomic, strong) NSOperationQueue *opQueue;

/**
 *  下载操作缓冲池
 */
@property (nonatomic, strong) NSMutableDictionary *operationsCache;

/**
 *  图像缓存池
 */
@property (nonatomic, strong) NSMutableDictionary *imagesCache;
@end

@implementation CZDownloadImageManager

+ (instancetype)sharedDownloadImageManager {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - 下载图像
- (void)downloadImageOpeartionWithURLString:(NSString *)urlString successed:(void (^)(UIImage *))successed {
    
    // 0. 判断内存中是否有图像
    if (self.imagesCache[urlString] && successed) {
        NSLog(@"从内存加载图像");
        
        // 直接回调，不再继续
        successed(self.imagesCache[urlString]);

        return;
    } else {
        // 判断沙盒中是否有图像
        UIImage *image = [UIImage imageWithContentsOfFile:urlString.cacheDir];
        if (image && successed) {
            NSLog(@"从磁盘加载！");
            // 在内存缓存中记录图像
            [self.imagesCache setObject:image forKey:urlString];
            
            // 回调
            successed(image);
            
            return;
        }
    }
    
    // 0. 判断是否已经下载，如果已经下载
    if (self.operationsCache[urlString]) {
        NSLog(@"正在玩命下载中...稍安勿躁 %@", self.operationsCache);
        return;
    }
    
    // 1. 定义一个下载操作 － 块代码是预先定义的代码块，可以被当作参数传递！
    CZDownloadImageOperation *downloadOp = [CZDownloadImageOperation downloadImageOpeartionWithURLString:urlString successed:^(UIImage *image) {
        
        // 将图像添加到缓存
        if (image) {
            [self.imagesCache setObject:image forKey:urlString];
        }
        
        // 下载完成之后，删除操作缓存
        [self.operationsCache removeObjectForKey:urlString];
        
        if (successed) {
            successed(image);
        }
    }];
    
    // 2. 将操作添加到操作缓存
    [self.operationsCache setObject:downloadOp forKey:urlString];
    
    // 3. 将下载操作添加到队列
    [self.opQueue addOperation:downloadOp];
}

- (void)cancelDownloadWithURLString:(NSString *)urlString {
    NSLog(@"取消操作： %@", urlString);
    
    // 1. 从缓冲池中取出操作
    CZDownloadImageOperation *op = self.operationsCache[urlString];
    
    // 2. 取消下载操作
    [op cancel];
    
    // 3. 从缓冲池中删除操作
    [self.operationsCache removeObjectForKey:urlString];
}

- (void)clearMemory {
    // 1. 清除缓冲区
    [self.operationsCache removeAllObjects];
    [self.imagesCache removeAllObjects];
    
    // 2. 取消所有没有完成的下载操作
    [self.opQueue cancelAllOperations];
}

#pragma mark - 懒加载
- (NSMutableDictionary *)imagesCache {
    if (_imagesCache == nil) {
        _imagesCache = [[NSMutableDictionary alloc] init];
    }
    return _imagesCache;
}

- (NSMutableDictionary *)operationsCache {
    if (_operationsCache == nil) {
        _operationsCache = [[NSMutableDictionary alloc] init];
    }
    return _operationsCache;
}

- (NSOperationQueue *)opQueue {
    if (_opQueue == nil) {
        _opQueue = [[NSOperationQueue alloc] init];
        
        // 设置最大并发数
        _opQueue.maxConcurrentOperationCount = 2;
    }
    return _opQueue;
}

@end
