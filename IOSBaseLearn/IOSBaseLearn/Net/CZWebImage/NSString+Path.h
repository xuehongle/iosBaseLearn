//
//  NSString+Path.h
//  01-沙盒路径
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

/**
 返回拼接了缓存目录的完整路径
 */
- (NSString *)cacheDir;

/**
 返回拼接了文档目录的完整路径
 */
- (NSString *)docDir;

/**
 返回拼接了临时目录的完整路径
 */
- (NSString *)tmpDir;

@end
