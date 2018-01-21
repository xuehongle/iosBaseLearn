//
//  NSString+Path.m
//  01-沙盒路径
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

- (NSString *)cacheDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)docDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)tmpDir {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
